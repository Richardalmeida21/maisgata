<div id="product-description" style="display: none;" class="mt-3 {% if settings.full_width_description %}col-12 p-0 px-md-3{% endif %}" data-store="product-description-{{ product.id }}">

    {# Product description #}

    {% if product.description is not empty %}
        <div class="user-content {% if not settings.full_width_description %}px-md-3{% endif %} mb-4">
            <h5>{{ "Descripción" | translate }}</h5>
            {{ product.description }}
        </div>
    {% endif %}

    {% if settings.show_product_fb_comment_box %}
        <div class="fb-comments section-fb-comments mb-3 {% if not settings.full_width_description %}px-md-3{% endif %}" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
    {% endif %}
    <div id="reviewsapp"></div>

    {# Product share #}

    {% include 'snipplets/social/social-share.tpl' %}
</div>