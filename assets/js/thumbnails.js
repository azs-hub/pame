(function( $ ) {
 
  $.fn.productCover = function() {

    var cover = $('.js-qv-product-cover');
    var thumbnails = $('.js-qv-mask li img');
    
    thumbnails.click(function() {
      var img = $(this).attr('data-image-large-src');
      if(cover.attr('src') != img){
        cover.attr('src', img);
      }
    })

    return this;

  };
 
}( jQuery ));
 
$( ".product-cover" ).productCover();