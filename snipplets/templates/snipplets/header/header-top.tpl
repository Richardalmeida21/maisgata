{% if settings.top_bar %}
	<div class="js-topbar section-topbar container-fluid d-none d-md-block">
		<div class="row align-items-center justify-content-end">
			{% if settings.top_menu_show %}
				<div class="col">
					{% include "snipplets/navigation/navigation-secondary.tpl" %}
				</div>
			{% endif %}
			<div class="col-auto">
				{% include "snipplets/header/header-utilities.tpl" with {use_account: true} %}
			</div>
		</div>
	</div>
{% endif %}