{# Mobile Sharing #}
<div class="social-share {% if product.description is empty %}mt-3{% endif %} {% if not settings.full_width_description %}px-md-3{% endif %}">
	<div class="d-md-none">
		<a data-toggle="#social-share-modal" data-modal-url="modal-fullscreen-social-share" class="js-modal-open  font-small mb-3">
			{% include "snipplets/svg/share.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text mr-1"} %}
			<span class="btn-link font-small">{{ 'Compartir' | translate }}</span>
		</a>
		{% embed "snipplets/modal.tpl" with{modal_id: 'social-share-modal',modal_class: 'bottom-sheet', modal_position: 'bottom', modal_transition: 'slide', modal_header_title: true, modal_footer: true, modal_width: 'centered', modal_mobile_full_screen: 'true'} %}
			{% block modal_head %}
				{{ 'Compartir' | translate }}
			{% endblock %}
			{% block modal_body %}
				{% include 'snipplets/social/social-share-links.tpl' %}
			{% endblock %}
		{% endembed %}
	</div>
	<div class="d-none d-md-block">
		<h5>{{ "Compartir" | translate }}</h5>
		{% include 'snipplets/social/social-share-links.tpl' %}
	</div>
</div>