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
        <article class="address-item col-xs-12 col-sm-6 col-md-3">
          <header class="h4">
            <label class="radio-inline">
                <a href="{$return.details_url}">
                  <span class="address-alias h4">{$return.reference}</span>
                </a>
              <div class="address">
                  <strong>{l s='Return' d='Shop.Theme.Customeraccount'}</strong>
                  {$return.return_number}<br/>
                  <strong>{l s='Package status' d='Shop.Theme.Customeraccount'}</strong>
                  {$return.state_name}<br/>
                  <strong>{l s='Date issued' d='Shop.Theme.Customeraccount'}</strong>
                  {$return.return_date}<br/>
              </div>
              </span>
            </label>
          </header>
          <hr>
          <footer class="address-footer">
            <a href="{$return.details_url}" class="edit-address text-muted">{l s='Detail' d='Shop.Theme.Actions'}</span>
            </a>
            {if $return.print_url}
              <a href="{$return.print_url}" class="edit-address text-muted">| {l s='Print out' d='Shop.Theme.Actions'}</a>
            {/if}
          </footer>
        </article>
      {/foreach}
    </div>

  {/if}

{/block}
