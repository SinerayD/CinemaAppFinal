const searchIcon = document.getElementById("searchIcon");
const searchModal = document.getElementById("searchModal");
const closeModalButton = document.getElementById("closeModalButton");

searchIcon.addEventListener("click", () => {
  searchModal.style.display = "block";
  setTimeout(() => {
    searchModal.style.height = "100vh";
  }, 10);
});

// Close the modal when clicking the close button
closeModalButton.addEventListener("click", () => {
  searchModal.style.height = "0";
  setTimeout(() => {
    searchModal.style.display = "none";
  }, 500);
});

// Close the modal when clicking anywhere inside the modal overlay
searchModal.addEventListener("click", (event) => {
  if (event.target === searchModal) {
    searchModal.style.height = "0";
    setTimeout(() => {
      searchModal.style.display = "none";
    }, 500);
  }
});