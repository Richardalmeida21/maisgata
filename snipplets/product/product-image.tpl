{% if home_main_product %}
	{% set show_thumbs = product.images_count > 1 %}
{% else %}
	{% set show_thumbs = product.images_count > 1 or product.video_url %}
{% endif %}
<div class="row" data-store="product-image-{{ product.id }}"> 
	{% if show_thumbs %}
		<div class="col-12 col-md-2{% if home_main_product %} d-none d-md-block{% endif %} order-last order-md-0 pr-0 pr-md-3">
			<div class="js-swiper-product-thumbs swiper-product-thumb mb-3"> 
				<div class="swiper-wrapper">
					{% for image in product.images %}
						<div class="swiper-slide w-auto">
							{% include 'snipplets/product/product-image-thumb.tpl' %}
						</div>
					{% endfor %}
					{% if not home_main_product %}
						{# Video thumb #}
						<div class="swiper-slide w-auto">
							{% include 'snipplets/product/product-video.tpl' with {thumb: true} %}
						</div>
					{% endif %}
				</div>
			</div>
			<div class="js-swiper-product-thumb-controls text-center d-none d-md-block">
				<div class="js-swiper-product-thumbs-prev swiper-button-prev swiper-product-thumb-control d-inline-block svg-circle svg-icon-text">{% include "snipplets/svg/chevron-up.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
				<div class="js-swiper-product-thumbs-next swiper-button-next swiper-product-thumb-control d-inline-block svg-circle svg-icon-text ml-2">{% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
			</div>
		</div>
	{% endif %}
	{% if product.images_count > 0 %}
		<div class="product-image-container {% if show_thumbs %}col-12 col-md-10{% else %}col-12{% endif %}">
			<div class="js-swiper-product swiper-container mb-3" style="visibility:hidden; height:0;" data-product-images-amount="{{ product.images_count }}">
				{% include 'snipplets/labels.tpl' with {'product_detail': true, 'shipping': true} %}
				<div class="swiper-wrapper">
					{% for image in product.images %}
					 <div class="swiper-slide js-product-slide slider-slide" data-image="{{image.id}}" data-image-position="{{loop.index0}}">
						{% if home_main_product %}
							<div class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
						{% else %}
							<a href="{{ image | product_image_url('original') }}" data-fancybox="product-gallery" class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
						{% endif %}
							<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w, {{  image | product_image_url('original') }} 1024w' data-sizes="auto" class="js-product-slide-img product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
							<img src="{{ image | product_image_url('tiny') }}" class="js-product-slide-img product-slider-image img-absolute img-absolute-centered blur-up" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
						{% if home_main_product %}
							</div>
						{% else %}
							</a>
						{% endif %}
					</div>
					{% endfor %}
					{% if not home_main_product %}
						{% include 'snipplets/product/product-video.tpl' %}
					{% endif %}
				</div>
			</div>
			{% if home_main_product %}
				<div class="d-block d-md-none">
					<div class="js-swiper-product-pagination swiper-pagination"></div>
				</div>
			{% endif %}
			{% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
		</div>
	{% endif %}
</div>