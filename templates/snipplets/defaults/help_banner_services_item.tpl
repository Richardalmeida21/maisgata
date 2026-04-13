<div class="service-item-container col-md swiper-slide p-0 px-md-3">
	<div class="service-item mx-4 mx-md-0">
		<div class="text-center">
			{% if help_item_1 %}
				{% include "snipplets/svg/truck.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3"} %}
				<h3 class="mb-3">{{ "Medios de envío" | translate }}</h3>
			{% elseif help_item_2 %}
				{% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3"} %}
				<h3 class="mb-3">{{ "Tarjetas de crédito" | translate }}</h3>
			{% elseif help_item_3 %}
				{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3"} %}
				<h3 class="mb-3">{{ "WhatsApp" | translate }}</h3>
			{% endif %}
		</div>
	</div>
</div>