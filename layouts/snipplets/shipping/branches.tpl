<div class="js-accordion-container js-toggle-branches accordion {% if product_detail %}px-3 col-12{% else %}px-3 p-md-0{% endif %}">
    <a href="#" class="js-accordion-toggle py-3 row">
        <div class="col">
            <span class="h5">
                {% if store.branches|length > 1 %}
                    {{ 'Nuestros locales' | translate }}
                {% else %}
                    {{ 'Nuestro local' | translate }}
                {% endif %}
            </span>
        </div>
        <div class="col-auto">
            <span class="js-accordion-toggle-inactive">
                {% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline svg-icon-text"} %}
            </span>
            <span class="js-accordion-toggle-active" style="display: none;">
                {% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline svg-icon-text"} %}
            </span>
        </div>
    </a>
    <div class="js-accordion-content" style="display: none;">
    {% if not product_detail %}
        <div class="radio-buttons-group">
    {% else %}
        <div class="list mt-1">
    {% endif %}
            <ul class="radio-button-container list-unstyled {% if product_detail %}mt-2{% endif %}">

                {% for branch in store.branches %}
                    <li class="{% if product_detail %}list-item list-item-shipping radio-button{% else %}radio-button-item{% endif %}" data-store="branch-item-{{ branch.code }}">

                        {# If cart use radiobutton #}

                        {% if not product_detail %}
                            <label class="js-shipping-radio js-branch-radio radio-button" data-loop="branch-radio-{{loop.index}}">
                        
                                <input 
                                class="js-branch-method {% if cart.shipping_data.code == branch.code %} js-selected-shipping-method {% endif %} shipping-method" 
                                data-price="0" 
                                {% if cart.shipping_data.code == branch.code %}checked{% endif %} type="radio" 
                                value="{{branch.code}}" 
                                data-name="{{ branch.name }} - {{ branch.extra }}"
                                data-code="{{branch.code}}" 
                                data-cost="{{ 'Gratis' | translate }}"
                                name="option" 
                                style="display:none">
                                <div class="shipping-option row-fluid radio-button-content">
                                   <div class="radio-button-icons-container">
                                        <span class="radio-button-icons">
                                            <span class="radio-button-icon unchecked"></span>
                                            <span class="radio-button-icon checked"></span>
                                        </span>
                                    </div>
                        {% endif %}
                                    <div class="list-item-icon-container">
                                        <span class="list-item-icon"></span>
                                    </div>
                                    <div class="{% if product_detail %}list-item-content{% else %}radio-button-label{% endif %}">
                                        <div class="row">
                                            <div class="col font-small {% if not product_detail %}px-0{% endif %}">
                                                <div>{{ branch.name }} - {{ branch.extra }}</div>
                                            </div>
                                            <div class="col-auto text-right">
                                                <p class="text-accent mb-0 d-inline-block">{{ 'Gratis' | translate }}</p>
                                            </div>
                                        </div>
                                    </div>
                        {% if not product_detail %}
                                </div>
                            </label>
                        {% endif %}
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>