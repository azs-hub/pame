<div id="blockcart-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span class="ti-close"></span>
        </button>
        <h4 class="modal-title h6 text-sm-center" id="myModalLabel">{l s='Product successfully added to your shopping cart' d='Shop.Theme.Checkout'}</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-6">
            
            <div class="product-line-grid">
              <div class="product-image">
                <img src="{$product.cover.medium.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image">
              </div>
              <div class="product-info">
                <h6 class="product-name">{$product.name}</h6>
                <p class="current-price">{$product.price}</p>
  
                <div>
                  {hook h='displayProductPriceBlock' product=$product type="unit_price"}
                  {foreach from=$product.attributes item="property_value" key="property"}
                  <div class="product-line-info">
                    <span class="label">{l s='%label%:' sprintf=['%label%' => $property] d='Shop.Theme.Global'}</span>
                    <span class="value"> {$property_value}</span>
                  </div>
                  {/foreach}
                  <div class="product-line-info">
                    <span class="label">{l s='Quantity:' d='Shop.Theme.Checkout'}</span>
                    <span class="value">{$product.cart_quantity}</span>
                  </div>
                </div>
              </div>

            </div>
          </div>
          <div class="col-md-6">
            <div class="cart-content">
              {if $cart.products_count > 1}
                <p class="cart-products-count">{l s='There are %products_count% items in your cart.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}</p>
              {else}
                <p class="cart-products-count">{l s='There is %product_count% item in your cart.' sprintf=['%product_count%' =>$cart.products_count] d='Shop.Theme.Checkout'}</p>
              {/if}
              <div class="cart-summary-line">
	              <span class="label">{l s='Subtotal:' d='Shop.Theme.Checkout'}</span>
	              <span class="value">{$cart.subtotals.products.value}</span>
              </div>
              <div class="cart-summary-line">
              	<span class="label">{l s='Shipping:' d='Shop.Theme.Checkout'}</span>
              	<span class="value">{$cart.subtotals.shipping.value} {hook h='displayCheckoutSubtotalDetails' subtotal=$cart.subtotals.shipping}</span>
              </div>

              {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
              <div class="cart-summary-line">
                <span class="label">{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>
                <span class="value">{$cart.totals.total.value}</span>
              </div>
              <div class="cart-summary-line">
                <span class="label">{$cart.totals.total_including_tax.label}</span>&nbsp;<span class="value">{$cart.totals.total_including_tax.value}</span></div>
              {else}
              <div class="cart-summary-line">
                <span class="label">{$cart.totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</span>&nbsp;<span class="value">{$cart.totals.total.value}</span>
                </div>
              {/if}

              {if $cart.subtotals.tax}
              <div class="cart-summary-line">
                <span class="label">{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}&nbsp;</span>
                <span class="value">{$cart.subtotals.tax.value}</span>
              </div>
              {/if}
              </div>
              <div class="cart-content-btn">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{l s='Continue shopping' d='Shop.Theme.Actions'}</button>
                <a href="{$cart_url}" class="btn btn-primary">{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
