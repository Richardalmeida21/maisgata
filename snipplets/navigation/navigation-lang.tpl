{% if header %}
    <ul class="list list-unstyled font-small">
        {% for language in languages | escape %}
            <li class="list-item{% if loop.last %} mb-0{% endif %} {% if language.active %} font-weight-bold{% endif %}">
                <a href="{{ language.url }}">
                    {{ language.country_name }}
                </a>
            </li>
        {% endfor %}
    </ul>
{% else %}
    {% embed "snipplets/forms/form-select.tpl" with{select_label: false, select_custom_class: "js-lang-select", select_group_custom_class: "mb-0 form-vertical-align", select_small: true} %}
        {% block select_options %}
            {% for language in languages %}
                <option value="{{ language.country }}" data-country-url="{{ language.url }}" {% if language.active %}selected{% endif %}>{{ language.country_name }}</option>
            {% endfor %}
        {% endblock select_options%}
    {% endembed %}
{% endif %}
