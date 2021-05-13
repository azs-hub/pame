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
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Our stores' d='Shop.Theme.Global'}
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-stores">

    {foreach $stores as $store}
      <article id="store-{$store.id}" class="store-item card">
        <div class="store-item-container clearfix">
          <div class="col-xs-12">
            {if $store.note || $store.phone || $store.fax || $store.email}
              <a data-toggle="collapse" href="#about-{$store.id}" aria-expanded="false" aria-controls="about-{$store.id}"><strong>{l s='About and Contact' d='Shop.Theme.Global'}</strong><span class="ti-info"></span></a>
            {/if}
            <footer id="about-{$store.id}" class="collapse">
              <div class="store-item-footer divide-top">
                <div class="card-block">
                  {if $store.note}
                    <p class="text-justify">{$store.note}<p>
                  {/if}
                </div>
                <ul class="card-block">
                  {if $store.phone}
                    <li><span class="ti-mobile"></span>{$store.phone}</li>
                  {/if}
                  {if $store.fax}
                    <li><span class="ti-desktop"></span>{$store.fax}</li>
                  {/if}
                  {if $store.email}
                    <li><span class="ti-email"></span>{$store.email}</li>
                  {/if}
                </ul>
              </div>
            </footer>
          </div>
          <div class="col-xs-5 col-sm-4 col-md-3 col-lg-2 store-picture hidden-sm-down">
            <img src="{$store.image.bySize.stores_default.url}" alt="{$store.image.legend}" title="{$store.image.legend}">
          </div>
          <div class="col-xs-7 col-sm-4 store-description">
            <p class="h3 card-title">{$store.name}</p>
            <address>{$store.address.formatted nofilter}</address>
          </div>
          <div class="col-sm-4 col-xs-12 divide-left">
            <dl>
              {foreach $store.business_hours as $day}
                <dt>{$day.day|truncate:4:'.'}</dt>
                <dd>
                  {foreach $day.hours as $h}
                    {$h}
                  {/foreach}
                </dd>
              {/foreach}
            </dl>
          </div>
        </div>
      </article>
    {/foreach}

  </section>
{/block}
