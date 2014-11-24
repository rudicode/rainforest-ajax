// products.js
$(document).on('ready page:load',function(){
  $('#products_list').text('The Product Listing'); // change the header
  $('#search-form').submit( function (event){
    event.preventDefault();
    var searchValue = $('#search').val();
    //console.log(searchValue);
    $.ajax({
      url: '/products?search=' + searchValue,
      type: 'GET',
      dataType: 'html'
    }).done(function( data ){
      $('#products').html(data);
    });
  });
});
