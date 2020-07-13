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

{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
  <div id="manufacturer-short_description">
  	<h3>{l s='List of products by brand %brand_name%' sprintf=['%brand_name%' => $manufacturer.name] d='Shop.Theme.Catalog'}</h3>

    <ul class="nav nav-tabs" role="tablist">
    	<li role="productsTab" class="active">
    		<a href="#productsTab" aria-controls="productsTab" role="tab" data-toggle="tab" >Products</a>
    	</li>
      <li role="manufacturerTab">
        <a href="#manufacturerTab" aria-controls="manufacturerTab" role="tab" data-toggle="tab">{l s='En savoir plus' d='Shop.Theme.Global'}</a>
      </li>
  	</ul>
  </div>
{/block}

{block name='product_manufacturer'}
   {$manufacturer.description nofilter}
{/block}

	