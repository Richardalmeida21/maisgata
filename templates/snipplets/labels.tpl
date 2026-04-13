{% if product.compare_at_price > product.price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}

{% set has_product_available = product.available and product.display_price %}

{% if shipping %}
  {% set store_has_free_shipping = not product.is_non_shippable and (product.free_shipping or (has_product_available and (cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price))) %}

  {% set product_price_above_free_shipping_minimum = cart.free_shipping.min_price_free_shipping and (product.price >= cart.free_shipping.min_price_free_shipping.min_price_raw) %}
{% else %}
  {% set show_labels = not product.has_stock or product.compare_at_price or product.promotional_offer %}
{% endif %}

{% set has_multiple_slides = product.images_count > 1 or product.video_url %}

<div class="{% if product.video_url and product %}js-labels-group{% endif %} labels{% if shipping %}-absolute{% endif %} {% if product_detail %}labels-product-slider{% endif %}" data-store="product-{% if shipping %}shipping-{% endif %}item-labels">
  {% if store_has_free_shipping %}
    <div class="{% if not product.free_shipping %}js-free-shipping-minimum-label {% endif %} label" {% if not (product.free_shipping or product_price_above_free_shipping_minimum) %}style="display: none;"{% endif %}>{% include "snipplets/svg/truck.tpl" with {svg_custom_class: "icon-inline mr-1 icon-lg svg-icon-text"} %}{{ "Gratis" | translate }}</div>
  {% elseif show_labels %}
    {% if not product.has_stock %}
      <div class="{% if product_detail %}js-stock-label {% endif %}label label-default">{{ "Sin stock" | translate }}</div>
    {% else %}
      {% if product_detail %}
        <div class="js-stock-label label label-default" {% if product.has_stock %}style="display:none;"{% endif %}>{{ "Sin stock" | translate }}</div>
      {% endif %}
      {% if product.compare_at_price or product.promotional_offer %}
        <div class="{% if not product.promotional_offer and product %}js-offer-label{% endif %} label label-accent" {% if (not product.compare_at_price and not product.promotional_offer) or not product.display_price %}style="display:none;"{% endif %} data-store="product-item-{% if product.compare_at_price %}offer{% else %}promotion{% endif %}-label">
          {% if product.promotional_offer %}
            {{ component('promotion-label-text', {
              promotion_label_text_classes: {
                primary_text: 'd-block',
              },
            }) }}
          {% else %}
            -<span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>%
          {% endif %}
        </div>
      {% endif %}
    {% endif %}
  {% endif %}
</div>
<span class="hidden" data-store="stock-product-{{ product.id }}-{% if product.has_stock %}{% if product.stock %}{{ product.stock }}{% else %}infinite{% endif %}{% else %}0{% endif %}"></span>
