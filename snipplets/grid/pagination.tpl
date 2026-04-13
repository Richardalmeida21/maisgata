{% if infinite_scroll %}
	{% if pages.current == 1 and not pages.is_last %}
		<div class="text-center mt-5 mb-5">
			<a class="js-load-more btn btn-primary">
				<span class="js-load-more-spinner pull-left m-right-quarter" style="display:none;">{% include "snipplets/svg/spinner-third.tpl" with {svg_custom_class: "icon-inline icon-spin"} %}</span>
				{{ 'Mostrar más productos' | t }}
			</a>
		</div>
		<div id="js-infinite-scroll-spinner" class="mt-5 mb-5 text-center w-100" style="display:none">
			{% include "snipplets/svg/spinner-third.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text icon-spin"} %} 
		</div>
	{% endif %}
{% else %}
	<div class="row justify-content-center align-items-center my-4">
		{% if pages.numbers %}
			<div class="col-auto">
				<a {% if pages.previous %}href="{{ pages.previous }}"{% endif %} class="d-inline-block svg-circle svg-icon-text text-center {% if not pages.previous %}disabled{% endif %}">
					{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg mt-1"} %}
				</a>
			</div>
			<div class="col-auto h4 px-0">
				{% for page in pages.numbers %}
					{% if page.selected %}
						<span>{{ page.number }}</span>
					{% endif %}
				{% endfor %}
				<span class="mx-1">/</span>
				<span>{{ pages.amount }}</span>
			</div>
			<div class="col-auto">
				<a {% if pages.next %}href="{{ pages.next }}"{% endif %} class="d-inline-block svg-circle svg-icon-text text-center {% if not pages.next %}disabled{% endif %}">
					{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg mt-1"} %}
				</a>
			</div>
		{% endif %}
	</div>
{% endif %}