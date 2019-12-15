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

{function name="categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
      
        {foreach from=$nodes item=node}
          <li data-depth="{$depth}">

            {if $depth===0}
              <a href="{$node.link}" 
                class="{if ($c_tree_path && in_array($node.id, $c_tree_path)) || (isset($category) && is_array($category) && isset($category.id) && $category.id==$node.id) || (isset($id_category_current) && $id_category_current==$node.id)}active{/if}">
                <span>{$node.name}</span>
              </a>
              {if $node.children}
                <ul class="category-sub">
                  {categories nodes=$node.children depth=$depth+1}
                </ul>
              {/if}
            {else}
              <a href="{$node.link}" class="category-sub-link {if (isset($category) && is_array($category) && isset($category.id) && $category.id==$node.id) || (isset($id_category_current) && $id_category_current==$node.id)}active{/if}">
                {$node.name}
              </a>
            {/if}
          </li>
        {/foreach}
    {/if}
  {/strip}
{/function}

<div class="block-categories hidden-sm-down">
  <nav>
    <ul class="category-top-menu">
      {categories nodes=$categories.children}
    </ul>
  </nav>
</div>
