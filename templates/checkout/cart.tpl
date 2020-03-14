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
{extends file=$layout}

{block name='content'}

  <section id="main">
    <div class="cart-grid">

      <!-- Left Block: cart product informations & shpping -->
      <div class="cart-grid-header row">
        <div class="col-xs-12">
        
          <header class="page-header">
            <nav class="navbar navbar-default">
            <div class="navbar-header">
              <ul class="nav navbar-nav">
                <li class="left">
                  <h1>{block name='page_title'}{l s='Shopping Cart' d='Shop.Theme.Checkout'}{/block}</h1>
                </li>
              </ul>
            </div>
            <ul class="nav navbar-nav navbar-right navbar-right">
              <li>
                <div class="text-sm-center">
                  <a href="{$urls.pages.index}" class="btn btn-primary">{l s='Continue shopping' d='Shop.Theme.Actions'}</a>
                </div>
              </li>
              <li>
                {block name='cart_actions'}
                  {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
                {/block}
              </li>
            </ul>
            </nav>
          </header>
        </div>
      </div>

      <div class="row">
        <div class="cart-grid-body col-xs-12 col-sm-8">

          <!-- cart products detailed -->
          <div class="card cart-container">
            {block name='cart_overview'}
              {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
            {/block}
          </div>

          {block name='continue_shopping'}
            <a class="label" href="{$urls.pages.index}">
              <i class="material-icons">chevron_left</i>{l s='Continue shopping' d='Shop.Theme.Actions'}
            </a>
          {/block}

          <!-- shipping informations -->
          {block name='hook_shopping_cart_footer'}
            {hook h='displayShoppingCartFooter'}
          {/block}
        </div>

        <!-- Right Block: cart subtotal & cart total -->
        <div class="cart-grid-right col-xs-12 col-sm-4">

          {block name='cart_summary'}
            <div class="card cart-summary">

              {block name='hook_shopping_cart'}
                {hook h='displayShoppingCart'}
              {/block}

              {block name='cart_totals'}
                {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
              {/block}

            </div>
          {/block}

        </div>
        <div class="col-xs-12">
          {block name='hook_reassurance'}
            {hook h='displayReassurance'}
          {/block}
        </div>
      </div>

    </div>
  </section>
{/block}
