{% set noFilterResult = "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." %}
{% set list_data_store = template == 'category' ? 'category-grid-' ~ category.id : 'search-grid' %}

{% if products %}
    <div class="col" data-store="{{ list_data_store}}">
{% endif %}
        {% if products %}
            <div class="js-product-table row"> 
                {% include 'snipplets/product_grid.tpl' %}
            </div> 
            {% include "snipplets/grid/pagination.tpl" with {infinite_scroll: settings.pagination == 'infinite'} %}
        {% else %}
            {% if template =='search' %}
                <h2 class="h4 {% if not has_filters_enabled %}my-4 py-4{% else %}mb-4{% endif %}">
                    {{ (has_applied_filters ? noFilterResult : "Escribilo de otra forma y volvé a intentar.") | translate }}
                </h2>
            {% elseif template == 'category' %}
                <div class="h6 text-center" data-component="filter.message">
                    {{(has_filters_enabled ? noFilterResult : "Próximamente") | translate}}
                </div>
            {% endif %}
        {% endif %}
{% if products %}
    </div>
{% endif %}
