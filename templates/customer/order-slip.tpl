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
  {l s='Credit slips' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {if $credit_slips}
    <div class="row">
    {foreach from=$credit_slips item=slip}
      <article class="address-item col-xs-12 col-sm-6 col-md-3">
        <header class="h4">
          <label class="radio-inline">
              <a href="{$slip.order_url_details}" data-link-action="view-order-details">
                <span class="address-alias h4">{$slip.order_reference}</span>
              </a>
            <div class="address">
                <strong>{l s='Credit slip' d='Shop.Theme.Customeraccount'}</strong>
                {$slip.credit_slip_number}<br/>
                <strong>{l s='Date' d='Shop.Theme.Customeraccount'}</strong>
              {$slip.credit_slip_date}<br/>
                <strong>{l s='Value' d='Shop.Theme.Customeraccount'}</strong>
              {$slip.amount}<br/>

            </div>
            </span>
          </label>
        </header>
        <hr>
        <footer class="address-footer">
            <a
              class="edit-address text-muted"
              href="{$slip.url}">{l s='View credit slip' d='Shop.Theme.Customeraccount'}</a>
        </footer>
      </article>
    {/foreach}
    </div>
  {/if}
{/block}
