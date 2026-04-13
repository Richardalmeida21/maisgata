{% if settings.show_instafeed and store.instagram and store.hasInstagramToken() %}
    <section class="section-instafeed-home" data-store="home-instagram-feed">
        <div class="container">
            <div class="row">
                {% set instuser = store.instagram|split('/')|last %}
                <div class="col-12">
                    <a target="_blank" href="{{ store.instagram }}" class="mb-0" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                        <div class="instafeed-title">
                            <div class="row">
                                <div class="col">
                                    {% include "snipplets/svg/instagram.tpl" with {svg_custom_class: "icon-inline icon-lg mr-2 svg-icon-text"} %} 
                                    <h2 class="instafeed-user h5 mb-0">{{ instuser }}</h2>
                                </div>
                                {# Instagram fallback info in case feed fails to load #}

                                <div class="col-auto text-right">
                                    <span class="btn-link ml-2">{{ 'Seguinos' | translate }}</span>
                                </div>
                                <div class="col-12 js-ig-fallback">
                                    <p class="mt-2">{{ 'Estamos en Instagram' | translate }}</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    {% if store.hasInstagramToken() %}
                        <div class="js-ig-success row row-grid pb-3"
                            data-ig-feed
                            data-ig-items-count="6"
                            data-ig-item-class="col-4 col-md-2 col-grid"
                            data-ig-link-class="instafeed-link"
                            data-ig-image-class="instafeed-img w-100 fade-in"
                            data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}"
                            style="display: none;">
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </section>
{% endif %}