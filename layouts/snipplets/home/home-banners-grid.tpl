{% set banner = banner | default(false) %}
{% set banner_promotional = banner_promotional | default(false) %}
{% set banner_news = banner_news | default(false) %}
{% set module = module | default(false) %}

{% set theme_editor = params.preview %}

{% if banner %}
    {% set has_banners = settings.banner and settings.banner is not empty %}
    {% set has_mobile_banners = settings.toggle_banner_mobile and settings.banner_mobile and settings.banner_mobile is not empty %}
    {% set section_banner = mobile ? settings.banner_mobile : settings.banner %}
    {% set section_id = mobile ? 'banners-mobile' : 'banners' %}
    {% set section_title = settings.banner_title %}
    {% set section_slider = settings.banner_slider %}
    {% set section_columns_mobile_2 = settings.banner_columns_mobile == 2 %}
    {% set section_columns_desktop_4 = settings.banner_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_same_size %}
    {% set section_text_outside = settings.banner_text_outside %}
    {% set section_without_margins = settings.banner_without_margins %}
{% endif %}
{% if banner_promotional %}
    {% set has_banners = settings.banner_promotional and settings.banner_promotional is not empty %}
    {% set has_mobile_banners = settings.toggle_banner_promotional_mobile and settings.banner_promotional_mobile and settings.banner_promotional_mobile is not empty %}
    {% set section_banner = mobile ? settings.banner_promotional_mobile : settings.banner_promotional %}
    {% set section_id = mobile ? 'banners-promotional-mobile' : 'banners-promotional' %}
    {% set section_slider = settings.banner_promotional_slider %}
    {% set section_title = settings.banner_promotional_title %}
    {% set section_columns_mobile_2 = settings.banner_promotional_columns_mobile == 2 %}
    {% set section_columns_desktop_4 = settings.banner_promotional_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_promotional_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_promotional_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_promotional_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_promotional_same_size %}
    {% set section_text_outside = settings.banner_promotional_text_outside %}
    {% set section_without_margins = settings.banner_promotional_without_margins %}
{% endif %}
{% if banner_news %}
    {% set has_banners = settings.banner_news and settings.banner_news is not empty %}
    {% set has_mobile_banners = settings.toggle_banner_news_mobile and settings.banner_news_mobile and settings.banner_news_mobile is not empty %}
    {% set section_banner = mobile ? settings.banner_news_mobile : settings.banner_news %}
    {% set section_id = mobile ? 'banners-news-mobile' : 'banners-news' %}
    {% set section_title = settings.banner_news_title %}
    {% set section_slider = settings.banner_news_slider %}
    {% set section_columns_mobile_2 = settings.banner_news_columns_mobile == 2 %}
    {% set section_columns_desktop_4 = settings.banner_news_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_news_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_news_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_news_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_news_same_size %}
    {% set section_text_outside = settings.banner_news_text_outside %}
    {% set section_without_margins = settings.banner_news_without_margins %}
{% endif %}
{% if module %}
    {% set section_banner = settings.module %}
    {% set section_slider = settings.module_slider %}
    {% set section_id = 'modules' %}
    {% set section_same_size = settings.module_same_size %}
    {% set section_text_outside = true %}
    {% set section_first = settings.home_order_position_1 == 'modules' %}
{% endif %}

{% set visibility_classes = 
    has_banners and has_mobile_banners ? (mobile ? 'd-md-none' : 'd-none d-md-block') 
    : not has_banners and has_mobile_banners and not mobile ? 'd-none' 
%}
{% set banner_classes = module and not section_slider ? 'mb-md-4' %}

<div class="js-{{ section_id }} js-banner-container{% if section_without_margins %} js-banner-container-without-margin{% endif %} container{% if not module and (has_banners and has_mobile_banners) %} {{ visibility_classes }}{% endif %}">
    {% if (section_title or section_slider and (section_banner and section_banner is not empty)) or theme_editor %}
        <div class="row mb-3 pb-2">
            {% if not module or theme_editor %}
                <div class="js-section-col col">
                    <h2 class="js-section-title js-{{ section_id }}-title h3 mb-0"{% if not section_title %} style="display:none;"{% endif %}>{{ section_title }}</h2>
                </div>
            {% endif %}
            {% if (section_slider and (section_banner and section_banner is not empty)) or theme_editor %}
                <div class="js-swiper-controls col text-right d-none d-md-block">
                    <div class="js-swiper-{{ section_id }}-prev swiper-button-prev d-inline-block svg-circle svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                    <div class="js-swiper-{{ section_id }}-next swiper-button-next d-inline-block svg-circle svg-icon-text ml-2">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                </div>
            {% endif %}
        </div>
    {% endif %}
{% if section_without_margins and not module %}
</div>
<div class="js-{{ section_id }} js-banner-container container-fluid {{ visibility_classes }}">
{% endif %}
    <div class="row">
        <div class="js-banner-col col-12{% if section_slider and not section_without_margins %} pr-0 pr-md-3{% elseif section_without_margins %} p-0{% endif %}">
            {% if section_slider %}
                <div class="js-swiper-{{ section_id }} swiper-container">
                    <div class="js-banner-row swiper-wrapper">
            {% elseif not module or (module and theme_editor) %}
                <div class="js-banner-row row {% if section_without_margins %}no-gutters{% else %}row-grid{% endif %}">
            {% endif %}
            {% for slide in section_banner %}
                {% if not module or (module and (section_slider or theme_editor)) %}
                    <div class="js-banner {% if section_slider %}swiper-slide slide-container {% if not section_without_margins %}pr-3 pr-md-0{% endif %}{% else %}col-grid {% if section_columns_mobile_2 %}col-6 {% endif %}{% if section_columns_desktop_4 %}col-md-3{% elseif section_columns_desktop_3 %}col-md-4{% elseif section_columns_desktop_2 %}col-md-6{% elseif section_columns_desktop_1 %}col-md-12{% endif %}{% endif %}" data-transition="fade-in-up">
                {% endif %}
                    {% set has_banner_text = slide.title or slide.description or slide.button %}
                    <div class="js-textbanner textbanner text-center{% if section_without_margins %} textbanner-no-border m-0{% endif %} {{ banner_classes }}">
                        {% if slide.link %}
                            <a href="{{ slide.link | setting_url }}" class="textbanner-link" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
                        {% endif %}
                        {% if module %}
                            <div class="row no-gutters align-items-center">
                        {% endif %}
                        <div class="js-textbanner-image-container textbanner-image{% if not section_same_size %} p-0{% endif %}{% if module %} col-md-6{% if section_same_size %} textbanner-image-md{% endif %}{% if has_banner_text and not section_text_outside %} overlay{% endif %}{% endif %}">
                            <img {% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %} src="{% if not section_slider %}{{ 'images/empty-placeholder.png' | static_url }}{% endif %}" data-sizes="auto" data-expand="-10" data-srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" class="js-textbanner-image textbanner-image-effect {% if section_same_size %}textbanner-image-background{% else %}img-fluid d-block w-100{% endif %} lazyautosizes lazyload fade-in" {% if slide.title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                            <div class="placeholder-fade"></div>
                        {% if section_text_outside %}
                            </div>
                        {% endif %}
                        {% if has_banner_text %}
                            <div class="js-textbanner-text textbanner-text{% if module %} col-md-6 px-3 px-md-4 {% if not section_slider and loop.index is even %}order-md-first{% endif %}{% else %}{% if not section_text_outside %} over-image{% endif %}{% endif %}">
                                {% if slide.title %}
                                    <h3 class="h1{% if not module and section_columns_mobile_2 %}-md h6{% endif %} mb-0">{{ slide.title }}</h3>
                                {% endif %}
                                {% if slide.description %}
                                    <div class="textbanner-paragraph">{{ slide.description }}</div>
                                {% endif %}
                                {% if slide.button and slide.link %}
                                    <div class="btn btn-secondary btn-medium{% if section_columns_mobile_2 %}-md btn-small{% endif %} d-inline-block mt-2">{{ slide.button }}</div>
                                {% endif %}
                            </div>
                        {% endif %}
                        {% if not section_text_outside or module %}
                            </div>
                        {% endif %}
                        {% if slide.link %}
                            </a>
                        {% endif %}
                    </div>
                {% if not module or (module and (section_slider or theme_editor)) %}
                    </div>
                {% endif %}
            {% endfor %}
            {% if section_slider %}
                    </div>
                </div>
            {% else %}
                </div>
            {% endif %}
        </div>
    </div>
</div>