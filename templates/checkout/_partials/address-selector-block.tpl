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
{block name='address_selector_blocks'}
  {foreach $addresses as $address}
    <article
      class="address-item{if $address.id == $selected} selected{/if} col-xs-4"
      id="{$name|classname}-address-{$address.id}"
    >
      <header class="h4 customer-card">
        <label class="radio-inline">
          <span class="custom-radio custom-container">
            <input
              class="input-radio"
              name="{$name}"
              type="radio"
              value="{$address.id}"
              {if $address.id == $selected}checked{/if}
            >
            <span class="selectmark"></span>
            <span class="address-alias h4 title">{$address.alias}</span>
          <div class="address">{$address.formatted nofilter}</div>
          </span>
        </label>
        <hr/>
        <footer class="address-footer action">
          {if $interactive}
            <a
              class="edit-address text-muted"
              data-link-action="edit-address"
              href="{url entity='order' params=['id_address' => $address.id, 'editAddress' => $type, 'token' => $token]}" data-toggle="tooltip" data-placement="bottom" title="{l s='Edit' d='Shop.Theme.Actions'}"
            ><span class="ti-pencil"></span></a>
            <a
              class="delete-address text-muted"
              data-link-action="delete-address"
              href="{url entity='order' params=['id_address' => $address.id, 'deleteAddress' => true, 'token' => $token]}" data-toggle="tooltip" data-placement="bottom" title="{l s='Delete' d='Shop.Theme.Actions'}"
            ><span class="ti-trash"></span></a>
          {/if}
        </footer>
      </header>
    </article>
  {/foreach}
  {if $interactive}
    <p>
      <button class="ps-hidden-by-js form-control-submit center-block" type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
    </p>
  {/if}
{/block}
