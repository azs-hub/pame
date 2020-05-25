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
{block name='header'}
  {block name='header_nav'}
    <nav class="header-nav">
    <div class="container">
      <div class="row">
        <div class="hidden-sm-down">
          <div class="hidden-xs col-sm-5 text-left">
            {hook h='displayNav2'}
          </div>

          <div class="col-xs-5 hidden-sm hidden-md hidden-lg text-left">
            <div id="mobile_top_menu_wrapper" class="col-xs-5 hidden-md">
              <div class="dropdown">
                <button class="btn btn-default btn-lg dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                  <span class="ti-menu" aria-hidden="true"></span>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                  {hook h='displayTop'}
                </div>
              </div>
            </div>
          </div>

          <div class="col-xs-7 text-right">
              {hook h='displayNav1'}
          </div>
        </div>
      </div>
    </div>
  </nav>
  {/block}

  {block name='header_top'}
    <div class="header-top">
    <div class="container">
       <div class="row">
        <div class="col-sm-3 hidden-xs-down" id="_desktop_logo">
          <a href="{$urls.base_url}">
            <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
            {if $page.page_name == 'index'}
              <h1>{$shop.name} <span>SHOP</span></h1>
            {else}
              <h2>{$shop.name} <span>SHOP</span></h2>
            {/if}
          </a>
        </div>
        <div class="col-sm-9 hidden-xs position-static">
          {hook h='displayTop'}
          <div class="clearfix"></div>
        </div>
      </div>
    </div>
  </div>
  {hook h='displayNavFullWidth'}
  {/block}
{/block}
