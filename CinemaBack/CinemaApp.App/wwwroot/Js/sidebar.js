const menuItems = document.querySelectorAll('.sidebar-nav .nav-link');
const contentContainer = document.querySelector('.content');

menuItems.forEach(item => {
    item.addEventListener('click', function(event) {
        event.preventDefault();
        const section = this.getAttribute('data-section');
        loadSectionContent(section);

       
        menuItems.forEach(link => {
            link.classList.remove('active');
        });

        this.classList.add('active');
    });
});



function loadSectionContent(section) {

    contentContainer.innerHTML = '';

   
    const sectionContent = document.createElement('div');
    sectionContent.classList.add('section-content');


    let contentHTML = '';
    switch (section) {
        case 'dashboard':
            contentHTML = `
                <p class="dashboard-text">Hello <span class="username">sineraytd</span> (not <span class="username">sineraytd</span> <a href="#" class="logout-link">Log out</a>)</p>
                <p class="dashboard-text">From your account dashboard you can view your <a href="#" class="orange-link">recent orders</a>, manage your <a href="#" class="orange-link">shipping and billing addresses</a>, and <a href="#" class="orange-link">edit your password and account details</a>.</p>
            `;
            break;
        case 'orders':
            contentHTML = `
                <div class="info-container">
                    <p>No orders have been made yet.</p>
                    <button class="orange-button"><a href="#">Browse products</a></button>
                </div>
            `;
            break;
        case 'addresses':
            contentHTML = `
                <div class="info-container">
                    <h2>Shipping Address</h2>
                    <a class="add-link orange-link" href="#">Add</a>
                    <div class="shipping-form" style="display: none;">
                    <div class="form">
    
                    <div class="fields fields--2">
                      <label class="field">
                        <span class="field__label" for="firstname">First name</span>
                        <input class="field__input" type="text" id="firstname" value="John" />
                      </label>
                      <label class="field">
                        <span class="field__label" for="lastname">Last name</span>
                        <input class="field__input" type="text" id="lastname" value="Doe" />
                      </label>
                    </div>
                    <label class="field">
                      <span class="field__label" for="address">Address</span>
                      <input class="field__input" type="text" id="address" />
                    </label>
                    <label class="field">
                      <span class="field__label" for="country">Country</span>
                      <select class="field__input" id="country">
                        <option value=""></option>
                        <option value="unitedstates">United States</option>
                      </select>
                    </label>
                    <div class="fields fields--3">
                      <label class="field">
                        <span class="field__label" for="zipcode">Zip code</span>
                        <input class="field__input" type="text" id="zipcode" />
                      </label>
                      <label class="field">
                        <span class="field__label" for="city">City</span>
                        <input class="field__input" type="text" id="city" />
                      </label>
                      <label class="field">
                        <span class="field__label" for="state">State</span>
                        <select class="field__input" id="state">
                          <option value=""></option>
                        </select>
                      </label>
                    </div>
                    </div>
                    <hr>
                    <button class="button">Continue</button>
                  </div>
                    </div>
                </div>
            `;
            break;
        case 'account':
            contentHTML = '<h2>Account Details</h2><p>Edit your account information.</p>';
            break;
        case 'logout':
            contentHTML = '<h2>Logged Out</h2><p>You have been successfully logged out.</p>';
            break;
        default:
            contentHTML = '<h2>Section Not Found</h2><p>The selected section does not exist.</p>';
            break;
    }

    sectionContent.innerHTML = contentHTML;
    contentContainer.appendChild(sectionContent);
}

// Function to handle the "Add" link click in Shipping Addresses
document.addEventListener('click', function(event) {
    if (event.target.classList.contains('add-link')) {
        event.preventDefault();
        const shippingForm = document.querySelector('.shipping-form');
        shippingForm.style.display = 'block';
    }
});

