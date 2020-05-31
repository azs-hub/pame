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
<div class="order-confirmation-table">
  <div class="order-confirmation-table-header">
    <div class="row">
    {block name='order_items_table_head'}
      <h3 class="col-xs-6">{l s='Order items' d='Shop.Theme.Checkout'}</h3>
      <h3 class="col-xs-2">{l s='Unit price' d='Shop.Theme.Checkout'}</h3>
      <h3 class="col-xs-2">{l s='Quantity' d='Shop.Theme.Checkout'}</h3>
      <h3 class="col-xs-2">{l s='Total products' d='Shop.Theme.Checkout'}</h3>
    {/block}
    </div>
  </div>

  <div class="order-confirmation-table-body">

    {block name='order_confirmation_table'}
      {foreach from=$products item=product}
        <div class="product-line-grid row">
          <div class="product-line-grid-left col-xs-2">
            <span class="image">
              <img src="{$product.cover.medium.url}" />
            </span>
          </div>
          <div class="product-line-grid-body col-xs-4">
            {if $add_product_link}<a href="{$product.url}" target="_blank">{/if}
              
              <div  class="product-line-info">
                <p class="value">{$product.name}</p>
              </div>

            {if $add_product_link}</a>{/if}
            
            {if is_array($product.customizations) && $product.customizations|count}
              {include file="_partials/modal-customization.tpl" customizations=$product.customizations}
            {/if}
            {hook h='displayProductPriceBlock' product=$product type="unit_price"}
          </div>
          <div class="product-line-grid-right product-line-actions">
            <div class="row">
              <div class="col-xs-4 text-sm-center text-xs-left">{$product.price}</div>
              <div class="col-xs-4 text-sm-center">{$product.quantity}</div>
              <div class="col-xs-4 text-sm-center text-xs-right bold">{$product.total}</div>
            </div>
          </div>
        </div>
      {/foreach}

      <div class="order-confirmation-table-footer">
        {foreach $subtotals as $subtotal}
          {if $subtotal.type !== 'tax' && $subtotal.label !== null}
            <div class="row">
              <div class="col-xs-10"> {$subtotal.label}
              </div>
              <div class="col-xs-2">{if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}
              </div>
            </div>
          {/if}
        {/foreach}

        {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}

          <div class="row">
            <div class="col-xs-10">
              {$totals.total.label}&nbsp;{$labels.tax_short}
            </div>
            <div class="col-xs-2">
              {$totals.total.value}
            </div>
          </div>

          <div class="row">
            <div class="col-xs-10">
              {$totals.total_including_tax.label}
            </div>
            <div class="col-xs-2">
              {$totals.total_including_tax.value}
            </div>
          </div>
          {else}
          <div class="row">
            <div class="col-xs-10">
              {$totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$labels.tax_short}{/if}
            </div>
            <div class="col-xs-2">
              {$totals.total.value}
            </div>
          </div>
          {/if}

          {if $subtotals.tax.label !== null}
            <div class="row">
              <div class="col-xs-10">
                {l s='%label%:' sprintf=['%label%' => $subtotals.tax.label] d='Shop.Theme.Global'}
                </div>
                <div class="col-xs-2">{$subtotals.tax.value}</div>
            </tr>
          {/if}
      </div>
    {/block}

  </div>
</div>
