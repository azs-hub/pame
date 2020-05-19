$(document).ready(function () {
	prestashop.cart = prestashop.cart || {};
	prestashop.cart.active_inputs = null;

	var promises = [];
	var productLineInCartSelector = '.js-cart-line-product-quantity';

	function parseCartAction($target, namespace) {
	    return {
	      url: $target.data('action'),
	      type: $target.data('link-action')
	    }
	}

	var abortPreviousRequests = function () {
	    var promise;
	    while (promises.length > 0) {
	      promise = promises.pop();
	      promise.abort();
	    }
	};

	var CheckUpdateQuantityOperations = {
	  'switchErrorStat': () => {
	    /**
	     * if errorMsg is not empty or if notifications are shown, we have error to display
	     * if hasError is true, quantity was not updated : we don't disable checkout button
	     */
	    const $checkoutBtn = $('.checkout a');
	    if ($("#notifications article.alert-danger").length || ('' !== errorMsg && !hasError)) {
	      $checkoutBtn.addClass('disabled');
	    }

	    if ('' !== errorMsg) {
	      let strError = ' <article class="alert alert-danger" role="alert" data-alert="danger"><ul><li>' + errorMsg + '</li></ul></article>';
	      $('#notifications .container').html(strError);
	      errorMsg = '';
	      isUpdateOperation = false;
	      if (hasError) {
	        // if hasError is true, quantity was not updated : allow checkout
	        $checkoutBtn.removeClass('disabled');
	      }
	    } else if (!hasError && isUpdateOperation) {
	      hasError = false;
	      isUpdateOperation = false;
	      $('#notifications .container').html('');
	      $checkoutBtn.removeClass('disabled');
	    }
	  },
	  'checkUpdateOpertation': (resp) => {
	    /**
	     * resp.hasError can be not defined but resp.errors not empty: quantity is updated but order cannot be placed
	     * when resp.hasError=true, quantity is not updated
	     */
	    hasError = resp.hasOwnProperty('hasError');
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
		// $target.addClass("disabled");
		// console.log($target)
    	var dataset = event.currentTarget.dataset;
    	let cartAction = parseCartAction($target, event.namespace);
	    let requestData = {
	      ajax: '1',
	      action: 'update'
	    };

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
		      // CheckUpdateQuantityOperations.checkUpdateOpertation(resp);
		      var $quantityInput = $target.parent().children(productLineInCartSelector);
		      $quantityInput.val(resp.quantity);
		      // CheckUpdateQuantityOperations.switchErrorStat();
		      
		      prestashop.emit('updateCart', {
		        reason: dataset
		      });
		      	
		    }).fail((resp) => {
		      prestashop.emit('handleError', {
		        eventType: 'updateProductInCart',
		        resp: resp,
		        cartAction: cartAction.type
		      });
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