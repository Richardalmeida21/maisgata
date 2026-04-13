{% set sort_text = {
'score-descending': 'Relevancia',
'user': 'Destacado',
'price-ascending': 'Precio: Menor a Mayor',
'price-descending': 'Precio: Mayor a Menor',
'alpha-ascending': 'A - Z',
'alpha-descending': 'Z - A',
'created-ascending': 'Más Viejo al más Nuevo',
'created-descending': 'Más Nuevo al más Viejo',
'best-selling': 'Más Vendidos',
} %}

{% if list %}
	<ul class="js-sort-by-list list-unstyled"> 
		{% for sort_method in sort_methods %}
			{# This is done so we only show the user sorting method when the user chooses it #}
			{% if sort_method != 'user' or category.sort_method == 'user' %}
				<li class="mb-4">
					<a href="#" class="js-apply-sort btn no-underline {% if sort_by == sort_method %}btn-link-primary font-weight-bold{% else %}btn-link{% endif %}" data-sort-value="{{ sort_method }}">
						<div class="row align-items-center">
							<div class="col text-left">
								{{ sort_text[sort_method] | t }}
							</div>
							<div class="js-sort-check col-auto" {% if sort_by != sort_method %}style="display: none;"{% endif %}>
								{% include "snipplets/svg/check.tpl" with { svg_custom_class: "icon-inline icon-lg"} %}
							</div>
						</div>
					</a>
				</li>
			{% endif %}
		{% endfor %}
	</ul>
{% else %}
	{% embed "snipplets/forms/form-select.tpl" with{select_label: false, select_group_custom_class: "d-inline-block w-auto mb-0", select_custom_class: 'js-sort-by', select_aria_label: 'Ordenar:' | translate, sort: 'true' } %}
		{% block select_options %}
			{% for sort_method in sort_methods %}
		        {# This is done so we only show the user sorting method when the user chooses it #}
		        {% if sort_method != 'user' or category.sort_method == 'user' %}
		            <option value="{{ sort_method }}" {% if sort_by == sort_method %}selected{% endif %}>{{ sort_text[sort_method] | t }}</option>
		        {% endif %}
		    {% endfor %}
		{% endblock select_options%}
	{% endembed %}
{% endif %}