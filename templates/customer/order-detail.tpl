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
  {l s='Order details' d='Shop.Theme.Customeraccount'}
{/block}
{block name='page_title_action'}
    {if $order.details.reorder_url}
      <ul class="nav navbar-nav navbar-right navbar-right">
        <li>
          <div class="text-sm-center">
            {block name='my_account_links'}
              <a href="{$order.details.reorder_url}" class="btn btn-primary">{l s='Reorder' d='Shop.Theme.Actions'}</a>
            {/block}
            <a href="{$order.details.invoice_url}" class="btn btn-default">
              {l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}
            </a>
          </div>
        </li>
      </ul>
    {/if}
{/block}

{block name='page_content'}
  <div id="order-infos">
    <div class="row">
      <div class="col-xs-12 col-sm-7">
      {block name='order_infos'}
        <div>
          <h3 class="">
            {l
              s='Order Reference %reference% - placed on %date%'
              d='Shop.Theme.Customeraccount'
              sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]
            }
          </h3>
          <ul>
            <li><strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$order.carrier.name}</li>
            <li><strong>{l s='Payment method' d='Shop.Theme.Checkout'}</strong> {$order.details.payment}</li>

            {if $order.details.invoice_url}
              <li>
                <a href="{$order.details.invoice_url}">
                  {l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}
                </a>
              </li>
            {/if}

            {if $order.details.recyclable}
              <li>
                {l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}
              </li>
            {/if}

            {if $order.details.gift_message}
              <li>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</li>
              <li>{l s='Message' d='Shop.Theme.Customeraccount'} {$order.details.gift_message nofilter}</li>
            {/if}
          </ul>
          <hr />
        </div>
        <div>
          {block name='addresses'}
            <div class="row addresses">
              {if $order.addresses.delivery}
                <div class="col-lg-6 col-md-6 col-sm-6">
                  <article id="delivery-address">
                    <h4 class="">{l s='Delivery address' d='Shop.Theme.Checkout'}</h4>
                    <address>
                      <strong>{$order.addresses.delivery.alias}</strong><br/>
                      {$order.addresses.delivery.formatted nofilter}
                    </address>
                  </article>
                </div>
              {/if}

              <div class="col-lg-6 col-md-6 col-sm-6">
                <article id="invoice-address">
                  <h4 class="">{l s='Invoice address' d='Shop.Theme.Checkout'}</h4>
                  <address>
                  <strong>{$order.addresses.invoice.alias}</strong><br/>
                  {$order.addresses.invoice.formatted nofilter}</address>
                </article>
              </div>
              <div class="clearfix"></div>
            </div>
          {/block}
          <hr/>
        </div>
      {/block}
      </div>
      <div class="col-xs-12 col-sm-5 card">
        {block name='order_history'}
          <section id="order-history">
            <h3 class="">{l s='Follow your order\'s status step-by-step' d='Shop.Theme.Customeraccount'}</h3>
            <table class="table table-striped table-bordered table-labeled hidden-xs-down">
              <thead class="thead-default">
                <tr>
                  <th>{l s='Date' d='Shop.Theme.Global'}</th>
                  <th>{l s='Status' d='Shop.Theme.Global'}</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$order.history item=state}
                  <tr>
                    <td>{$state.history_date}</td>
                    <td>
                      <span class="label label-pill {$state.contrast}" style="background-color:{$state.color}">
                        {$state.ostate_name}
                      </span>
                    </td>
                  </tr>
                {/foreach}
              </tbody>
            </table>

            {if $order.follow_up}
              <div>
                <p>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</p>
                <a href="{$order.follow_up}">{$order.follow_up}</a>
              </div>
            {/if}
          </section>
        {/block}

        {block name='order_carriers'}
          <section id="order-carriers">
            <h3 class="">{l s='Shipping' d='Shop.Theme.Customeraccount'}</h3>
            {if $order.shipping}
            {foreach from=$order.shipping item=line}
              <div class="shipping-line">
                <ul>
                  <li>
                    <strong>{l s='Date' d='Shop.Theme.Global'}</strong> {$line.shipping_date}
                  </li>
                  <li>
                    <strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$line.carrier_name}
                  </li>
                  <li>
                    <strong>{l s='Weight' d='Shop.Theme.Checkout'}</strong> {$line.shipping_weight}
                  </li>
                  <li>
                    <strong>{l s='Shipping cost' d='Shop.Theme.Checkout'}</strong> {$line.shipping_cost}
                  </li>
                  <li>
                    <strong>{l s='Tracking number' d='Shop.Theme.Checkout'}</strong> {$line.tracking nofilter}
                  </li>
                </ul>
              </div>
            {/foreach}
          {/if}
          </section>
        {/block}
        <hr/>
      </div>
      
      <div class="clearfix"></div>
    </div>
  </div>



  {$HOOK_DISPLAYORDERDETAIL nofilter}

  {block name='order_detail'}
    {if $order.details.is_returnable}
      {include file='customer/_partials/order-detail-return.tpl'}
    {else}
      {include file='customer/_partials/order-detail-no-return.tpl'}
    {/if}
  {/block}

  {block name='order_messages'}
    {include file='customer/_partials/order-messages.tpl'}
  {/block}
{/block}
