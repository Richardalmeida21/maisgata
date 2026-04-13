{% if use_menu %}
	<span class="utilities-container">
		<a href="#" class="js-modal-open utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
			{% include "snipplets/svg/bars.tpl" with {svg_custom_class: "icon-inline utilities-icon align-bottom" }%}
		</a>
	</span>
{% elseif use_account %}
	<span class="utilities-container">
		<a href="{{ store.customer_login_url }}">
			{% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline utilities-icon mr-1"} %}
		</a>
		<span class="utilities-text d-inline-block">
			{% if not customer %}
				{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'mr-2') }} 
				{% if 'mandatory' not in store.customer_accounts %}
					|{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'ml-2') }}
				{% endif %}
			{% else %}
				{% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %} 
				{{ "¡Hola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url, '', 'mr-2') }} |
				{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'ml-2') }}
			{% endif %}
		</span>
	</span>
{% elseif use_languages %}
	<span class="utilities-container nav-dropdown pr-3">
		<span class="btn btn-medium btn-utility utilities-item">
			{% for language in languages if language.active %}
				<span class="font-big font-md-body">{{ language.country }}</span>
			{% endfor %}
			{% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline utilities-icon align-bottom py-1 ml-1" }%}
		</span>
		<div class="nav-dropdown-content desktop-dropdown-small text-left position-absolute">
			{% include "snipplets/navigation/navigation-lang.tpl" with { header: true } %}
		</div>
	</span>
{% elseif use_search %}
	<span class="utilities-container">
		<a href="#" class="js-search-button js-modal-open btn btn-medium btn-utility utilities-item" data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
			{% include "snipplets/svg/search.tpl" with {svg_custom_class: "icon-inline align-bottom utilities-icon"} %}
		</a>
	</span>
	{% if not settings.search_big_desktop %}
		{% include "snipplets/header/header-search.tpl" with {floating_search: true} %}
	{% endif %}
{% else %}
	<span class="utilities-container">
		<div id="ajax-cart" class="cart-summary" data-component='cart-button'>
			<a 
				{% if settings.ajax_cart and template != 'cart' %}
					href="#"
					data-toggle="#modal-cart" 
					data-modal-url="modal-fullscreen-cart"
				{% else %}
					href="{{ store.cart_url }}" 
				{% endif %}
				class="{% if settings.ajax_cart and template != 'cart' %}js-modal-open js-fullscreen-modal-open{% endif %} btn btn-medium btn-utility position-relative"
				>
				{% include "snipplets/svg/cart.tpl" with {svg_custom_class: "icon-inline utilities-icon cart-icon mr-md-1"} %}
				<span class="js-cart-widget-total cart-widget-total font-small mr-1 d-none {% if cart.items_count != '0' %}d-md-inline-block{% endif %}" data-priceraw="{{ cart.total }}">{{ cart.total | money }}</span>
				<span class="d-none d-md-inline-block">
				(
				</span>
					<span class="js-cart-widget-amount font-small badge {% if cart.items_count == '0' %}d-none d-md-inline-block{% endif %}">{{ "{1}" | translate(cart.items_count ) }}</span>
				<span class="d-none d-md-inline-block">
					)
				</span>
			</a>	
		</div>
	</span>
{% endif %}