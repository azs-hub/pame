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
<section class="product-customization">
  {if !$configuration.is_catalog}
    <h4 class="title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>

    {block name='product_customization_form'}
      <form method="post" action="{$product.url}" enctype="multipart/form-data">
        <ul class="clearfix">
          {foreach from=$customizations.fields item="field"}
            <li class="product-customization-item form-group">
              <label> {$field.label}</label>
              {if $field.type == 'text'}
                <textarea placeholder="{l s='Your message here' d='Shop.Forms.Help'}" class="product-message form-control" maxlength="250" {if $field.required} required {/if} name="{$field.input_name}"></textarea>
                <small class="float-xs-right help-block">{l s='250 char. max' d='Shop.Forms.Help'}</small>
                {if $field.text !== ''}
                    <h6 class="customization-message">{l s='Your customization:' d='Shop.Theme.Catalog'}
                        <label>{$field.text}</label>
                    </h6>
                {/if}
              {elseif $field.type == 'image'}
                <br>
                {if $field.is_customized}
                  <img src="{$field.image.small.url}">
                  <a class="remove-image" href="{$field.remove_image_url}" rel="nofollow"><span class="ti-trash"></span></a>
                {/if}
                <span class="custom-file">
                  {if !$field.is_customized}
                  <span class="js-file-name">{l s='No selected file' d='Shop.Forms.Help'}</span>
                  {/if}
                  <input class="file-input js-file-input form-control" {if $field.required} required {/if} type="file" name="{$field.input_name}">
                </span>
                <small class="float-xs-right help-block">{l s='.png .jpg .gif' d='Shop.Forms.Help'}</small>
              {/if}
            </li>
          {/foreach}
        </ul>
        <div class="clearfix">
          <p>{l s='Don\'t forget to save your customization to be able to add to cart' d='Shop.Forms.Help'}</p>
          <button class="btn btn-primary float-xs-right" type="submit" name="submitCustomizedData">{l s='Save Customization' d='Shop.Theme.Actions'}</button>
        </div>
      </form>
    {/block}
  {/if}
</section>
