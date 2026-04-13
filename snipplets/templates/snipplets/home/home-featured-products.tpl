{% set has_featured = has_featured | default(false) and sections.primary.products %}
{% set has_new = has_new | default(false) and sections.new.products %}
{% set has_sale = has_sale | default(false) and sections.sale.products %}

{% if has_featured %}
    {% set section_id = 'featured' %}
{% elseif has_new %}
    {% set section_id = 'new' %}
{% else %}
    {% set section_id = 'sale' %}
{% endif %}

{% set section_featured_color_class = has_featured and settings.featured_product_colors ? 'section-featured-home-colors' %}

{% if has_featured or has_new or has_sale %}
    <section class="js-section-products-{{ section_id }} section-featured-home {{ section_featured_color_class }}" data-store="home-products-{{ section_id }}">
    	{% if has_featured %}
        	{% include 'snipplets/home/home-featured-grid.tpl' with {'featured_products': true} %}
        {% endif %}
        {% if has_new %}
        	{% include 'snipplets/home/home-featured-grid.tpl' with {'new_products': true} %}
        {% endif %}
        {% if has_sale %}
        	{% include 'snipplets/home/home-featured-grid.tpl' with {'sale_products': true} %}
        {% endif %}
    </section>
{% endif %}
