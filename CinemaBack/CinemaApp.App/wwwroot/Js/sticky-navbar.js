//Sticky Navbar
const navbar = document.querySelector('.navbar_container');

window.addEventListener('scroll', () => {
  if (window.scrollY > 0) {
    navbar.style.backgroundColor = 'black';
  } else {
    navbar.style.backgroundColor = 'transparent';
  }
});
