{% if settings.quick_shop %}
    {% embed "snipplets/modal.tpl" with{modal_id: 'quickshop-modal', modal_class: 'quickshop bottom', modal_position: 'bottom', modal_transition: 'slide', modal_footer: false, modal_mobile_full_screen: true, modal_width: 'centered-md modal-centered-medium', modal_header_class: 'modal-floating-close modal-header-no-title'} %}
        {% block modal_body %}
            <div class="js-item-product" data-product-id="">
                <div class="js-product-container js-quickshop-container js-quickshop-modal js-quickshop-modal-shell" data-variants="" data-quickshop-id="">
                    <div class="row">
                        <div class="col-12 col-md-6 mb-1">
                            <div class="quickshop-image-container">
                                <div class="js-quickshop-image-padding">
                                    <img srcset="" class="js-item-image js-quickshop-img quickshop-image img-absolute-centered"/>
                                </div>
                            </div>
                        </div>
                        <div class="js-item-variants col-12 col-md-6">
                            <div class="js-item-name h2 mb-2" data-store="product-item-price-{{ product.id }}"></div>
                            <div class="item-price-container mb-3" data-store="product-item-price-{{ product.id }}">
                                <span class="js-price-display h1"></span>
                                <span class="js-compare-price-display h3 price-compare"></span>
                                {{ component('payment-discount-price', {
                                        visibility_condition: settings.payment_discount_price,
                                        location: 'product',
                                        container_classes: "h6 mt-1 text-accent",
                                        text_classes: {
                                            price: 'h3',
                                        },
                                    }) 
                                }}
                            </div>
                            {# Image is hidden but present so it can be used on cart notifiaction #}
                            
                            <div id="quickshop-form"></div>
                        </div>
                    </div>
                </div>
            </div>
        {% endblock %}
    {% endembed %}
{% endif %}