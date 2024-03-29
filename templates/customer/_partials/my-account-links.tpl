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
{block name='my_account_links'}
<ul class="nav navbar-nav navbar-right navbar-right">
  <li>
    <div class="text-sm-center">
      {block name='my_account_links'}
        <a href="{$urls.pages.my_account}" class="btn btn-primary">{l s='Back to your account' d='Shop.Theme.Customeraccount'}</a>
      {/block}
    </div>
  </li>
  <li>
  	<div class="text-sm-center">
    	<a href="{$urls.pages.index}" class="btn btn-default">{l s='Home' d='Shop.Theme.Global'}</a>
    </div>
  </li>
</ul>
{/block}
