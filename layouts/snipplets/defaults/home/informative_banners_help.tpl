{# Informative banners that work as examples #}

<section class="section-informative-banners position-relative" data-store="banner-services">
	<div class="container">
		<div class="row">
			<div class="js-informative-banners-demo swiper-container">
				<div class="swiper-wrapper">
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_3': true} %}
				</div>
			</div>
		</div>
	</div>
	<div class="js-informative-banners-pagination-demo service-pagination swiper-pagination"></div>
	<div class="placeholder-overlay transition-soft">
		<div class="placeholder-info p-2">
			{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
			<div class="placeholder-description font-small-xs my-2">
				{{ "Podés mostrar tu información para la compra desde" | translate }} </br><strong>"{{ "Información de envíos, pagos y compra" | translate }}"</strong>
			</div>
			{% if not params.preview %}
				<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
			{% endif %}
		</div>
	</div>
</section>