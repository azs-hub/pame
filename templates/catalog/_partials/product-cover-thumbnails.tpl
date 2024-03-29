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
<div class="images-container">

  {block name='product_cover'}
    <div class="product-cover">
      {block name='product_flags'}
        <ul class="product-flags">
          {if $product.quantity < 1}
            <li class="product-flag out-stock">
              {if $product.show_availability && $product.availability_message}
                {$product.availability_message}
              {else}
                {l s='Vendu' d='Shop.Theme.Catalog'}
              {/if}
            </li>
          {else}
            {foreach from=$product.flags item=flag}
              <li class="product-flag {$flag.type}">{$flag.label}</li>
            {/foreach}
          {/if}
        </ul>
      {/block}

      {if $product.cover}
        <img src="{$product.cover.bySize.large_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" style="width:100%;" itemprop="image" class="js-qv-product-cover">
      {else}
        <img src="{$urls.no_picture_image.bySize.large_default.url}" style="width:100%;">
      {/if}
    </div>
  {/block}

  {block name='product_images'}
    <div class="thumbnail-slider">
      <div class="js-qv-mask mask">
        <ul class="product-images js-qv-product-images">
          {foreach from=$product.images item=image}
            <li class="thumb-container">
              <img
                class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
                data-image-medium-src="{$image.bySize.medium_default.url}"
                data-image-large-src="{$image.bySize.large_default.url}"
                src="{$image.bySize.home_default.url}"
                alt="{$image.legend}"
                title="{$image.legend}"
                width="100"
                itemprop="image"
              >
            </li>
          {/foreach}
        </ul>
      </div>
      
    </div>
  {/block}
</div>
{hook h='displayAfterProductThumbs'}
