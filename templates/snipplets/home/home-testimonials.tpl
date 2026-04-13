{% set has_home_testimonials = false %}
{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
	{% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
	{% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
	{% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
	{% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
	{% if has_testimonial %}
		{% set has_home_testimonials = true %}
	{% endif %}
{% endfor %}

{% if has_home_testimonials %}
	<section class="section-testimonials-home" data-store="home-testimonials">
		<div class="container">
			<div class="row mb-3 pb-2">
				{% if settings.testimonials_title %}
					<div class="col-12 mb-4">
						<h2 class="h3 mb-0">{{ settings.testimonials_title }}</h2>
					</div>
				{% endif %}
				<div class="col-12">
					<div class="js-swiper-testimonials swiper-testimonials swiper-container text-center">
						<div class="swiper-wrapper">
							{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
								{% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
								{% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
								{% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
								{% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
								{% if has_testimonial %}
									<div class="swiper-slide slide-container">
										{% if testimonial_image %}
											<div class="testimonials-image mb-3">
												<img class="texttestimonial-image-background lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src='{{ "#{testimonial}.jpg" | static_url | settings_image_url("small") }}' {% if testimonial_name %}alt="{{ testimonial_name }}"{% else %}alt="{{ 'Testimonio de' | translate }} {{ store.name }}"{% endif %} />
												<div class="placeholder-fade"></div>
											</div>
										{% endif %}
										{% if testimonial_description %}
											<p class="mb-3 px-5">{{ testimonial_description }}</p>
										{% endif %}
										{% if testimonial_name %}
											<div class="subtitle">{{ testimonial_name }}</div>
										{% endif %}
									</div>
								{% endif %}
							{% endfor %}
						</div>
					</div>
					<div class="d-block d-md-none mt-3">
						<div class="js-swiper-testimonials-pagination swiper-pagination swiper-pagination-bullets position-relative"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
{% endif %}
