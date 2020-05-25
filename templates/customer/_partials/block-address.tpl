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
{block name='address_block_item'}
  <article id="address-{$address.id}" class="customer-card" data-id-address="{$address.id}">

    <a class="title" href="{url entity=address id=$address.id}" data-link-action="edit-address">{$address.alias}</a>
    <div class="address">{$address.formatted nofilter}</div>
    
    <hr />

    {block name='address_block_item_actions'}
    <div class="action">
        <a
          class="edit-address text-muted"
          href="{url entity=address id=$address.id}" data-link-action="edit-address" data-toggle="tooltip" data-placement="bottom" title="{l s='Details' d='Shop.Theme.Customeraccount'}">
        <span class="ti-pencil"></span>
        </a>
        <a
          class="delete-address text-muted"
          href="{url entity=address id=$address.id params=['delete' => 1, 'token' => $token]}" data-link-action="delete-address" data-toggle="tooltip" data-placement="bottom" title="{l s='Delete' d='Shop.Theme.Actions'}">
          <span class="ti-trash"></span>
        </a>
    </div>
    {/block}
  </article>
{/block}
