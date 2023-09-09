//Slider
let slideIndex = 0;
showSlides();

function showSlides() {
    const slides = document.querySelectorAll(".slideshow"); 
    const slideContainer = document.querySelector(".slides");
    const slideWidth = slides[0].clientWidth; 

    slideIndex++;

    if (slideIndex > slides.length) { 
        slideIndex = 1;
    }

    const newPosition = -slideWidth * (slideIndex - 1);

    slideContainer.style.transform = `translateX(${newPosition}px)`;

    setTimeout(showSlides, 3000); 
}
