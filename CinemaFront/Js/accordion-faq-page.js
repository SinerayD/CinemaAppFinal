document.addEventListener("DOMContentLoaded", function () {
    const navLinks = document.querySelectorAll('.nav-link');
    const faqSections = document.querySelectorAll('.faq-section');
  
    navLinks.forEach(link => {
      link.addEventListener('click', (event) => {
        event.preventDefault();
        const sectionId = link.getAttribute('data-section');
  
        faqSections.forEach(section => {
          section.style.display = 'none';
        });
  
        const targetSection = document.getElementById(sectionId);
        targetSection.style.display = 'block';
      });
    });
  
    const accordionButtons = document.querySelectorAll('.accordion-button');
  
    accordionButtons.forEach(button => {
      
      const accordionItem = button.closest('.accordion-item');
      const content = accordionItem.querySelector('.accordion-content');
      content.style.maxHeight = '0';
      accordionItem.classList.remove('active');
  
      button.addEventListener('click', () => {
        const isExpanded = button.getAttribute('aria-expanded') === 'true';
        button.setAttribute('aria-expanded', !isExpanded);
  
        accordionItem.classList.toggle('active');
  
        if (!isExpanded) {
          content.style.maxHeight = content.scrollHeight + 'px';
        } else {
          content.style.maxHeight = '0';
        }
      });
    });
  
    // Get menu items
    const menuItems = document.querySelectorAll('.sidebar-nav .nav-link');
  
    menuItems.forEach(item => {
      item.addEventListener('click', function(event) {
        event.preventDefault();
        const section = this.getAttribute('data-section');
  
        faqSections.forEach(section => {
          section.style.display = 'none';
        });
  
        const targetSection = document.getElementById(section);
        targetSection.style.display = 'block';
  
        menuItems.forEach(link => {
          link.classList.remove('active');
        });
  
        this.classList.add('active');
      });
    });
  });