{% if settings.main_categories and settings.slider_categories and settings.slider_categories is not empty %}
    <section class="section-categories-home position-relative" data-store="home-categories-featured">
        <div class="container">
            <div class="row mb-3 pb-2">
                {% if settings.main_categories_title %}
                    <div class="col">
                        <h2 class="h3 mb-0">{{ settings.main_categories_title }}</h2>
                    </div>
                {% endif %}
                <div class="col text-right d-none d-md-block">
                    <div class="js-swiper-categories-prev swiper-button-prev d-inline-block svg-circle svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                    <div class="js-swiper-categories-next swiper-button-next d-inline-block svg-circle svg-icon-text ml-2">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 pr-0 pr-md-3 mb-4">
                    <div class="js-swiper-categories swiper-container">
                        <div class="swiper-wrapper">
                            {% for slide in settings.slider_categories %}
                                <div class="swiper-slide w-auto text-center pr-3 pr-md-0">
                                    {% if slide.link %}
                                        <a href="{{ slide.link | setting_url }}" class="js-home-category" aria-label="{{ 'Categoría' | translate }} {{ loop.index }}">
                                    {% endif %}
                                        <div class="home-category">
                                            <div class="home-category-image">
                                                <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('small') }}" class="swiper-lazy" alt="{{ 'Categoría' | translate }} {{ loop.index }}">
                                                <div class="placeholder-fade"></div>
                                            </div>
                                    {% if slide.link %}
                                                {% set category_handle = slide.link | trim('/') | split('/') | last %}
                                                {% include 'snipplets/home/home-categories-name.tpl' %}
                                            </div>
                                        </a>
                                    {% else %}
                                        </div>
                                    {% endif %}
                                </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
{% endif %}
