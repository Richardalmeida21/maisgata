{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>


{# Header #}

{# Logo mobile dynamic classes #}

{% if settings.logo_position_mobile == 'center' %}
    {% set logo_mobile_classes = 'text-center' %}
{% else %}
    {% set logo_mobile_classes = 'order-first text-left' %}
{% endif %}

{# Logo desktop dynamic classes + utilities desktop order #}

{% if settings.logo_position_desktop == 'center' %}
    {% set logo_desktop_classes = 'order-md-0 logo-md-offset text-md-center' %}
{% else %}
    {% set logo_desktop_classes = 'order-md-first text-md-left' %}
{% endif %}

{# Utilities mobile order #}

{% if settings.logo_position_mobile == 'center' %}
    {% set menu_mobile_utility_order_class = 'order-first' %}
{% else %}
    {% set menu_mobile_utility_order_class = 'order-last' %}
{% endif %}

{% set head_position_mobile = 'position-sticky' %}

{% if settings.head_fix_desktop %}
    {% set head_position_desktop = 'position-fixed-md' %}
{% else %}
    {% set head_position_desktop = 'position-relative-md' %}
{% endif %}

{% set has_languages = languages | length > 1 and settings.languages_header %}
{% set languages_desktop_column_class = has_languages and settings.logo_position_desktop == 'center' ? 'col-md-4 ml-md-0' %}
{% set search_mobile_order_class = has_languages and settings.logo_position_desktop == 'center' ? 'order-0' : 'order-1' %}
{% set logo_mobile_padding_class = has_languages and settings.logo_position_desktop == 'center' ? ' p-0' %}

<header class="js-head-main head-main {{ head_position_mobile }} {{ head_position_desktop }} transition-soft" data-store="head">

    {# Secondary nav and account links #}

    {% snipplet "header/header-top.tpl" %}

    {# Adversiting bar #}
    
    {% if settings.ad_bar %}
        {% snipplet "header/header-advertising.tpl" %}
    {% endif %}
	<div class="container-fluid">
		<div class="{% if not settings.head_fix_desktop %}js-nav-logo-bar{% endif %} row align-items-center {% if settings.search_big_mobile %}mb-1 mb-md-0{% endif %}">

            {# Menu icon #}

            <div class="col-auto col-utility {{ menu_mobile_utility_order_class }} {% if settings.logo_position_mobile == 'center' %}pl-3{% else %}pr-3{% endif %} d-md-none">
                {% include "snipplets/header/header-utilities.tpl" with {use_menu: true} %}
            </div>

            {# Search: Icon or box #}

            <div class="col-auto col-utility {{ search_mobile_order_class }} order-md-0 pr-md-0 pl-md-3 {% if settings.search_big_mobile %}d-none d-md-inline-block{% endif %} {{ languages_desktop_column_class }}">
                {% if settings.search_big_desktop and not settings.search_big_mobile %}
                    <span class="d-none d-md-block">
                {% endif %}
                        {% if not settings.search_big_desktop %}
                            <div class="js-search-controls-wrapper search-controls-wrapper {% if settings.logo_position_desktop == 'center' %}text-md-left{% else %}text-md-right{% endif %}">
                        {% endif %}
                            {% if settings.search_big_desktop %}
                                {% include "snipplets/header/header-search.tpl" %}
                            {% else %}
                                {% include "snipplets/header/header-utilities.tpl" with {use_search: true} %}
                            {% endif %}
                        {% if not settings.search_big_desktop %}
                            </div>
                        {% endif %}
                {% if settings.search_big_desktop and not settings.search_big_mobile %}
                    </span>
                    <span class="d-inline-block d-md-none">
                        {% include "snipplets/header/header-utilities.tpl" with {use_search: true} %}
                    </span>
                {% endif %}
            </div>

            {# Logo #}

            <div class="col {{ logo_mobile_classes }} {{ logo_desktop_classes }} {{ languages_desktop_column_class }}">
                {% set logo_size_class = settings.logo_size == 'small' ? 'logo-img-small' : settings.logo_size == 'big' ? 'logo-img-big' %}
                {{ component('logos/logo', {logo_img_classes: 'transition-soft ' ~ logo_size_class ~ logo_mobile_padding_class, logo_text_classes: 'h3 m-0'}) }}
            </div>

            <div class="col-auto {% if settings.logo_position_desktop == 'center' %}col-utility-cart text-md-right{% if has_languages %} justify-content-end{% endif %}{% endif %} col-utility order-2 {% if has_languages %}d-inline-flex{% endif %} {% if settings.logo_position_mobile == 'center' %}pr-3{% endif %} px-md-3 {{ languages_desktop_column_class }}">
                {# Languages #}
                {% if has_languages %}
                    {% include "snipplets/header/header-utilities.tpl" with {use_languages: true} %}
                {% endif %}

                {# Cart #}
                {% include "snipplets/header/header-utilities.tpl" %}
            </div>
		</div>
        {% if settings.ajax_cart and settings.head_fix_desktop %}
            <div class="d-none d-md-block">
                {% include "snipplets/notification.tpl" with {add_to_cart: true} %}
            </div>
        {% endif %}

        {# Mobile search big #}

        {% if settings.search_big_mobile %}
            <div class="js-big-search-mobile row no-gutters pb-3 d-block d-md-none">
                {% include "snipplets/header/header-search.tpl" %}
            </div>
        {% endif %}

        {# Desktop navigation below logo #}

        {% set has_head_banner_1 = settings.head_informative_banner_01_show and (settings.head_informative_banner_01_title or (settings.head_informative_banner_01_link_text and settings.head_informative_banner_01_url)) %}
        {% set has_head_banner_2 = settings.head_informative_banner_02_show and (settings.head_informative_banner_02_title or (settings.head_informative_banner_02_link_text and settings.head_informative_banner_02_url)) %}
        {% set has_header_banners = has_head_banner_1 or has_head_banner_2 %}

        <div class="js-menu-and-banners-row menu-and-banners-row row align-items-center d-none d-md-flex">
            <div class="js-desktop-nav-col col {% if settings.logo_position_desktop == 'center' and not has_header_banners %}text-center{% endif %}">
                {% snipplet "navigation/navigation.tpl" %}
            </div>
            {% if has_header_banners %}
                <div class="js-head-banners-col col-md-auto">
                    {% include "snipplets/header/header-banners.tpl" %}
                </div>
            {% endif %}
        </div>
	</div>    
    {% include "snipplets/notification.tpl" with {order_notification: true} %}
</header>

{% if has_header_banners %}
    <div class="container-fluid d-block d-md-none">
        {% include "snipplets/header/header-banners.tpl" %}
    </div>
{% endif %}

{# Show cookie validation message #}

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add to cart notification for non fixed header #}

{% if settings.ajax_cart %}
    <div class="{% if settings.head_fix_desktop %}d-md-none{% else %}d-md-block{% endif %}">
        {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
    </div>
{% endif %}

{# Cross selling promotion notification on add to cart #}

{% embed "snipplets/modal.tpl" with {
    modal_id: 'js-cross-selling-modal',
    modal_class: 'bottom modal-bottom-sheet h-auto overflow-none modal-body-scrollable-auto',
    modal_header_title: true,
    modal_header_class: 'p-3 w-100',
    modal_position: 'bottom',
    modal_transition: 'slide',
    modal_footer: true,
    modal_width: 'centered-md m-0 p-0 modal-full-width modal-md-width-400px',
    modal_close_class: 'mr-4'
} %}
    {% block modal_head %}
        {{ '¡Descuento exclusivo!' | translate }}
    {% endblock %}

    {% block modal_body %}
        {# Promotion info and actions #}

        <div class="js-cross-selling-modal-body" style="display: none"></div>
    {% endblock %}
{% endembed %}

{% include "snipplets/header/header-modals.tpl" %}
