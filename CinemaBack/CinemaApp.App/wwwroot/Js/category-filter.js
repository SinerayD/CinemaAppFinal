// Function to filter movies by category
function filterMovies(category) {
    // Get all movie elements
    var movies = document.querySelectorAll('.all');

    // Loop through each movie
    movies.forEach(function (movie) {
        // Check if the movie has the selected category or if the category is "all"
        if (category === 'all' || movie.querySelector('.category-' + category)) {
            movie.style.display = 'block'; // Show the movie
        } else {
            movie.style.display = 'none'; // Hide the movie
        }
    });
}

// Add click event listeners to filter categories
var categories = document.querySelectorAll('.category');
categories.forEach(function (category) {
    category.addEventListener('click', function () {
        // Remove the 'active' class from all categories
        categories.forEach(function (cat) {
            cat.classList.remove('active');
        });

        // Add the 'active' class to the clicked category
        category.classList.add('active');

        // Get the data-filter attribute value of the clicked category
        var selectedCategory = category.getAttribute('data-filter');

        // Call the filterMovies function with the selected category
        filterMovies(selectedCategory);
    });
});

// Initially, display all movies
filterMovies('all');