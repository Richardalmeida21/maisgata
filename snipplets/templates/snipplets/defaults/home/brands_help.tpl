{# Brands that work as examples #}

<section class="section-brands-home position-relative" data-store="home-brands">
	<div class="container">
		<div class="row mb-3 pb-2">
			<div class="col">
				<h2 class="h3 mb-0">{{ 'Marcas' | translate }}</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="js-swiper-brands-demo swiper-brands swiper-container text-center">
					<div class="js-swiper-brands-wrapper-demo swiper-wrapper">
						<div class="swiper-slide slide-container mt-0 mb-4">
							{% include "snipplets/svg/help/help-logo.tpl" with {svg_custom_class: "icon-inline icon-lg icon-4x brand-image svg-icon-text opacity-50"} %}
						</div>
						<div class="swiper-slide slide-container mt-0 mb-4">
							{% include "snipplets/svg/help/help-logo.tpl" with {svg_custom_class: "icon-inline icon-lg icon-4x brand-image svg-icon-text opacity-50"} %}
						</div>
						<div class="swiper-slide slide-container mt-0 mb-4">
							{% include "snipplets/svg/help/help-logo.tpl" with {svg_custom_class: "icon-inline icon-lg icon-4x brand-image svg-icon-text opacity-50"} %}
						</div>
						<div class="swiper-slide slide-container mt-0 mb-4">
							{% include "snipplets/svg/help/help-logo.tpl" with {svg_custom_class: "icon-inline icon-lg icon-4x brand-image svg-icon-text opacity-50"} %}
						</div>
						<div class="swiper-slide slide-container mt-0 mb-4">
							{% include "snipplets/svg/help/help-logo.tpl" with {svg_custom_class: "icon-inline icon-lg icon-4x brand-image svg-icon-text opacity-50"} %}
						</div>
						<div class="swiper-slide slide-container mt-0 mb-4">
							{% include "snipplets/svg/help/help-logo.tpl" with {svg_custom_class: "icon-inline icon-lg icon-4x brand-image svg-icon-text opacity-50"} %}
						</div>
					</div>
				</div>
				<div class="d-block d-md-none mt-3">
					<div class="js-swiper-brands-pagination-demo swiper-pagination swiper-pagination-bullets position-relative"></div>
				</div>
			</div>
		</div>
		<div class="placeholder-overlay transition-soft">
			<div class="placeholder-info p-2">
				{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-2x"} %}
				<div class="placeholder-description font-small-xs my-2">
					{{ "Podés subir logos de tus marcas desde" | translate }} </br><strong>"{{ "Marcas" | translate }}"</strong>
				</div>
				{% if not params.preview %}
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
				{% endif %}
			</div>
		</div>
	</div>
</section>
