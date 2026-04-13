{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if not show_help %}
	{% embed "snipplets/page-header.tpl" with {container: true} %}
		{% block page_header_text %}{{ "Error" | translate }} - {{ "404" | translate }}{% endblock page_header_text %}
	{% endembed %}
{% endif %}

<section id="page-error">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<p class="mb-1">{{ "La página que estás buscando no existe." | translate }}</p></br>
			</div>
		</div>
		{% set related_products = sections.primary.products | take(4) | shuffle %}
		{% if related_products | length > 1 %}
			<div class="row section-products-related pt-3">
				<div class="col-12">
					<h3 class="h5 mb-4">{{ "Quizás te interesen los siguientes productos." | translate }}</h3>
				</div>
				<div class="col-12">
					<div class="row row-grid">
						{% for related in related_products %}
							{% include 'snipplets/grid/item.tpl' with {product : related} %}
						{% endfor %}
					</div>
				</div>
			</div>
		{% endif %}
	</div>
</section>

{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
	<div id="product-example">
		{% snipplet 'defaults/show_help_product.tpl' %}
	</div>
{% endif %}