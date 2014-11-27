// products.js
$(document).on('ready page:load',function(){
  $('#products_list').text('The Product Listing'); // change the header
  $('#search-form').submit( function (event){
    event.preventDefault();
    var searchValue = $('#search').val();

    $.getScript('/products?search=' + searchValue + "&test=testing")
    
  });

  // do infinate scrolling
  if ($('.pagination').length) {

    $(window).scroll(function() {
      var url = $('.pagination span.next').children().attr('href');
      if (url && $(window).scrollTop() >  ($(document).height() - $(window).height() - 50)) {
        console.log($('.pagination span.next').children().attr('href'));
        $('.pagination').text('Getting more results...');
        return $.getScript(url);
      }
    });
  }

  $('#new_review').on('ajax:beforeSend', function() {
    if ( $('#review_comment').val().length > 0 ) {
      $('input[type=submit]').val('Adding Review...').attr('disabled', 'disabled');
    } else {
      return false; // stop ajax request if textbox is empty.
    }

  });

  $('#new_review').on('ajax:complete', function() {
    $('input[type=submit]').val('Create Review').removeAttr('disabled');
  });

});
