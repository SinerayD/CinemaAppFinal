let signup = document.querySelector(".signup");
let login = document.querySelector(".login");
let slider = document.querySelector(".slider");
let formSection = document.querySelector(".form-section");

signup.addEventListener("click", () => {
	slider.classList.add("moveslider");
	formSection.classList.add("form-section-move");
});

login.addEventListener("click", () => {
	slider.classList.remove("moveslider");
	formSection.classList.remove("form-section-move");
});



    function togglePasswordVisibility() {
        var passwordInput = document.getElementById("password");
        var toggleButton = document.getElementById("togglePassword");
        
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            toggleButton.classList.remove("bi-eye-slash");
            toggleButton.classList.add("bi-eye");
        } else {
            passwordInput.type = "password";
            toggleButton.classList.remove("bi-eye");
            toggleButton.classList.add("bi-eye-slash");
        }
    }
	
	function showLogin() {
		document.querySelector('.btn .login').classList.add('active', 'underline-login');
		document.querySelector('.btn .signup').classList.remove('active', 'underline-signup');
	}
	
	function showSignup() {
		document.querySelector('.btn .signup').classList.add('active', 'underline-signup');
		document.querySelector('.btn .login').classList.remove('active', 'underline-login');
	}
	


	document.addEventListener("DOMContentLoaded", function () {
		const togglePasswordIcons = document.querySelectorAll(".toggle-password-r");
	
		togglePasswordIcons.forEach(icon => {
			icon.addEventListener("click", () => {
				const targetId = icon.getAttribute("data-target");
				const passwordInput = document.getElementById(targetId);
	
				if (passwordInput.type === "password") {
					passwordInput.type = "text";
					icon.classList.remove("bi-eye-slash");
					icon.classList.add("bi-eye");
				} else {
					passwordInput.type = "password";
					icon.classList.remove("bi-eye");
					icon.classList.add("bi-eye-slash");
				}
			});
		});
	});
	

	document.addEventListener("DOMContentLoaded", function () {
		const togglePasswordIcons = document.querySelectorAll(".toggle-password");
	
		togglePasswordIcons.forEach(icon => {
			icon.addEventListener("click", () => {
				const targetId = icon.getAttribute("data-target");
				const passwordInput = document.getElementById(targetId);
	
				if (passwordInput.type === "password") {
					passwordInput.type = "text";
					icon.classList.remove("bi-eye-slash");
					icon.classList.add("bi-eye");
				} else {
					passwordInput.type = "password";
					icon.classList.remove("bi-eye");
					icon.classList.add("bi-eye-slash");
				}
			});
		});
	
		const loginButton = document.querySelector(".clkbtn");
		loginButton.addEventListener("click", function (event) {
			const emailInput = document.getElementById("username-email");
			const passwordInput = document.getElementById("password");
			const errorWrapper = document.querySelector(".alert-wrapper");
	
			if (emailInput.value.trim() === "" && passwordInput.value.trim() === "") {
				showError("Please fill all the fields");
				event.preventDefault();
			}
			if ( passwordInput.value.trim() === "") {
				showError("Password is required");
				event.preventDefault();
			}
			if (emailInput.value.trim() === "" ) {
				showError("Username or email is required");
				event.preventDefault();
			}
		});
	
		function showError(errorMessage) {
			const errorList = document.querySelector(".error-message");
			errorList.innerHTML = `<li><strong><i id="boot-icon" class="bi bi-exclamation-circle" style="font-size: 23px; margin-right: 5px; color: rgb(165, 42, 42);"></i> Error:</strong> ${errorMessage}</li>`;
			const errorWrapper = document.querySelector(".alert-wrapper");
			errorWrapper.style.display = "block";
		}
	});
