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

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}

  <section id="main detail-product" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="row">
      <div class="col-xs-12 col-sm-7">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}

            {/block}
          </section>
        {/block}
          <div class="clearfix"></div>
          {if $product.is_customizable && count($product.customizations.fields)}
            {block name='product_customization'}
              {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
            {/block}
          {/if}
        </div>
        <div class="col-xs-12 col-sm-5">
          {block name='page_header_container'}
            {block name='page_header'}
              <div class="short-description">{block name='product_description_short'}
                {$product.description_short nofilter}
              {/block}</div>
              <h2 itemprop="name">{block name='page_title'}{$product.name}{/block}</h2>
            {/block}
          {/block}

          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}

          {block name='product_tabs'}
              <div class="tabs">
                <ul class="nav nav-tabs" role="tablist">
                  {if $product.description}
                    <li class="nav-item {if $product.description} active{/if}">
                       <a
                         class="nav-link"
                         data-toggle="tab"
                         href="#description"
                         role="tab"
                         aria-controls="description"
                         {if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
                    </li>
                  {/if}
                  {if $product.show_quantities || $product.availability_date || $product.grouped_features || !empty($product.specific_references) }
                    <li class="nav-item {if !$product.description} active{/if}">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#product-details"
                        role="tab"
                        aria-controls="product-details"
                        {if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
                    </li>
                  {/if}
                  {if $product.attachments}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#attachments"
                        role="tab"
                        aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
                    </li>
                  {/if}
                  {foreach from=$product.extraContent item=extra key=extraKey}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#extra-{$extraKey}"
                        role="tab"
                        aria-controls="extra-{$extraKey}">{$extra.title}</a>
                    </li>
                  {/foreach}
                </ul>

                <div class="tab-content" id="tab-content">
                 <div class="tab-pane fade in{if $product.description} active{/if}" id="description" role="tabpanel">
                   {block name='product_description'}
                     <div class="product-description">{$product.description nofilter}</div>
                   {/block}  
                 </div>

                 {block name='product_details'}
                  {include file='catalog/_partials/product-details.tpl'}
                  
                 {/block}

                 {block name='product_attachments'}
                   {if $product.attachments}
                    <div class="tab-pane fade in" id="attachments" role="tabpanel">
                       <section class="product-attachments">
                         <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                         {foreach from=$product.attachments item=attachment}
                           <div class="attachment">
                             <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                             <p>{$attachment.description}</p
                             <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                               {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                             </a>
                           </div>
                         {/foreach}
                       </section>
                     </div>
                   {/if}
                 {/block}

                 {foreach from=$product.extraContent item=extra key=extraKey}
                 <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                   {$extra.content nofilter}
                 </div>
                 {/foreach}
              </div>  
            </div>
          {/block}

          <div class="product-information">

            <div class="product-actions">
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}

                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block}

                  {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                  {block name='product_refresh'}{/block}
                </form>
              {/block}

            </div>
        </div>
      </div>
    </div>

    {block name='hook_display_reassurance'}
      {hook h='displayReassurance'}
    {/block}

    <div class="row product-manufacturer">
      {block name='product_reference'}
      <div class="col-xs-12">
        <h4>{l s='Discover' d='Shop.Theme.Catalog'}</h4>
        <h3>
          <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
        </h3>
      </div>
      {if isset($product_manufacturer->id)}
      <div class="col-xs-12 col-sm-3">
        {if isset($manufacturer_image_url)}
          <a href="{$product_brand_url}">
            <img src="{$manufacturer_image_url}" alt="{$product_manufacturer->name}">
          </a>
        {/if}
        <div class="description">
          {$product_manufacturer->short_description nofilter}
        </div>
      </div>
      {/if}
      <div class="col-xs-12 col-sm-9 description">
        {$product_manufacturer->description nofilter}
      </div>
      {/block}
    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
          <p class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
          <div class="products">
            {foreach from=$accessories item="product_accessory"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          
          

        {/block}
      </footer>
    {/block}
  </section>

{/block}
