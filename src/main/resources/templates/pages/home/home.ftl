<#import "../../parts/common.ftl" as c>
<@c.page>
    <div class="filters-container m1">
        <#include "../../parts/components/some-info.ftl">
        <div class="all-filters">
            <strong class="filter-name ml-30"><span>Техника для дома</span></strong><#---->
            <#include "../../parts/components/filters/main-filter.ftl">
        </div>
    </div>
    <!--Главный блок отображения товаров-->
    <div class="products-container m1">
        <div>
            <h3 class="ml-20 m2"><span>Вся техника для дома</span></h3><#---->
            <div class="product-type-buttons"></div>
        </div>
        <#include "../../parts/components/products.ftl">
    </div>
</@c.page>