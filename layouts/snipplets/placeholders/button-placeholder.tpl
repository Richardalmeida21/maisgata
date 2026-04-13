<div class="js-addtocart js-addtocart-placeholder btn btn-{% if btn_secondary %}secondary{% else %}primary{% endif %} btn-block btn-transition {{ custom_class }} disabled" style="display: none;">
    <div class="d-inline-block">
        <span class="js-addtocart-text">{% if direct_add %}{{ 'Comprar' | translate }}{% else %}{{ 'Agregar al carrito' | translate }}{% endif %}</span>
        <span class="js-addtocart-success transition-container">
            {{ '¡Listo!' | translate }}
        </span>
        <div class="js-addtocart-adding transition-container transition-icon">
            {% include "snipplets/svg/spinner-third.tpl" with {svg_custom_class: "icon-inline btn-icon icon-spin font-body"} %}
        </div>
    </div>
</div>