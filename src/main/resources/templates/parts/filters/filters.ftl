<#include "main-filter.ftl">
<#if tv??><#include "tv-filter.ftl"></#if>
<#if fridges??><#include "fridges-filter.ftl"></#if>
<#if stoves??><#include "stoves-filter.ftl"></#if>
<button type="submit" id="filter-button" class="btn btn-primary btn-block filter-button search">Показать</button>