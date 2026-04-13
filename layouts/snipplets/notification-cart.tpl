{% set notification_without_recommendations_classes = 'js-alert-added-to-cart notification-floating notification-cart-container notification-hidden' %}
{% set notification_wrapper_classes = 
    related_products ? 'row' 
    : not related_products and not settings.head_fix_desktop ? notification_without_recommendations_classes ~ ' position-fixed-md' 
    : notification_without_recommendations_classes 
%}

<div class="{{ notification_wrapper_classes }} {% if add_to_cart_fixed %}notification-fixed{% endif %}" {% if not related_products %}style="display: none;"{% endif %}>
    <div class="{% if related_products %}col-12 col-md mb-3 mb-md-0{% else %}notification notification-primary notification-cart position-relative{% endif %}">
        {% if not related_products %}
            <div class="js-cart-notification-close notification-close mr-2 mt-2">
                {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline icon-lg notification-icon"} %}
            </div>
        {% endif %}
        <div class="js-cart-notification-item row" data-store="cart-notification-item">
            <div class="{% if related_products %}col-3{% else %}col-2{% endif %} pr-0 notification-img">
                <img src="" class="js-cart-notification-item-img img-fluid" />
            </div>
            <div class="{% if related_products %}col-9{% else %}col-10{% endif %} text-left">
                <div class="mb-1 mr-4">
                    <span class="js-cart-notification-item-name"></span>
                    <span class="js-cart-notification-item-variant-container" style="display: none;">
                        (<span class="js-cart-notification-item-variant"></span>)
                    </span>
                </div>
                <div class="mb-1">
                    <span class="js-cart-notification-item-quantity"></span>
                    <span> x </span>
                    <span class="js-cart-notification-item-price"></span>
                </div>
                {% if not related_products %}
                    <strong>{{ '¡Agregado al carrito!' | translate }}</strong>
                {% endif %}
            </div>
        </div>
    {% if related_products %}
    </div>
    <div class="col-12 col-md-auto">
    {% else %}
    <div class="divider my-3"></div>
    {% endif %}
        <div class="row text-primary h5 mb-3 {% if not related_products %}h6-md{% endif %}">
            <span class="col-auto text-left">
                <strong>{{ "Total" | translate }}</strong> 
                (<span class="js-cart-widget-amount">
                    {{ "{1}" | translate(cart.items_count ) }} 
                </span>
                <span class="js-cart-counts-plural" style="display: none;">
                    {{ 'productos' | translate }}):
                </span>
                <span class="js-cart-counts-singular" style="display: none;">
                    {{ 'producto' | translate }}):
                </span>
            </span>
            <strong class="js-cart-total col text-right">{{ cart.total | money }}</strong>
        </div>
        <a href="#" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart" class="{% if related_products %}js-modal-close{% endif %} js-modal-open js-fullscreen-modal-open btn btn-primary btn-medium-md d-block">{{ 'Ver carrito' | translate }}</a>
    </div>
</div>