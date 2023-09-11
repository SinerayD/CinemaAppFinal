function filterMovies(category) {
    
      var movies = document.querySelectorAll('.all');
  
      movies.forEach(function (movie) {
       
        if (category === 'all' || movie.classList.contains(category)) {
          movie.style.display = 'block'; 
        } else {
          movie.style.display = 'none'; 
        }
      });
    }

    var categories = document.querySelectorAll('.category');
    categories.forEach(function (category) {
      category.addEventListener('click', function () {
    
        categories.forEach(function (cat) {
          cat.classList.remove('active');
        });

        category.classList.add('active');
  
        var selectedCategory = category.getAttribute('data-filter');

        filterMovies(selectedCategory);
      });
    });

    filterMovies('all');
