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
  {l s='Your vouchers' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {if $cart_rules}
    <div class="cart-rules row">
      {foreach from=$cart_rules item=cart_rule}
        <article class="address-item col-xs-12 col-sm-6 col-md-3">
          <header class="h4">
            <label class="radio-inline">
              <span class="address-alias text-center">{$cart_rule.code}</span>
              <div class="address">
                  <strong>{l s='Description' d='Shop.Theme.Checkout'}</strong>
                  {$cart_rule.name}<br/>
                  <strong>{l s='Quantity' d='Shop.Theme.Checkout'}</strong>
                  {$cart_rule.quantity_for_user}<br/>
                  <strong>{l s='Value' d='Shop.Theme.Checkout'}</strong>
                  {$cart_rule.value}<br/>
                  <strong>{l s='Minimum' d='Shop.Theme.Checkout'}</strong>
                  {$cart_rule.voucher_minimal}<br/>
                  <strong>{l s='Cumulative' d='Shop.Theme.Checkout'}</strong>
                  {$cart_rule.voucher_cumulable}<br/>
                  <strong>{l s='Expiration Date' d='Shop.Theme.Checkout'}</strong>
                  {$cart_rule.voucher_date}<br/>
              </div>
              </span>
            </label>
          </header>
        </article>
      {/foreach}
    </div>
  {/if}
{/block}
