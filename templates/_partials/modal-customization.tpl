{foreach from=$customizations item="customization"}
  <div class="customization">
    <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
  </div>
  <div id="_desktop_product_customization_modal_wrapper_{$customization.id_customization}">
    <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
          </div>
          <div class="modal-body">
            {foreach from=$customization.fields item="field"}
              <div class="product-customization-line row">
                <div class="col-sm-3 col-xs-4 label">
                  {$field.label}
                </div>
                <div class="col-sm-9 col-xs-8 value">
                  {if $field.type == 'text'}
                    {if (int)$field.id_module}
                      {$field.text nofilter}
                    {else}
                      {$field.text}
                    {/if}
                  {elseif $field.type == 'image'}
                    <img src="{$field.image.small.url}" alt="{$field.label}">
                  {/if}
                </div>
              </div>
            {/foreach}
          </div>
        </div>
      </div>
    </div>
  </div>
{/foreach}