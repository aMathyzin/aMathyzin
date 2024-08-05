  // Adicionando eventos de contexto personalizado
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
<audio id="myaudio">
  <source src="./lofi.mp3" type="audio/mp3">
</audio>
  const audio = document.getElementById('myaudio');
  const audioCheckbox = document.getElementById('audio-checkbox');

  audioCheckbox.addEventListener('change', () => {
    if (audioCheckbox.checked) {
      audio.play();
    } else {
      audio.pause();
    }
  });

  document.addEventListener("DOMContentLoaded", function () {
    setTimeout(function () {
      const loaderWrapper = document.querySelector(".loader-wrapper");
      loaderWrapper.style.display = "none";
    }, 2000);
  });

  if (window.innerWidth <= 767) {
    const iframe = document.getElementById("video-iframe");
    iframe.width = "100%"; 
    iframe.height = "auto"; 
  }

  const scrollLeftButton = document.getElementById('scroll-left');
  const scrollRightButton = document.getElementById('scroll-right');
  const projectsContainer = document.getElementById('projects-container');
  const projects = document.querySelectorAll('.project');

  let currentProjectIndex = 1;

  function updateProjects() {
    projects.forEach((project, index) => {
      project.classList.remove('center', 'blur');
      if (index === currentProjectIndex) {
        project.classList.add('center');
      } else {
        project.classList.add('blur');
      }
    });
  }

  scrollLeftButton.addEventListener('click', () => {
    currentProjectIndex = (currentProjectIndex === 0) ? projects.length - 1 : currentProjectIndex - 1;
    updateProjects();
  });

  scrollRightButton.addEventListener('click', () => {
    currentProjectIndex = (currentProjectIndex === projects.length - 1) ? 0 : currentProjectIndex + 1;
    updateProjects();
  });

  updateProjects();

  const loaderWrapper = document.querySelector(".loader-wrapper");
  const rocketWrapper = document.querySelector(".rocket-wrapper");

  document.addEventListener("DOMContentLoaded", function () {
    setTimeout(function () {
      loaderWrapper.style.opacity = "0"; 
      setTimeout(function () {
        loaderWrapper.style.display = "none"; 
      }, 1000); 


      rocketWrapper.style.display = "flex";
      setTimeout(function () {
        rocketWrapper.style.opacity = "0";
        setTimeout(function () {
          rocketWrapper.style.display = "none"; 
        }, 1000); 
      }, 2000); 
    }, 2000); 
  });
  // Define googlefc and the controlled messaging function on the Window.
  window.googlefc = window.googlefc || {};
  googlefc.controlledMessagingFunction = async (message) => {
    // Determine if the user is a subscriber asynchronously.
    const isSubscriber = await determineIfUserIsSubscriber();

    if (isSubscriber) {
      // If the user is a subscriber, don't show any messages.
      message.proceed(false);
    } else {
      // Otherwise, show messages as usual.
      message.proceed(true);
    }
  }
