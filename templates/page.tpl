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

    {block name='page_header_container'}
      {block name='page_title' hide}
        <div class="row">
          <div class="col-xs-12">
            <header class="page-header">
              <nav class="navbar navbar-default">
                <div class="navbar-header">
                  <ul class="nav navbar-nav">
                    <li class="left">
                      <h1>{$smarty.block.child}</h1>
                    </li>
                  </ul>
                </div>
                {block name='page_title_action'}{/block}
              </nav>
            </header>
          </div>
        </div>
          
      {/block}
    {/block}

    {block name='page_content_container'}
      <section id="content" class="page-content card card-block">
        {block name='page_content_top'}{/block}
        {block name='page_content'}
          <!-- Page content -->
        {/block}
      </section>
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}

  </section>

{/block}
