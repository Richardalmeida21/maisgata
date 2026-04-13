{# Testimonials that work as example #}

<section class="section-testimonials-home position-relaitve" data-store="home-testimonials">
	<div class="container">
		<div class="row mb-3 pb-2">
			<div class="col-12 mb-4">
				<h2 class="h3 mb-0">{{ 'Testimonios' | translate }}</h2>
			</div>
			<div class="col-12">
				<div class="js-swiper-testimonials-demo swiper-testimonials swiper-container text-center">
					<div class="swiper-wrapper">
						<div class="swiper-slide slide-container">
							<div class="testimonials-image testimonials-image-placeholder mb-3">
								{% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
							</div>
							<p class="mb-3 px-5">{{ 'Descripción del testimonio' | translate }}</p>
							<div class="subtitle">{{ 'Testimonio' | translate }}</div>
						</div>
						<div class="swiper-slide slide-container">
							<div class="testimonials-image testimonials-image-placeholder mb-3">
								{% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
							</div>
							<p class="mb-3 px-5">{{ 'Descripción del testimonio' | translate }}</p>
							<div class="subtitle">{{ 'Testimonio' | translate }}</div>
						</div>
						<div class="swiper-slide slide-container">
							<div class="testimonials-image testimonials-image-placeholder mb-3">
								{% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
							</div>
							<p class="mb-3 px-5">{{ 'Descripción del testimonio' | translate }}</p>
							<div class="subtitle">{{ 'Testimonio' | translate }}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="placeholder-overlay transition-soft">
			<div class="placeholder-info p-2">
				{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-2x"} %}
				<div class="placeholder-description font-small-xs my-2">
					{{ "Podés mostrar testimonios de tus clientes desde" | translate }} </br><strong>"{{ "Testimonios" | translate }}"</strong>
				</div>
				{% if not params.preview %}
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
				{% endif %}
			</div>
		</div>
	</div>
</section>