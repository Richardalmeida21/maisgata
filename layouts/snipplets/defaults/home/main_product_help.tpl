{# Main product item demo #}

<section id="single-product" class="js-product-container section-featured-home" data-store="home-product-main">
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-8">
				<div class="row">
					<div class="col-12 col-md-2 d-none d-md-block order-last order-md-0 pr-0 pr-md-3">
						<div class="js-swiper-product-thumbs-demo swiper-product-thumb mb-3"> 
							<div class="swiper-wrapper">
								<div class="swiper-slide w-auto">
									<div class="d-block position-relative mr-3 mr-md-0 mb-md-3">
										{% include "snipplets/svg/help/help-product-3.tpl" %}
									</div>
								</div>
								<div class="swiper-slide w-auto">
									<div class="d-block position-relative mr-3 mr-md-0 mb-md-3">
										{% include "snipplets/svg/help/help-product-3-green.tpl" %}
									</div>
								</div>
								<div class="swiper-slide w-auto">
									<div class="d-block position-relative mr-3 mr-md-0 mb-md-3">
										{% include "snipplets/svg/help/help-product-3-red.tpl" %}
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="product-image-container col-12 col-md-10">
						<div class="js-swiper-product-demo swiper-container mb-3">
							<div class="swiper-wrapper">
								 <div class="js-product-slide-demo swiper-slide slider-slide" data-image="0" data-image-position="0">
									<div class="d-block position-relative">
										{% include "snipplets/svg/help/help-product-3.tpl" %}
									</div>
								 </div>
								 <div class="js-product-slide-demo swiper-slide slider-slide" data-image="1" data-image-position="1">
									<div class="d-block position-relative">
										{% include "snipplets/svg/help/help-product-3-green.tpl" %}
									</div>
								 </div>
								 <div class="js-product-slide-demo swiper-slide slider-slide" data-image="2" data-image-position="2">
									<div class="d-block position-relative">
										{% include "snipplets/svg/help/help-product-3-red.tpl" %}
									</div>
								 </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col pt-4">
				<div class="labels labels-product-slider">
					<div class="label label-accent">{{ "35% OFF" | translate }}</div>
				</div>

				{# Product name #}

				<h2 class="h1 pt-2 mb-3">{{ "Producto de ejemplo" | translate }}</h2>

				{# Product price #}

				{% set price_value = store.country == 'BR' ? '18200' : '182000' %}
				{% set price_compare_value = store.country == 'BR' ? '28000' : '280000' %}

				<div class="price-container mb-4">
					<div class="mb-2">
						<span class="d-inline-block h1">
							{{ price_value | money }}
						</span>
						<div class="d-inline-block price-compare h3">
							{{ price_compare_value | money }}
						</div>
					</div>
				</div>

				{# Product installments #}

				<div class="mb-3">{{ "Hasta 12 cuotas" | translate }}</div>

				{# Product form, includes: Variants, CTA and Shipping calculator #}

				<form id="product_form" class="js-product-form" method="post" action="">
					<div class="js-product-variants row">
						<div class="col col-md-6">
							<div class="form-group ">
								<label class="form-label " for="variation_1">{{ "Color" | translate }}</label>
								<select id="variation_1" class="form-select js-variation-option js-refresh-installment-data  " name="variation[0]">
									<option value="{{ "Verde" | translate }}">{{ "Verde" | translate }}</option>
									<option value="{{ "Rojo" | translate }}">{{ "Rojo" | translate }}</option>
								</select>
								<div class="form-select-icon">
									{% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-lg"} %}
								</div>
							</div>
						</div>
					</div>
					<div class="form-row mb-4">
						<div class="col-4">
							{% embed "snipplets/forms/form-input.tpl" with{
							type_number: true, input_value: '1', 
							input_name: 'quantity' ~ item.id, 
							input_custom_class: 'js-quantity-input', 
							input_label: false, 
							input_append_content: true, 
							input_group_custom_class: 'js-quantity form-quantity form-quantity-product mb-2', 
							form_control_container_custom_class: 'col', 
							form_control_quantity: true,
							input_min: '1'} %}
								{% block input_prepend_content %}
								<div class="form-row m-0 align-items-center">
									<span class="js-quantity-down form-quantity-icon btn">
										{% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-lg"} %}
									</span>
								{% endblock input_prepend_content %}
								{% block input_append_content %}
									<span class="js-quantity-up form-quantity-icon btn">
										{% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-lg"} %}
									</span>
								</div>
								{% endblock input_append_content %}
							{% endembed %}
						</div>
						<div class="col-8">
							<input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-block mb-4 cart" value="{{ 'Agregar al carrito' | translate }}" />
						</div>
					</div>
				 </form>

				{# Product description #}

				<div class="product-description user-content">
					<p>{{ "¡Este es un producto de ejemplo! Para poder probar el proceso de compra, debes" | translate }}
						<a href="/admin/products" target="_top">{{ "agregar tus propios productos." | translate }}</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
