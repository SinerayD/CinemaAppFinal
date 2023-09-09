window.addEventListener('DOMContentLoaded', (event) => {
    const textarea = document.querySelector('.your-message textarea');

    textarea.addEventListener('focus', (event) => {
      event.target.removeAttribute('placeholder');
    });

    textarea.addEventListener('blur', (event) => {
      if (!event.target.value) {
        event.target.setAttribute('placeholder', 'Write A comment');
      }
    });
  });
