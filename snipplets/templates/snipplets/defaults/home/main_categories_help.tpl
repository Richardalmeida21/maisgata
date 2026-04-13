{# Main categories that work as examples #}

<section class="section-categories-home position-relative" data-store="home-categories-featured">
	<div class="container">
		<div class="row mb-3 pb-2">
			<div class="col">
				<h2 class="h3 mb-0">{{ 'Categorías' | translate }}</h2>
			</div>
			<div class="col text-right d-none d-md-block">
				<div class="js-swiper-categories-prev-demo swiper-button-prev d-inline-block svg-circle svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
				<div class="js-swiper-categories-next-demo swiper-button-next d-inline-block svg-circle svg-icon-text ml-2">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 pr-0 pr-md-3 mb-4">
				<div class="js-swiper-categories-demo swiper-container">
					<div class="swiper-wrapper">
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_1': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_2': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_3': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_1': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_2': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_3': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_1': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_2': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_3': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_1': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_2': true}  %}
						{% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_3': true}  %}
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="placeholder-overlay transition-soft">
		<div class="placeholder-info p-2">
			{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-2x"} %}
			<div class="placeholder-description font-small-xs my-2">
				{{ "Podés mostrar tus categorías principales desde" | translate }} </br><strong>"{{ "Categorías principales" | translate }}"</strong>
			</div>
			{% if not params.preview %}
				<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
			{% endif %}
		</div>
	</div>
</section>