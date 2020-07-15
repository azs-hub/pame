{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<section>
	<div class="row featuredproducts">
		<div class="col-xs-12 col-sm-5 featured-left">
			<div class="row">
				<div class="col-xs-12 cover">
					<img src="{$products[0].cover.large.url}" alt="{$products[0].name}" />
					<a href="{$products[0].url}">
						<span>
							<span class="teaser-cat">{l s='Nouveau' d='Shop.Theme.Global'}</span>
							<h3 class="teaser-headline">{$products[0].name}</h3>
							<p class="teaser-link">{l s='Shop Now' d='Shop.Theme.Global'}</p>
						</span>
					</a>
					<div class="clearfix"></div>
				</div>
				<div class="col-xs-12 cover">
					<img src="{$products[3].cover.large.url}" alt="{$products[3].name}" />
					<a href="{$products[3].url}">
						<span>
							<span class="teaser-cat">{l s='Nouveau' d='Shop.Theme.Global'}</span>
							<h3 class="teaser-headline">{$products[3].name}</h3>
							<p class="teaser-link">{l s='Shop Now' d='Shop.Theme.Global'}</p>
						</span>
					</a>
				</div>
			</div>
		</div>

		<div class="col-xs-12 col-sm-3 featured-middle">
			<div class="row">
				<div class="col-xs-12 cover">
					<a href="{$products[1].url}">
						<img src="{$products[1].cover.large.url}" alt="{$products[1].name}" />
						<span>
							<h3 class="teaser-headline">{$products[1].name}</h3>
							<p class="teaser-link">{l s='Shop Now' d='Shop.Theme.Global'}</p>
						</span>
					</a>
				</div>
				<div class="col-xs-12 cover">
					<a href="{$products[4].url}">
						<img src="{$products[4].cover.large.url}" alt="{$products[4].name}" />
						<span>
							<h3 class="teaser-headline">{$products[4].name}</h3>
							<p class="teaser-link">{l s='Shop Now' d='Shop.Theme.Global'}</p>
						</span>
					</a>
				</div>
			</div>
		</div>

		<div class="col-xs-12 col-sm-4 col-sm-offset-0 featured-right">
			<div class="row">
				<div class="col-xs-12 cover">
					<img src="{$products[2].cover.large.url}" alt="{$products[2].name}" />
					<a href="{$products[2].url}">
						<span>
							<span class="teaser-cat">{l s='Nouveau' d='Shop.Theme.Global'}</span>
							<h3 class="teaser-headline">{$products[2].name}</h3>
							<p class="teaser-link">{l s='Shop Now' d='Shop.Theme.Global'}</p>
						</span>
					</a>
				</div>
				<div class="col-xs-12 custom-text">
					<h3>{l s='Philosophie' d='Shop.Theme.Global'}</h3>
					<h2>{l s='Passionnée' d='Shop.Theme.Global'}</h2>
					<p>{l s='Nos valeur' d='Shop.Theme.Global'}</p>
				</div>
			</div>
		</div>
	</div>
</section>