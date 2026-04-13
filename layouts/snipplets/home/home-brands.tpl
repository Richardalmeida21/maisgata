{% if settings.brands and settings.brands is not empty %}
	<section class="section-brands-home" data-store="home-brands">
		<div class="container">
			<div class="row mb-3 pb-2">
				{% if settings.brands_title %}
					<div class="col">
						<h2 class="h3 mb-0">{{ settings.brands_title }}</h2>
					</div>
				{% endif %}
				<div class="col text-right d-none d-md-block">
					<div class="js-swiper-brands-prev swiper-button-prev d-inline-block svg-circle svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
					<div class="js-swiper-brands-next swiper-button-next d-inline-block svg-circle svg-icon-text ml-2">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="js-swiper-brands swiper-brands swiper-container text-center">
						<div class="js-swiper-brands-wrapper swiper-wrapper">
							{% for slide in settings.brands %}
								<div class="swiper-slide slide-container mt-0 mb-4">
									{% if slide.link %}
										<a href="{{ slide.link | setting_url }}" title="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}" aria-label="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
									{% endif %}
										<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('large') }}" class="lazyload brand-image" alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
									{% if slide.link %}
										</a>
									{% endif %}
								</div>
							{% endfor %}
						</div>
					</div>
					<div class="d-block d-md-none mt-3">
						<div class="js-swiper-brands-pagination swiper-pagination swiper-pagination-bullets position-relative"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
{% endif %}
