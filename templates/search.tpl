{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% if settings.grid_columns_desktop == '5' %}
		{% paginate by 50 %}
	{% else %}
		{% paginate by 48 %}
	{% endif %}
{% endif %}

{% embed "snipplets/page-header.tpl" with { breadcrumbs: false, container: true } %}
	{% block page_header_text %}
		{% if products %}
			{{ 'Resultados de búsqueda' | translate }}
		{% else %}
			{{ "No encontramos nada para" | translate }}<span class="ml-2">"{{ query }}"</span>
		{% endif %}
	{% endblock page_header_text %}
{% endembed %}
{% if products %}
		<div class="container-fluid d-md-none" >
			<h2 class="h4 mb-3">
				{{ "Mostrando los resultados para" | translate }}<span class="ml-2">"{{ query }}"</span>
			</h2>
	</div>
{% endif %}

<section class="js-category-controls-prev category-controls-sticky-detector"></section>

<section class="js-category-controls category-controls {% if not settings.filters_desktop_modal %}position-relative-md{% endif %} visible-when-content-ready {% if category_banner %}my-3{% else %}mb-3 {% if has_category_description_without_banner %}mb-md-0{% else %}mb-md-1{% endif %}{% endif %} ">
	<div class="container category-controls-container">
		<div class="row align-items-center {% if not products %}justify-content-end{% endif %}">
			{% if products %}
				<div class="col pl-3 d-none d-md-block" >
					<h2 class="h3 m-0" >
						{{ "Mostrando los resultados para" | translate }}<span class="ml-2">"{{ query }}"</span>
					</h2>
				</div>
			{% endif %}
			{% if search_filter %}
				<div class="filter-chips-container visible-when-content-ready col-auto pr-0 text-right d-none d-md-flex align-items-center">
					{% include "snipplets/grid/filters.tpl" with {applied_filters: true, chip_class: 'mb-md-0'} %}
				</div>
				{% include "snipplets/grid/filters-modals.tpl" %}
			{% endif %}
		</div>
	</div>
</section>

<div class="container visible-when-content-ready d-md-none {% if has_applied_filters %}pb-2{% endif %}">
	{% include "snipplets/grid/filters.tpl" with {mobile: true, applied_filters: true} %}
</div>

<section class="category-body {% if products %}mt-2 mt-md-4{% endif %}">
	<div class="container">
	{% if products %}
		<div class="row">
	{% endif %}
			{% include "snipplets/grid/filters-sidebar.tpl" %}
			{% include "snipplets/grid/products-list.tpl" %}
	{% if products %}
		</div>
	{% endif %}
	</div>
</section>

