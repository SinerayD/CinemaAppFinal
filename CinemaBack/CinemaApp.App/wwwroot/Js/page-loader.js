document.addEventListener("DOMContentLoaded", function() {
    const loaderContainer = document.getElementById("loader-container");
    const pageContent = document.getElementById("pageContent");

    setTimeout(function() {
        loaderContainer.style.display = "none";
        pageContent.classList.add("fade-in"); 
    }, 1000); 
});
