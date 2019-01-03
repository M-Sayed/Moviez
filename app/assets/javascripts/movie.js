var AddToFavorite = function(ele, movie_id) {
  $.ajax({
    url: '/favorite',
    method: 'POST',
    data: { movie_id: movie_id },
    success: function(data) {
      $(ele).children().first().attr('src', asset_path('star-on.png'));
      $(ele).attr('onclick', "RemoveToFavorite(this,"+ movie_id +")");
      console.log('success');
    },
    error: function(data) {
      console.log('error');
    }
  });
};

var RemoveToFavorite = function(ele, movie_id) {
  $.ajax({
    url: '/unfavorite',
    method: 'POST',
    data: { movie_id: movie_id },
    success: function(data) {
      $(ele).children().first().attr('src', asset_path('star-off.png'));
      $(ele).attr('onclick', "AddToFavorite(this,"+ movie_id +")");
      console.log('success');
    },
    error: function(data) {
      console.log('error');
    }
  });
};
