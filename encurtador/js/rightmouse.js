document.addEventListener('contextmenu', function (event) {
  event.preventDefault();
  const contextMenu = document.getElementById('custom-context-menu');
  contextMenu.style.top = `${event.clientY}px`;
  contextMenu.style.left = `${event.clientX}px`;
  contextMenu.style.display = 'block';
});

document.addEventListener('click', function () {
  const contextMenu = document.getElementById('custom-context-menu');
  contextMenu.style.display = 'none';
});

document.getElementById('open-youtube').addEventListener('click', function () {
  window.open('https://www.youtube.com/@aMathyzin', '_blank');
});

// Garantir que o evento de contexto personalizado seja aplicado a todo o documento
document.body.addEventListener('contextmenu', function (event) {
  event.preventDefault();
  const contextMenu = document.getElementById('custom-context-menu');
  contextMenu.style.top = `${event.clientY}px`;
  contextMenu.style.left = `${event.clientX}px`;
  contextMenu.style.display = 'block';
});

// Fechar o menu de contexto personalizado ao clicar fora dele
document.addEventListener('click', function (event) {
  const contextMenu = document.getElementById('custom-context-menu');
  if (event.button !== 2) { // Exclui clique direito do fechamento do menu
    contextMenu.style.display = 'none';
  }
});