const togglePassword = document.querySelector('.toggle-password');
const passwordInput = document.querySelector('#password'); // Use the correct selector

togglePassword.addEventListener('click', () => {
    console.log('Toggle Password Button Clicked');

    if (passwordInput.type === 'password') {
        console.log('Password Input: Changing to text');
        passwordInput.type = 'text';
        togglePassword.style.fill = 'gray';
    } else {
        console.log('Password Input: Changing to password');
        passwordInput.type = 'password';
        togglePassword.style.fill = 'currentColor';
    }
});

const togglePasswordR = document.querySelector('.toggle-password-r');
const confirmInput = document.querySelector('#confirmPassword'); // Use the correct selector

togglePasswordR.addEventListener('click', () => {
    console.log('Toggle Confirm Password Button Clicked');

    if (confirmInput.type === 'password') {
        console.log('Confirm Password Input: Changing to text');
        confirmInput.type = 'text';
        togglePasswordR.style.fill = 'gray';
    } else {
        console.log('Confirm Password Input: Changing to password');
        confirmInput.type = 'password';
        togglePasswordR.style.fill = 'currentColor';
    }
});
