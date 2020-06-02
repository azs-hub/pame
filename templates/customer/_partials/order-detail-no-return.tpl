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
{block name='order_products_table'}
  <div class="order-confirmation-table">
    <div class="order-confirmation-table-header">
      <div class="row">
      {block name='order_items_table_head'}
        <h3 class="col-xs-6">{l s='Product' d='Shop.Theme.Catalog'}</h3>
        <h3 class="col-xs-2 text-center">{l s='Quantity' d='Shop.Theme.Catalog'}</h3>
        <h3 class="col-xs-2 text-center">{l s='Unit price' d='Shop.Theme.Catalog'}</h3>
        <h3 class="col-xs-2 text-center">{l s='Total price' d='Shop.Theme.Catalog'}</h3>
      {/block}
      </div>
    </div>

    <div class="order-confirmation-table-body">
      {foreach from=$order.products item=product}
      <div class="product-line-grid row">
        <div class="product-line-grid-left col-xs-2">
          <span class="image">
            <img src="{$product.cover.medium.url}" alt="{$product.name}" />
          </span>
        </div>

        <div class="product-line-grid-body col-xs-4">
          <div class="product-line-info">
            <a class="value" {if isset($product.download_link)}href="{$product.download_link}"{/if}>
              {$product.name}
            </a>
            <br />
            {if $product.reference}
            <p class="label">
              #{$product.reference}
            </p>
            {/if}
          </div>
          {if $product.customizations}
            {include file="_partials/modal-customization.tpl" customizations=$product.customizations}
          {/if}
        </div>

        <div class="product-line-grid-right product-line-actions">
          <div class="row">
            <div class="col-xs-4 text-sm-center text-xs-left">{$product.price}</div>
            <div class="col-xs-4 text-sm-center">{if $product.customizations}
              {foreach $product.customizations as $customization}
                {$customization.quantity}
              {/foreach}
            {else}
              {$product.quantity}
            {/if}</div>
            <div class="col-xs-4 text-sm-center text-xs-right bold">{$product.total}</div>
          </div>
        </div>
      </div>
      {/foreach}
    </div>

    <div class="order-confirmation-table-footer">
      {foreach $order.subtotals as $line}
        {if $line.value}
        <div class="row">
          <div class="col-xs-10 line-{$line.type}">
            {$line.label}
          </div>
          <div class="col-xs-2">
            {$line.value}
          </div>
        </div>
        {/if}
      {/foreach}
      <div class="row">
        <div class="col-xs-10 line-{$order.totals.total.type}">
          {$order.totals.total.label}
        </div>
        <div class="col-xs-2">
          {$order.totals.total.value}
        </div>
      </div>
    </div>
  </div>
{/block}
