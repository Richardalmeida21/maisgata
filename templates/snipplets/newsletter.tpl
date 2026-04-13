{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}

{% if settings.news_show %}
    <div class="js-newsletter newsletter">
        {% if settings.news_title %}
            <div class="h4 mb-4">{{ settings.news_title }}</div>
        {% endif %}
        <form method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
            <div class="newsletter-form input-append">
                <div class="row">
                    <div class="col pr-2">
                        {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Email' | translate, input_custom_class: 'form-control-rounded', input_aria_label: 'Email' | translate } %}
                        {% endembed %}
                    </div>
                    <div class="col-auto pl-0">
                        <div class="winnie-pooh" style="display: none;">
                            <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                            <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                        </div>
                        <input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
                        <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                        <input type="hidden" name="type" value="newsletter" />
                        <input type="submit" name="contact" class="btn btn-medium btn-primary" value="{{ "Enviar" | translate }}" />
                    </div>
                </div>
            </div>
        </form>
        {% if contact and contact.type == 'newsletter' %}
            {% if contact.success %}
                <div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
            {% else %}
                <div class="alert alert-danger">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
            {% endif %}
        {% endif %}
    </div>
{% endif %}