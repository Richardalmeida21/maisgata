{# /*============================================================================
  #Home featured grid
==============================================================================*/

#Properties

#Featured Slider

#}

{% set featured_products = featured_products | default(false) %}
{% set new_products = new_products | default(false) %}
{% set sale_products = sale_products | default(false) %}
{% set theme_editor = params.preview %}

{# Check if slider is used #}

{% set has_featured_products_and_slider = featured_products and settings.featured_products_format != 'grid' %}
{% set has_featured_products_and_image = featured_products and "featured_products_image.jpg" | has_custom_image %}
{% set has_new_products_and_slider = new_products and settings.new_products_format != 'grid' %}
{% set has_sale_products_and_slider = sale_products and settings.sale_products_format != 'grid' %}
{% set use_slider = has_featured_products_and_slider or has_new_products_and_slider or has_sale_products_and_slider %}

{# Columns #}

{% set section_columns_grid_mobile = settings.grid_columns_mobile %}
{% set section_columns_grid_slider_mobile = section_columns_grid_mobile == '1' ? '1.15' : section_columns_grid_mobile == '2' ? '2.25' : '3.25' %}

{% if featured_products %}
    {% set sections_products = sections.primary.products %}
    {% set section_name = 'primary' %}
    {% set sections_horizontal_item = false %}
    {% set section_title = settings.featured_products_title %}
    {% set section_link = settings.featured_products_link %}
    {% set section_format = settings.featured_products_format %}
    {% set section_id = 'featured' %}
    {% set section_grid_desktop = settings.featured_products_desktop == 'default' ? 'true' : 'false' %}
    {% set section_grid_mobile = settings.featured_products_mobile == 'default' ? 'true' : 'false' %}
    {% set section_columns_desktop = settings.featured_products_desktop == 'default' ? settings.grid_columns_desktop : settings.featured_products_desktop %}
    {% set section_columns_mobile = settings.featured_products_mobile == 'default' ? settings.grid_columns_mobile : settings.featured_products_mobile %}
{% endif %}
{% if new_products %}
    {% set sections_products = sections.new.products %}
    {% set section_name = 'new' %}
    {% set sections_horizontal_item = true %}
    {% set section_title = settings.new_products_title %}
    {% set section_link = settings.new_products_link %}
    {% set section_format = settings.new_products_format %}
    {% set section_id = 'new' %}
    {% set section_grid_desktop = false %}
    {% set section_grid_mobile = false %}
    {% set section_columns_desktop = 3 %}
    {% set section_columns_mobile = 1 %}
{% endif %}
{% if sale_products %}
    {% set sections_products = sections.sale.products %}
    {% set section_name = 'sale' %}
    {% set sections_horizontal_item = false %}
    {% set section_title = settings.sale_products_title %}
    {% set section_link = settings.sale_products_link %}
    {% set section_format = settings.sale_products_format %}
    {% set section_id = 'sale' %}
    {% set section_grid_desktop = settings.sale_products_desktop == 'default' ? 'true' : 'false' %}
    {% set section_grid_mobile = settings.sale_products_mobile == 'default' ? 'true' : 'false' %}
    {% set section_columns_desktop = settings.sale_products_desktop == 'default' ? settings.grid_columns_desktop : settings.sale_products_desktop %}
    {% set section_columns_mobile = settings.sale_products_mobile == 'default' ? settings.grid_columns_mobile : settings.sale_products_mobile %}
{% endif %}

{% set section_columns_slider_desktop = has_featured_products_and_image ? '2' : section_columns_desktop %}
{% set section_columns_slider_mobile = section_columns_mobile == '1' ? '1.15' : section_columns_mobile == '2' ? '2.25' : '3.25' %}

<div class="js-products-{{ section_id }}-container container">
    <div class="js-products-{{ section_id }}-controls-container row mb-3 pb-2 align-items-center">
        {% if new_products %}
            <div class="js-products-new-title-and-controls col-md-2 pt-md-3">
                <div class="row">
        {% endif %}
                    <div class="col{% if new_products %} col-md-12{% endif %}">
                        <h2 class="js-products-{{ section_id }}-title h3 {% if new_products %}mb-3{% else %}mb-1{% endif %}">{{ section_title }}</h2>
                    </div>
                    <div class="js-products-{{ section_id }}-link-container col-auto text-right{% if new_products %} col-md-12 text-md-left mb-3{% endif %}" {% if not section_link %}style="display: none;"{% endif %}>
                        <a href="{{ section_link }}" class="js-products-{{ section_id }}-link-link btn-link">{{ "Ver todos" | translate }}</a>
                    </div>
        {% if new_products %}
                </div>
        {% endif %}
        {% if use_slider %}
            <div class="js-products-{{ section_id }}-controls {% if not new_products %}col{% if (featured_products and settings.featured_products_title) or (sale_products and settings.sale_products_title) %}-auto{% endif %} text-right {% endif %}d-none d-md-block">
                <div class="js-swiper-{{ section_id }}-prev swiper-button-prev d-inline-block svg-circle svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                <div class="js-swiper-{{ section_id }}-next swiper-button-next d-inline-block svg-circle svg-icon-text ml-2">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
            </div>
        {% endif %}
    </div>
    {% if not new_products %}
    <div class="js-featured-products-row row{% if has_featured_products_and_image %} no-gutters{% endif %}">
    {% endif %}
        {% if has_featured_products_and_image or (featured_products and theme_editor) %}
            <div class="js-products-featured-image-container col-12{% if settings.featured_products_format != 'grid' %} col-md-8{% endif %}" {% if not has_featured_products_and_image %}style="display: none;"{% endif %}>
                <div class="js-products-featured-image featured-product-image {% if use_slider %}featured-product-image-with-slider{% endif %}">
                    <img class="lazyautosizes lazyload" {% if  has_featured_products_and_image %}src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ 'featured_products_image.jpg' | static_url | settings_image_url('large') }} 480w, {{ 'featured_products_image.jpg' | static_url | settings_image_url('huge') }} 640w, {{ 'featured_products_image.jpg' | static_url | settings_image_url('original') }} 1024w" data-sizes="auto" data-expand="-10"{% endif %} {% if settings.featured_products_title %}alt="{{ featured_products_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                </div>
            </div>
        {% endif %}
        <div class="js-products-{{ section_id }}-grid-container col-12 {% if has_featured_products_and_image %}{% if settings.featured_products_format == 'grid' %}featured-product-container p-3{% else %} col-md-4{% endif %}{% elseif new_products %} col-md-10{% endif %}{% if use_slider and not has_featured_products_and_image %} pr-0 pr-md-3{% endif %} {% if has_featured_products_and_image %}featured-product-container {% if use_slider %}featured-product-image-with-slider{% endif %}{% endif %}">
            {% if use_slider %}
                <div class="js-swiper-{{ section_id }} swiper-container ">
             {% endif %}
                    <div class="js-products-{{ section_id }}-grid js-products-home-grid {% if use_slider %}swiper-wrapper{% else %}row row-grid{% endif %}" 
                    data-desktop-columns="{{ section_columns_desktop }}" 
                    data-mobile-columns="{{ section_columns_mobile }}" 
                    data-desktop-grid="{{ section_grid_desktop }}"
                    data-desktop-grid-columns="{{ settings.grid_columns_desktop }}"
                    data-mobile-grid="{{ section_grid_mobile }}"
                    data-mobile-grid-columns="{{ settings.grid_columns_mobile }}"
                    data-mobile-grid-slider-columns="{{ section_columns_grid_slider_mobile }}"
                    data-mobile-slider-columns="{{ section_columns_slider_mobile }}"
                    data-desktop-slider-columns="{{ section_columns_slider_desktop }}" 
                    data-format="{{ section_format }}" 
                    data-featured-image="{{ has_featured_products_and_image ? 'true' : 'false' }}" 
                    data-title="{{ section_title ? 'true' : 'false' }}" 
                    data-link="{{ section_link ? 'true' : 'false' }}" 
                    data-section-id="{{ section_id }}">
                        {% for product in sections_products %}
                            {% if use_slider %}
                                {% include 'snipplets/grid/item.tpl' with {'slide_item': true, 'section_name': section_name, 'horizontal_item': sections_horizontal_item } %}
                            {% else %}
                                {% include 'snipplets/grid/item.tpl' with {'horizontal_item': sections_horizontal_item } %}
                            {% endif %}
                        {% endfor %}
                    </div>
            {% if use_slider %}
                </div>
            {% endif %}
        </div>
    {% if not new_products %}
    </div>
    {% endif %}
</div>
