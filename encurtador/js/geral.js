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