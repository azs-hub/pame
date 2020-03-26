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
<div class="card row">
{block name='order_messages_table'}
  <div class="messages col-xs-12 col-sm-6 col-lg-7">
  <h3 class="card-title">{l s='Messages' d='Shop.Theme.Customeraccount'}</h3>
  {if $order.messages}
    {foreach from=$order.messages item=message}
      <div class="message">
        <span class="label">{l s='From' d='Shop.Theme.Customeraccount'}:</span>{$message.name}<br/>
        <span class="label">{l s='Date' d='Shop.Theme.Customeraccount'}:</span>{$message.message_date}<br/>
        <span class="label">{l s='Message' d='Shop.Theme.Customeraccount'}</span><br/>
        <blockquote>{$message.message nofilter}</blockquote>
      </div>
    {/foreach}
  {/if}
  </div>
{/block}

{block name='order_message_form'}
  <div class="col-xs-12 col-sm-6 col-lg-5">
  <section class="order-message-form card">
    <form action="{$urls.pages.order_detail}" method="post">
      <header>
        <h3 class="card-title">{l s='Add a message' d='Shop.Theme.Customeraccount'}</h3>
        <p>{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Customeraccount'}</p>
      </header>

      <section class="form-fields">

        <div class="form-group">
          <select name="id_product" class="form-control form-control-select">
            <option value="0">{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
            {foreach from=$order.products item=product}
              <option value="{$product.id_product}">{$product.name}</option>
            {/foreach}
          </select>
        </div>

        <div class="form-group">
          <textarea rows="3" name="msgText" class="form-control"></textarea>
        </div>

      </section>

      <footer class="form-footer text-sm-center">
        <input type="hidden" name="id_order" value="{$order.details.id}">
        <button type="submit" name="submitMessage" class="btn btn-primary form-control-submit pull-right">
          {l s='Send' d='Shop.Theme.Actions'}
        </button>
      </footer>
    </form>
  </section>
{/block}
