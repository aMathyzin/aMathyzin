 
document.addEventListener("DOMContentLoaded", function () {
  function getRandomImage(images) {
    const randomIndex = Math.floor(Math.random() * images.length);
    return images[randomIndex];
  }

  const images = [
    { src: 'freelasells.png', url: 'https://freelasells.shop', glowColor: 'rgba(226, 220, 227, 0.5)' },
    { src: 'anuncie.png', url: 'https://amathyzin.tech/test', glowColor: 'rgba(0, 108, 255, 0.5)' }
    
  ]; 

  const adLeft = document.getElementById('cod-left');
  const adRight = document.getElementById('cod-right');

  function setRandomImage(adElement, image) {
    const aElement = document.createElement('a');
    aElement.href = image.url;
    aElement.target = '_blank';
    aElement.style.setProperty('--glow-color', image.glowColor); 
    const imgElement = document.createElement('img');
    imgElement.src = 'images/' + image.src;
    imgElement.alt = 'Anúncio';

    aElement.appendChild(imgElement);
    adElement.innerHTML = ''; 
    adElement.appendChild(aElement);

    const adButton = document.createElement('button');
    adButton.textContent = 'Anuncie conosco';
    adButton.onclick = function() {
      window.location.href = 'https://amathyzin.tech/anunciantes/embreve'; 
    };
    adButton.style.display = 'block';
    adButton.style.marginTop = '10px';
    adButton.style.padding = '5px 10px';
    adButton.style.backgroundColor = '#007BFF';
    adButton.style.color = 'white';
    adButton.style.border = 'none';
    adButton.style.cursor = 'pointer';

    adElement.appendChild(adButton);
  }


  const leftImage = getRandomImage(images);
  setRandomImage(adLeft, leftImage);

  const remainingImages = images.filter(image => image.src !== leftImage.src);

  const rightImage = getRandomImage(remainingImages);
  setRandomImage(adRight, rightImage);

  console.log('Imagens carregadas:', { leftImage, rightImage });
});
