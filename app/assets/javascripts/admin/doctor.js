const SEARCH_KEY = 'search';

$(document).on('turbolinks:load', () => {
  $('#search-doctor').submit(event => {
    event.preventDefault();
    let searchKey = encodeURIComponent($('#search-input').val());
<<<<<<< HEAD
    location.href = urlAddParameter(location.href, SEARCH_KEY, searchKey);
  });
});
=======
    location.href = URL_add_parameter(location.href, SEARCH_KEY, searchKey);
  });
});

>>>>>>> User list
