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
{block name='footer'}
<div class="footer-container">
<div class="container">
	<div class="row">
        <div class="col-xs-4">
          {block name='hook_footer'}
            {hook h='displayFooter'}
          {/block}
        </div>
        <div class="col-xs-4">
          {block name='hook_footer_social'}
            {hook h='displayFooterSocial'}
          {/block}
        </div>
        <div class="col-xs-4">
          {block name='hook_footer_contact'}
            {hook h='displayFooterContact'}
          {/block}
        </div>
    </div>
	<div class="row">
      <div class="col-md-12 footer_subfooter">
        <p>
            {block name='copyright_link'}
              <a class="_blank" href="http://www.prestashop.com" target="_blank">
                {l s='%copyright% %year% - Ecommerce software by %prestashop%'
                sprintf=['%prestashop%' => 'PrestaShop™', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
              </a>
            {/block}
          </p>
          
          <p>{l s='Thème prestashop réalisé par' d='Shop.Theme.Global'}</p>
      </div>
    </div>
</div>
</div>
{/block}
