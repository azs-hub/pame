{block name='ps_social_follow'}
  <div class="ps-social-follow">
    <h4>{l s='Follow us' d='Modules.Socialfollow.Shop'}</h4>
    <ul>
      {foreach from=$social_links item='social_link'}
        <li class="ti-{$social_link.class}"><a href="{$social_link.url}"> <i class="{$social_link.class}"></i></a></li>
      {/foreach}
    </ul>
  </div>
{/block}
