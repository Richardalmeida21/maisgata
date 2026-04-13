{# Instagram feed that work as examples #}

<section class="section-instafeed-home" data-store="home-instagram-feed">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="instafeed-title">
					{% include "snipplets/svg/instagram.tpl" with {svg_custom_class: "icon-inline icon-lg mr-1 svg-icon-text"} %}
					<h3 class="instafeed-user h5 mb-0">{{ 'Instagram' | translate }}</h3>
				</div>
				<div id="instafeed" class="row position-relative">
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés mostrar tus últimas novedades desde" | translate }} <strong>"{{ "Publicaciones de Instagram" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>