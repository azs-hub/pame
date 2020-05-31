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
  {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}

  {if $ordersReturn && count($ordersReturn)}

    <div class="order-returns row">
      {foreach from=$ordersReturn item=return}
        <div class="col-xs-12 col-sm-6 col-md-3">
        <article class="customer-card">
          <a href="{$return.details_url}" class="title">{$return.reference}</a>

          <table class="table">
            <tr>
              <td class="name">{l s='Return' d='Shop.Theme.Customeraccount'}</td>
              <td class="value">{$return.return_number}</td>
            </tr>
            <tr>
              <td class="name">{l s='Package status' d='Shop.Theme.Customeraccount'}</td>
              <td class="value">{$return.state_name}</td>
            </tr>
            <tr>
              <td class="name">{l s='Date issued' d='Shop.Theme.Customeraccount'}</td>
              <td class="value">{$return.return_date}</td>
            </tr>
          </table>
          <hr />
          <div class="action">
            <a href="{$return.details_url}" class="edit-address text-muted" title="{l s='Details' d='Shop.Theme.Customeraccount'}"
            data-toggle="tooltip" data-placement="bottom" title="{l s='Details' d='Shop.Theme.Customeraccount'}">
              <span class="ti-pencil"></span>
            </a>
            {if $return.print_url}
              <a href="{$return.print_url}" class="edit-address text-muted"
               data-toggle="tooltip" data-placement="bootom" title="{l s='Print out' d='Shop.Theme.Actions'}">
              <span class="ti-printer"></span></a>
            {/if}
          </footer>
        </article>
        </div>
      {/foreach}
    </div>

  {/if}

{/block}
