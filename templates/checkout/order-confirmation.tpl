{extends file='page.tpl'}

{block name='page_content_container' prepend}
    <section id="content-hook_order_confirmation" class="card">
      <div class="card-block">
        <div class="row">
          <div class="col-md-12">

            {block name='order_confirmation_header'}
              <h3 class="">{l s='Your order is confirmed' d='Shop.Theme.Checkout'}</h3>
            {/block}

            <p>
              {l s='An email has been sent to your mail address %email%.' d='Shop.Theme.Checkout' sprintf=['%email%' => $customer.email]}
              {if $order.details.invoice_url}
                {* [1][/1] is for a HTML tag. *}
                {l
                  s='You can also [1]download your invoice[/1]'
                  d='Shop.Theme.Checkout'
                  sprintf=[
                    '[1]' => "<a href='{$order.details.invoice_url}'>",
                    '[/1]' => "</a>"
                  ]
                }
              {/if}
            </p>

            <hr/>

            {block name='hook_order_confirmation'}
              {$HOOK_ORDER_CONFIRMATION nofilter}
            {/block}

          </div>
        </div>
      </div>
    </section>
{/block}

{block name='page_content_container'}
  <section id="content order-details" class="page-content page-order-confirmation card">
      <div class="row">
        {block name='order_details'}
          <div class="col-sm-6">
            <h3 class="">{l s='Order details' d='Shop.Theme.Checkout'}</h3>
            <ul>
              <li>{l s='Order reference: %reference%' d='Shop.Theme.Checkout' sprintf=['%reference%' => $order.details.reference]}</li>
              <li>{l s='Payment method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.details.payment]}</li>
              {if !$order.details.is_virtual}
                <li>
                  {l s='Shipping method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.carrier.name]}<br>
                  <em>{$order.carrier.delay}</em>
                </li>
              {/if}
            </ul>
            <hr />
          </div>
        {/block}

        {block name='hook_payment_return'}
          {if ! empty($HOOK_PAYMENT_RETURN)}
          <div class="col-sm-6">
            <div class="card-block payment-options">
              <h3 class="">{l s='Payment details' d='Shop.Theme.Checkout'}</h3>
              {$HOOK_PAYMENT_RETURN nofilter}
            </div>
            <hr/>
          </div>
          {/if}
        {/block}
      </div>

      <div class="row">
        {block name='order_confirmation_table'}
          <div class="col-xs-12">
          {include
            file='checkout/_partials/order-confirmation-table.tpl'
            products=$order.products
            subtotals=$order.subtotals
            totals=$order.totals
            labels=$order.labels
            add_product_link=false
          }
          </div>
        {/block}
      </div>
      <div class="row">
        {block name='customer_registration_form'}
          {if $customer.is_guest}
            <div class="col-xs-12 col-sm-8">
              <div id="registration-form">
                <h3><span class="ti-angle-right"></span>   {l s='Save time on your next order, sign up now' d='Shop.Theme.Checkout'}</h3>
                  {render file='customer/_partials/customer-form.tpl' ui=$register_form}
              </div>
            </div>
          {/if}
        {/block}
      </div>
  </section>

  {block name='hook_order_confirmation_1'}
    {hook h='displayOrderConfirmation1'}
  {/block}

  {block name='hook_order_confirmation_2'}
    <section id="content-hook-order-confirmation-footer">
      {hook h='displayOrderConfirmation2'}
    </section>
  {/block}
{/block}
