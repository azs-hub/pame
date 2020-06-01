$(document).ready(function () {
	prestashop.cart = prestashop.cart || {};
	prestashop.cart.active_inputs = null;

	var promises = [];
	var productLineInCartSelector = '.js-cart-line-product-quantity';
	var isUpdateOperation = false;
	var errorMsg = null;
	var hasError = false;

	function parseCartAction($target, namespace) {
	    return {
	      url: $target.data('action'),
	      type: $target.data('link-action')
	    }
	}
	
	var CheckUpdateQuantityOperations = {
	  'switchErrorStat': () => {
	    /**
	     * if errorMsg is not empty or if notifications are shown, we have error to display
	     * if hasError is true, quantity was not updated : we don't disable checkout button
	     */
	    if ('' !== errorMsg) {
	      let strError = ' <article class="alert alert-danger" role="alert" data-alert="danger"><ul><li>' + errorMsg + '</li></ul></article>';
	      $('#notifications .container').html(strError);
	      errorMsg = '';
	      isUpdateOperation = false;
	    } else if (!hasError === false && isUpdateOperation) {
	      hasError = false;
	      isUpdateOperation = false;
	      $('#notifications .container').html('');
	    }
	  },
	  'checkUpdateOpertation': (resp) => {
	    /**
	     * resp.hasError can be not defined but resp.errors not empty: quantity is updated but order cannot be placed
	     * when resp.hasError=true, quantity is not updated
	     */
	    hasError = resp.hasOwnProperty('errors');
	    let errors = resp.errors || "";
	    // 1.7.2.x returns errors as string, 1.7.3.x returns array
	    if (errors instanceof Array) {
	      errorMsg = errors.join(" ");
	    } else {
	      errorMsg = errors;
	    }
	    isUpdateOperation = true;
	  }
	};
	function handleCartAction (event) {
		event.preventDefault();

		var $target = $(event.currentTarget);
		var loader = $target.parents(".product-line-grid").find(".loader");
		loader.addClass("show");
    	var dataset = event.currentTarget.dataset;
    	let cartAction = parseCartAction($target, event.namespace);
	    let requestData = {
	      ajax: '1',
	      action: 'update'
	    };
	    console.log('cartAction.url ', cartAction.url);
		if (typeof cartAction === 'undefined') {
	      return;
	    }
		
		$.ajax({
		      url: cartAction.url,
		      method: 'POST',
		      data: requestData,
		      dataType: 'json',
		      beforeSend: function (jqXHR) {
		        promises.push(jqXHR);
		      }
		    }).then(function (resp) {
		      
		      CheckUpdateQuantityOperations.checkUpdateOpertation(resp);
		      var $quantityInput = $target.parent().children(productLineInCartSelector);
		      $quantityInput.val(resp.quantity);
		      CheckUpdateQuantityOperations.switchErrorStat();
		      
		      prestashop.emit('updateCart', {
		        reason: dataset
		      });
		      loader.removeClass("show");
		      	
		    }).fail((resp) => {
		      prestashop.emit('handleError', {
		        eventType: 'updateProductInCart',
		        resp: resp,
		        cartAction: cartAction.type
		      });
		      loader.removeClass("show");
		    });
	}

	$('body').on(
	    'click',
	    '.js-decrease-product-quantity, .js-increase-product-quantity',
	    handleCartAction
	  );
	$('body').on(
	    'click',
	    '.remove-from-cart',
	    handleCartAction
	  );
});