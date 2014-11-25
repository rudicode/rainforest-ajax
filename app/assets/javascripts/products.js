// products.js
$(document).on('ready page:load',function(){
  $('#products_list').text('The Product Listing'); // change the header
  $('#search-form').submit( function (event){
    event.preventDefault();
    var searchValue = $('#search').val();
    //console.log(searchValue);
    // $.ajax({
    //   url: '/products?search=' + searchValue,
    //   type: 'GET',
    //   dataType: 'script'
    // })
    $.getScript('/products?search=' + searchValue)
    //.done(function( data ){
    //  $('#products').html(data);
    //});
  });

  // do infinate scrolling
  $(window).scroll(function() {
    if ($(window).scrollTop() >  ($(document).height() - $(window).height() - 50)) {
      console.log("Near Bottom!!");
    }
  });
});
