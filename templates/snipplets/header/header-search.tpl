<form class="js-search-container js-search-form search-container {% if floating_search %}search-container-floating d-none d-md-block{% endif %}" action="{{ store.search_url }}" method="get">
    <div class="form-group m-0">
        <input class="js-search-input form-control form-control-rounded search-input {% if floating_search %}pr-5{% endif %}" autocomplete="off" type="search" name="q" placeholder="{{ '¿Qué estás buscando?' | translate }}" aria-label="{{ '¿Qué estás buscando?' | translate }}" />
        <button type="submit" class="search-input-submit" value="{{ 'Buscar' | translate }}" aria-label="{{ 'Buscar' | translate }}">
            {% include "snipplets/svg/search.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
        </button>
    </div>
</form>
<div class="js-search-suggest search-suggest w-md-100 mt-1 mt-md-2" style="display: none;">
    {# AJAX container for search suggestions #}
</div>