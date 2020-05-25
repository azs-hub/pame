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
      <article class="customer-card col-xs-12 col-sm-6 col-md-3">
          <a class="title" href="{$slip.order_url_details}" data-link-action="view-order-details">{$slip.order_reference}</a>

          <table class="table">
            <tr>
              <td class="name">{l s='Credit slip' d='Shop.Theme.Customeraccount'}</td>
              <td class="value">{$slip.credit_slip_number}</td>
            </tr>
            <tr>
              <td class="name">{l s='Date' d='Shop.Theme.Customeraccount'}</td>
              <td class="value">{$slip.credit_slip_date}</td>
            </tr>
            <tr>
              <td class="name">{l s='Value' d='Shop.Theme.Customeraccount'}</td>
              <td class="value">{$slip.amount}</td>
            </tr>
          </table>
          <hr />
          <div class="action">
            <a
              class="edit-address text-muted"
              href="{$slip.url}" data-toggle="tooltip" data-placement="bootom" title="{l s='View credit slip' d='Shop.Theme.Customeraccount'}">
                <span class="ti-eye"></span>
            </a>
        </footer>
      </article>
    {/foreach}
    </div>
  {/if}
{/block}
