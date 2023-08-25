document.addEventListener('DOMContentLoaded', () => {
    let currentImage = 0;
    const images = document.querySelectorAll('.carousel img');
    const totalImages = images.length;

    images[currentImage].classList.add('active');

    setInterval(() => {
        images[currentImage].classList.remove('active');
        currentImage = (currentImage + 1) % totalImages;
        images[currentImage].classList.add('active');
    }, 3000);
});


