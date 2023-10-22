const express = require('express');
const { createServer } = require('http');
const { Server } = require('socket.io');
const dotenv = require('dotenv');
const moment = require('moment');
const fs = require('fs');
const path = require('path');
const geoip = require('geoip-lite');

dotenv.config();

const logFilePath = path.join(__dirname, 'logs.txt');
let lastConnectionTimes = {};
let isBotStable = true;

const app = express();
const server = createServer(app);
const io = new Server(server);
const port = process.env.PORT || 3000;

// Configuração do servidor web

// Defina a pasta 'public' como o diretório de arquivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Rota inicial do site
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Rota para a página de downloads com URL amigável
app.get('/downloads', (req, res) => {
  res.sendFile(path.join(__dirname, 'downloads'));
});

// Rota para qualquer outra página
app.get('/:page', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

io.on('connection', (socket) => {
  const clientIp = socket.handshake.headers['x-forwarded-for'] || socket.handshake.address;
  const geo = geoip.lookup(clientIp);
  const country = geo ? geo.country : 'Desconhecido';
  const timestamp = moment().format('HH:mm DD/MM/YYYY');
  const isNewUser = !lastConnectionTimes.hasOwnProperty(clientIp);

  console.log(`Um cliente se conectou. IP: ${clientIp} (${country}) (${timestamp})${isNewUser ? ' (NOVO USUÁRIO)' : ''}`);

  if (isNewUser) {
    lastConnectionTimes[clientIp] = moment();
    const newUserMessage = `Um cliente se conectou. IP: ${clientIp} (${country}) (${timestamp}) (NOVO USUÁRIO)\n`;
    fs.appendFile(logFilePath, newUserMessage, (err) => {
      if (err) {
        console.error('Erro ao salvar a mensagem de novo usuário no arquivo de logs:', err);
      }
    });
  } else {
    const currentTime = moment();
    const lastConnectionTime = lastConnectionTimes[clientIp];
    const timeDifference = moment.duration(currentTime.diff(lastConnectionTime));
    const minutesDifference = timeDifference.asMinutes();

    if (minutesDifference >= 30) {
      lastConnectionTimes[clientIp] = moment();
      const repeatedUserMessage = `Um cliente se conectou. IP: ${clientIp} (${country}) (${timestamp})\n`;
      fs.appendFile(logFilePath, repeatedUserMessage, (err) => {
        if (err) {
          console.error('Erro ao salvar a mensagem de usuário repetido no arquivo de logs:', err);
        }
      });
    }
  }

  socket.on('disconnect', () => {
    console.log(`Um cliente se desconectou. IP: ${clientIp}`);
  });
});

server.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});
