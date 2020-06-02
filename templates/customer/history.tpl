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
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Order history' d='Shop.Theme.Customeraccount'}
{/block}
{block name='page_title_action'}
    {include file='customer/_partials/my-account-links.tpl'}
{/block}

{block name='page_content'}

  {if $orders}
  <div class="row">
    {$entered=false}
    {foreach from=$orders item=order}
    {if $order@index % 4 == 0}
    </div><div class="row">
    
    {/if}
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
      <article class="customer-card">
        <a class="title" href="{$order.details.details_url}" data-link-action="view-order-details" title="{l s='Details' d='Shop.Theme.Customeraccount'}">{$order.details.reference}</a>
        <span
          class="label label-pill {$order.history.current.contrast}"
          style="background-color:{$order.history.current.color}"
        >
          {$order.history.current.ostate_name}
        </span>

        <div class="card-content">
          <table class="table">
            <tr>
              <td class="name">{l s='Date' d='Shop.Theme.Checkout'}</td>
              <td class="value">{$order.details.order_date}</td>
            </tr>
            <tr>
              <td class="name">{l s='Total price' d='Shop.Theme.Checkout'}</td>
              <td class="value">{$order.totals.total.value}</td>
            </tr>
            <tr>
              <td class="name">{l s='Payment' d='Shop.Theme.Checkout'}</td>
              <td class="value">{$order.details.payment}</td>
            </tr>
          </table>
        </div>
        <hr/>

        <div class="action">
          <a
            class="edit-address text-muted"
            href="{$order.details.details_url}" data-link-action="view-order-details" title="{l s='Details' d='Shop.Theme.Customeraccount'}"
            data-toggle="tooltip" data-placement="bottom" title="{l s='Details' d='Shop.Theme.Customeraccount'}">
            <span class="ti-pencil"></span>
            </a>
          {if $order.details.reorder_url}
            <a class="delete-address text-muted" href="{$order.details.reorder_url}" data-toggle="tooltip" data-placement="bootom" title="{l s='Reorder' d='Shop.Theme.Actions'}">
              <span class="ti-shopping-cart"></span></a>
          {/if}
        </div>
        <div class="clearfix"></div>
      </article>
    </div>
    {/foreach}
  </div>

  {/if}
{/block}
