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
  <form id="order-return-form" action="{$urls.pages.order_follow}" method="post">

    <div class="box hidden-sm-down">
      <table id="order-products" class="table return">
        <thead class="thead-default order-confirmation-table-header">
          <tr>
            <th class="head-checkbox"></th>
            <th><h3>{l s='Product' d='Shop.Theme.Catalog'}</h3></th>
            <th><h3>{l s='Quantity' d='Shop.Theme.Catalog'}</h3></th>
            <th><h3>{l s='Returned' d='Shop.Theme.Customeraccount'}</h3></th>
            <th><h3>{l s='Unit price' d='Shop.Theme.Catalog'}</h3></th>
            <th><h3>{l s='Total price' d='Shop.Theme.Catalog'}</h3></th>
          </tr>
        </thead>
        {foreach from=$order.products item=product name=products}
          <tr>
            <td>
              {if !$product.customizations}
                <span id="_desktop_product_line_{$product.id_order_detail}">
                <input type="checkbox" id="cb_{$product.id_order_detail}" name="ids_order_detail[{$product.id_order_detail}]" value="{$product.id_order_detail}">
              </span>
              {else}
                {foreach $product.customizations  as $customization}
                  <span id="_desktop_product_customization_line_{$product.id_order_detail}_{$customization.id_customization}">
                  <input type="checkbox" id="cb_{$product.id_order_detail}" name="customization_ids[{$product.id_order_detail}][]" value="{$customization.id_customization}">
                </span>
                {/foreach}
              {/if}
            </td>
            <td class="product-line-info">
              <p class="value">{$product.name}</p>
              <p class="label">
              {if $product.reference}
                {l s='Reference' d='Shop.Theme.Catalog'}: {$product.reference}<br/>
              {/if}
              </p>
              {if $product.customizations}
                {include file="_partials/modal-customization.tpl" customizations=$product.customizations}
              {/if}
            </td>
            <td class="qty">
              {if !$product.customizations}
                <div class="current">
                  {$product.quantity}
                </div>
                {if $product.quantity > $product.qty_returned}
                  <div class="select" id="_desktop_return_qty_{$product.id_order_detail}">
                    <select name="order_qte_input[{$product.id_order_detail}]" class="form-control form-control-select">
                      {section name=quantity start=1 loop=$product.quantity+1-$product.qty_returned}
                        <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                      {/section}
                    </select>
                  </div>
                {/if}
              {else}
                {foreach $product.customizations as $customization}
                  <div class="current">
                    {$customization.quantity}
                  </div>
                  <div class="select" id="_desktop_return_qty_{$product.id_order_detail}_{$customization.id_customization}">
                    <select
                      name="customization_qty_input[{$customization.id_customization}]"
                      class="form-control form-control-select"
                    >
                      {section name=quantity start=1 loop=$customization.quantity+1}
                        <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                      {/section}
                    </select>
                  </div>
                {/foreach}
                <div class="clearfix"></div>
              {/if}
            </td>
            <td class="text-xs-right">{$product.qty_returned}</td>
            <td class="text-xs-right">{$product.price}</td>
            <td class="text-xs-right">{$product.total}</td>
          </tr>
        {/foreach}
        <tfoot class="order-confirmation-table-footer">
          {foreach $order.subtotals as $line}
            {if $line.value}
              <tr class="text-xs-right line-{$line.type}">
                <td colspan="5">{$line.label}</td>
                <td colspan="2">{$line.value}</td>
              </tr>
            {/if}
          {/foreach}
          <tr class="text-xs-right line-{$order.totals.total.type}">
            <td colspan="5">{$order.totals.total.label}</td>
            <td colspan="2">{$order.totals.total.value}</td>
          </tr>
        </tfoot>
      </table>
    </div>

    <div class="card">
      <header>
        <h3 class="title">{l s='Merchandise return' d='Shop.Theme.Customeraccount'}</h3>
        <p>{l s='If you wish to return one or more products, please mark the corresponding boxes and provide an explanation for the return. When complete, click the button below.' d='Shop.Theme.Customeraccount'}</p>
      </header>
      <section class="form-fields">
        <div class="form-group">
          <textarea cols="67" rows="3" name="returnText" class="form-control"></textarea>
        </div>
      </section>
      <footer class="form-footer">
        <input type="hidden" name="id_order" value="{$order.details.id}">
        <button class="form-control-submit btn btn-primary" type="submit" name="submitReturnMerchandise">
          {l s='Request a return' d='Shop.Theme.Customeraccount'}
        </button>
      </footer>
    </div>

  </form>
{/block}
