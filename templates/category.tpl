{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% if settings.grid_columns_desktop == '5' %}
		{% paginate by 50 %}
	{% else %}
		{% paginate by 48 %}
	{% endif %}
{% endif %}

{% if not show_help %}

{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
{% set has_category_description_without_banner = not category_banner and category.description %}

{% if category_banner %}
    {% include 'snipplets/category-banner.tpl' %}
{% else %}
	<section class="container mt-3 d-md-none">
		{% embed "snipplets/page-header.tpl" %}
		    {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
		{% endembed %}
		{% if has_category_description_without_banner %} 
			<p class="mt-2 mb-3 d-block d-md-none">{{ category.description }}</p> 
		{% endif %}
	</section>
{% endif %}

<section class="js-category-controls-prev category-controls-sticky-detector"></section>
<section class="js-category-controls category-controls {% if not settings.filters_desktop_modal %}position-relative-md{% endif %} visible-when-content-ready {% if category_banner %}my-3{% else %}mb-3 {% if has_category_description_without_banner %}mb-md-0{% else %}mb-md-1{% endif %}{% endif %}">
	<div class="container category-controls-container">
		<div class="category-controls-row row">
			<div class="col d-none d-md-block">
				<div class="row align-items-center">
					{% if not category_banner %}
						<div class="col-auto">
							<div class="category-breadcrumbs-container d-none d-md-block">
								{% include "snipplets/breadcrumbs.tpl" %}
							</div>
							{% embed "snipplets/page-header.tpl" with {'breadcrumbs': false} %}
							    {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
							{% endembed %}
						</div>
					{% endif %}
				</div>
			</div>
			<div class="filter-chips-container visible-when-content-ready col-auto pr-0 text-right d-none d-md-flex">
				{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
			</div>
			{% include "snipplets/grid/filters-modals.tpl" %}
		</div>
	</div>
</section>
{% if has_category_description_without_banner %} 
	<p class="mb-4 container d-none d-md-block">{{ category.description }}</p> 
{% endif %}
<div class="container visible-when-content-ready d-md-none {% if has_applied_filters %}pb-2{% endif %}">
	{% include "snipplets/grid/filters.tpl" with {mobile: true, applied_filters: true} %}
</div>

<section class="category-body {% if products %}mt-2 mt-md-4{% endif %}">
	<div class="container">
		<div class="row">
			{% include "snipplets/grid/filters-sidebar.tpl" %}
			{% include "snipplets/grid/products-list.tpl" %}
		</div>
	</div>
</section>
{% elseif show_help %}
	{# Category Placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}