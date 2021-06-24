(function( $ ) {
 
  $.fn.productCover = function() {

    var cover = $('.js-qv-product-cover');
    var thumbnails = $('.js-qv-mask li img');

    thumbnails.on("click", function() {
      var img = $(this).attr('data-image-large-src');
      console.log('thumbnails js');
      if(cover.attr('src') != img){
        cover.attr('src', img);
        console.log('thumbnails js _ cover change');
      }
    });

    return this;

  };
 
}( jQuery ));
 
$( ".product-cover" ).productCover();

prestashop.on(
  'updateProduct',
  function (event) {
      setTimeout(function(){ $( ".product-cover" ).productCover(); }, 2000);
  }
);