{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<!-- <div class="product-line-grid row"> -->
  <!--  product left content: image-->
  <div class="col-xs-12 loader"></div>
  <div class="product-line-grid-right hidden-xs col-sm-2">
    <span class="image product-image media-middle">
      <img src="{$product.cover.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}">
    </span>
  </div>

  <!--  product left body: description -->
  <div class="product-line-grid-body col-xs-4">
    <div class="product-line-info">
      <img src="{$product.cover.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}" class="visible-xs-12 hidden-sm hidden-md hidden-lg">

      <a href="{$product.url}" data-id_customization="{$product.id_customization|intval}">{$product.name}</a>
    </div>

    <div class="product-line-info product-price h5 {if $product.has_discount}has-discount{/if}">
      {if $product.has_discount}
        <div class="product-discount">
          <span class="regular-price">{$product.regular_price}</span>
          {if $product.discount_type === 'percentage'}
            <span class="discount discount-percentage">
                -{$product.discount_percentage_absolute}
              </span>
          {else}
            <span class="discount discount-amount">
                -{$product.discount_to_display}
              </span>
          {/if}
        </div>
      {/if}
      <div class="current-price">
        <span class="price">{$product.price}</span>
        {if $product.unit_price_full}
          <div class="unit-price-cart">{$product.unit_price_full}</div>
        {/if}
      </div>
    </div>

    <br/>

    {foreach from=$product.attributes key="attribute" item="value"}
      <div class="product-line-info">
        <span class="label">{$attribute}:</span>
        <span class="value">{$value}</span>
      </div>
    {/foreach}

    {if is_array($product.customizations) && $product.customizations|count}
      {block name='cart_detailed_product_line_customization'}
        {include file="_partials/modal-customization.tpl" customizations=$product.customizations}
      {/block}
    {/if}
  </div>

  <!--  product left body: description -->
  <div class="product-line-grid-right product-line-actions col-xs-6">
  <div class="row">
    <div class="col-xs-12 col-sm-6 qty">
        {if isset($product.is_gift) && $product.is_gift}
          <span class="gift-quantity">{$product.quantity}</span>
        {else}
          
          <div class="input-group">
            <div class="input-group-btn">
              <a 
              class="btn-sm btn-touchspin js-touchspin js-decrease-product-quantity
              bootstrap-touchspin-down"
              href="#"
              data-action="{$product.down_quantity_url}">
                <span class="ti-angle-down"></span>
              </a>
            </div>
            
            <input
            class="js-cart-line-product-quantity form-control"
            type="number"
            value="{$product.quantity}"
            name="product-quantity-spin"
            min="{$product.minimal_quantity}"
          />
            <div class="input-group-btn">
              <a
              href="#"
              class="btn-sm btn-touchspin js-touchspin js-increase-product-quantity  bootstrap-touchspin-up"
              data-action="{$product.up_quantity_url}">
                <span class="ti-angle-up"></span>
              </a> 
            </div>

          </div>
          
        {/if}
      </div>
    <div class="col-xs-12 col-sm-4 price">
      <span class="product-price">
        {if isset($product.is_gift) && $product.is_gift}
          <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
        {else}
          {$product.total}
        {/if}
      </span>
    </div>
    <div class="col-xs-12 col-sm-2 text-xs-right">
      <div class="btn-sm cart-line-product-actions">
        <a
            class                       = "remove-from-cart"
            rel                         = "nofollow"
            href                        = "#"
            data-action                        = "{$product.remove_from_cart_url}"
            data-link-action            = "delete-from-cart"
            data-id-product             = "{$product.id_product|escape:'javascript'}"
            data-id-product-attribute   = "{$product.id_product_attribute|escape:'javascript'}"
            data-id-customization   	  = "{$product.id_customization|escape:'javascript'}"
        >
          {if !isset($product.is_gift) || !$product.is_gift}
          <span class="ti-trash"></span>
          {/if}
        </a>

        {block name='hook_cart_extra_product_actions'}
          {hook h='displayCartExtraProductActions' product=$product}
        {/block}

      </div>
    </div>
  </div>
  </div>

  <div class="clearfix"></div>
<!-- </div> -->
