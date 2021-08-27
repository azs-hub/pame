(function( $ ) {
 
  $.fn.productCover = function(options) {

    var defaults = {
        cover: ".js-qv-product-cover",
        thumbnailsMask: ".js-qv-mask.mask",
        nav: false,
        right: ".scroll-box-arrows .ti-angle-right",
        left: ".scroll-box-arrows .ti-angle-left",
    };
 
    var settings = $.extend( {}, defaults, options );

    if (!$(this)[0])
      return ;

    var _cover = $(this).find(settings.cover); //".js-qv-product-cover");
    var _thumbnailsMask = $(this).find(settings.thumbnailsMask); //'.js-qv-mask.mask');
    var _thumbnails = _thumbnailsMask.find('li');

    // set size of mask
    var size = 100;
    _thumbnails.each(function(){
      size += $(this).outerWidth(true);
    });
    _thumbnailsMask.find('ul').width(size + 'px');

    // define navigation
    if (_thumbnails.length > 1 && !settings.nav) {
      $('<div class="scroll-box-arrows"><i class="ti-angle-left"></i><i class="ti-angle-right"></i></div>').insertAfter(_thumbnailsMask);
    }
    // set navigation
    $(settings.right).on('click', function () { 
      navSlide('+=' + _thumbnailsMask.width())
     });
    $(settings.left).on('click', function () { 
      navSlide('-=' + _thumbnailsMask.width())
     }); 

    _thumbnails.on("click", function() {
      var img = $(this).find("img").attr('data-image-large-src');
      if(_cover.attr('src') != img){
        _cover.attr('src', img);
        _thumbnails.removeClass('selected');
        $(this).addClass('selected');
      }
    });

    function navSlide(direction) {
      _thumbnailsMask.animate({
        scrollLeft: direction
      }, "slow");
    }

    return this;

  };
 
}( jQuery ));
 
$( ".images-container" ).productCover();

prestashop.on(
  'updateProduct',
  function (event) {
      setTimeout(function(){ $( ".images-container" ).productCover(); }, 2000);
  }
);

$(window).load( function(){
  function preload(imageArray, index) {
    index = index || 0;
    if (imageArray && imageArray.length > index) {
      var img = new Image ();
      img.onload = function() {
          preload(imageArray, index + 1);
      }
      img.src = $(imageArray[index]).find("img").attr("data-image-large-src");
    }
  }
/* images is an array with image metadata */
preload($(".js-qv-product-images li"));

});
