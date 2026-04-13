{% if not modal %}
    <div class="visible-when-content-ready">
        {% if parent_category and parent_category.id!=0 %}
            <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back d-block{% if filter_categories %} mb-4{% endif %}">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline mr-2 svg-icon-text"} %}{{ parent_category.name }}</a>
        {% endif %}
{% endif %}

        {% if filter_categories %}
            {% if not modal %}
                <div class="d-none d-md-block">
            {% endif %}
                    {% if modal %}
                        <h5 class="mb-3">{{ "Categorías" | translate }}</h5>
                    {% endif %}
                    <ul class="js-accordion-container list-unstyled mb-5"> 
                        {% for category in filter_categories %}
                            <li data-item="{{ loop.index }}" class="mb-2 pb-1 mb-md-3"><a href="{{ category.url }}" title="{{ category.name }}" class="btn-link no-underline">{{ category.name }}</a></li>

                            {% if loop.index == 8 and filter_categories | length > 8 %}
                                <div class="js-accordion-content" style="display: none;">
                            {% endif %}
                            {% if loop.last and filter_categories | length > 8 %}
                                </div>
                                <a href="#" class="js-accordion-toggle d-inline-block btn btn-link">
                                    <span class="js-accordion-toggle-inactive">{{ 'Ver más' | translate }}</span>
                                    <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                                </a>
                            {% endif %}
                        {% endfor %}
                    </ul>
            {% if not modal %}
                </div>
            {% endif %}
        {% endif %}
{% if not modal %}
    </div>
{% endif %}