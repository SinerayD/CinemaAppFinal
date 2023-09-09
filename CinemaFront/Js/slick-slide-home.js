//Slick Slide
$(document).ready(function() {
 
    $(".slider-nav").slick({
      slidesToShow: 4,  
      slidesToScroll: 1,
      dots: true,
      centerMode: true,
      focusOnSelect: true,
      autoplay: true,
      autoplaySpeed: 2000,
      onAfterChange: function(currentSlide) {
        $(".slider-nav .slick-slide").removeClass("active");
        $(".slider-nav .slick-slide").eq(currentSlide).addClass("active");
      }
    });
  
  });

  var modal = document.querySelector(".modal");
  var modalImage = document.getElementById("modal-image");
  
  var slideImages = document.querySelectorAll(".slide img");
  
  slideImages.forEach(function (image) {
    image.addEventListener("click", function () {
      modal.style.display = "block";
      modalImage.src = this.src;
      document.body.classList.add("modal-open");
    });
  });
  
  var closeModal = document.querySelector(".close");
  closeModal.addEventListener("click", function () {
    closeModalFunction();
  });
  
  window.addEventListener("click", function (event) {
    if (event.target === modal) {
      closeModalFunction();
    }
  });
  
  window.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
      closeModalFunction();
    }
  });
  
  function closeModalFunction() {
    modal.style.display = "none";
    document.body.classList.remove("modal-open");
  }
  
  