document.addEventListener('DOMContentLoaded', function() {
  const dateFilterBtns = document.querySelectorAll('.date-filter-btn');
  const dateSelect = document.getElementById('dateSelect');
  const cinemaSelect = document.getElementById('cinemaSelect');
  const languageSelect = document.getElementById('languageSelect');
  const sessions = document.querySelectorAll('#sessions-tbody tr');

  function filterSessions() {
    const selectedDate = dateSelect.value;
    const selectedCinema = cinemaSelect.value;
    const selectedLanguage = languageSelect.value;

    sessions.forEach(session => {
      const sessionDate = session.dataset.date;
      const sessionCinema = session.dataset.cinema;
      const sessionLanguage = session.dataset.language;
      const isDateVisible = selectedDate === 'all' || sessionDate === selectedDate;
      const isCinemaVisible = selectedCinema === 'All' || sessionCinema === selectedCinema;
      const isLanguageVisible = selectedLanguage === 'All' || sessionLanguage === selectedLanguage;

      const isVisible = isDateVisible && isCinemaVisible && isLanguageVisible;

      session.style.display = isVisible ? 'table-row' : 'none';
    });
  }

  dateFilterBtns.forEach(btn => {
    btn.addEventListener('click', function(e) {
      e.preventDefault();
      const filter = this.dataset.filter;

      if (filter === 'today') {
        dateSelect.value = '22.08.2023'; 
        filterSessions();
      } else if (filter === 'tomorrow') {
        dateSelect.value = '23.08.2023'; 
        filterSessions();
      }
    });
  });

  dateSelect.addEventListener('change', filterSessions);
  cinemaSelect.addEventListener('change', filterSessions);
  languageSelect.addEventListener('change', filterSessions);
});

