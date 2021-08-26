(function( $ ) {
 
  $.fn.productCover = function() {

    var cover = $('.js-qv-product-cover');
    var thumbnails = $('.js-qv-mask li img');

    var right = $('.scroll-box-arrows .ti-angle-right');
    var left = $('.scroll-box-arrows .ti-angle-left');

    var size = 0;
    $(".js-qv-mask.mask").find("li").each(function(){
      size += $(this).width();
    });
    $('#product .js-qv-mask ul').width(size + 'px');

    var maxRight = size - ($('.js-qv-mask.mask').width() +right.width() + left.width());

    right.on("click", function() {
      var slide = parseInt( $('#product .js-qv-mask ul').css('left'), 10);

      if ( slide + -400 < -maxRight ) 
        $('#product .js-qv-mask ul').css('left', -maxRight );
      else
        $('#product .js-qv-mask ul').css('left', slide + -400 );
        
    });

    left.on("click", function() {
      var slide = parseInt( $('#product .js-qv-mask ul').css('left'), 10);

      if ( slide + 400 < 0 ) 
        $('#product .js-qv-mask ul').css('left', slide + 400 );
      else
        $('#product .js-qv-mask ul').css('left', '0px' );
    });

    $('.js-qv-mask.mask').on({
      'touchmove': function(e) { 
          console.log('slide', e); // Replace this with your code.
      }
    });


    thumbnails.on("click", function() {
      var img = $(this).attr('data-image-large-src');
      if(cover.attr('src') != img){
        cover.attr('src', img);
        thumbnails.removeClass('selected');
        $(this).addClass('selected');
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
