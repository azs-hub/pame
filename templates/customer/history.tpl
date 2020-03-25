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

    <div class="orders row">
      {foreach from=$orders item=order}

      <article class="address-item col-xs-4">
        <header class="h4">
          <span class="address-alias h4">{$order.details.reference}</span>
          <span
            class="label label-pill {$order.history.current.contrast}"
            style="background-color:{$order.history.current.color}"
          >
            {$order.history.current.ostate_name}
          </span>
          <dl class="data-sheet">
            <dt class="name">{l s='Date' d='Shop.Theme.Checkout'}</dt>
            <dd class="value">{$order.details.order_date}</dd>
            <dt class="name">{l s='Total price' d='Shop.Theme.Checkout'}</dt>
            <dd class="value">{$order.totals.total.value}</dd>
            <dt class="name">{l s='Payment' d='Shop.Theme.Checkout'}</dt>
            <dd class="value">{$order.details.payment}</dd>
          </dl>
        </header>
        <hr>
        <footer class="address-footer">
            <a
              class="edit-address text-muted"
              href="{$order.details.details_url}" data-link-action="view-order-details" title="{l s='Details' d='Shop.Theme.Customeraccount'}"
            >{l s='Details' d='Shop.Theme.Customeraccount'}</a>
            {if $order.details.reorder_url}
              <a
              class="delete-address text-muted"
              href="{$order.details.reorder_url}"
            > | {l s='Reorder' d='Shop.Theme.Actions'}</a>
            {/if}
        </footer>
      </article>
      {/foreach}
    </div>

  {/if}
{/block}
