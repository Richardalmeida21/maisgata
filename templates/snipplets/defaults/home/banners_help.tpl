{# Main banners that work as examples #}

<div class="js-{{ banner_name }}-banner-placeholder">
	<div class="container">
		<div class="row row-grid">
			<div class="col-md col-grid">
				<div class="textbanner text-center">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text">
						<div class="h5">{{ banner_title }}</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ help_text }} <strong>"{{ section_name }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
			<div class="col-md col-grid">
				<div class="textbanner text-center">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text">
						<div class="h5">{{ banner_title }}</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ help_text }} <strong>"{{ section_name }}"</strong>
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
</div>

{# Skeleton of "true" section accessed from instatheme.js #}
<div class="js-{{ banner_name }}-banner-top" style="display:none">    
	{% if banner_name == 'category' %}
		{% include 'snipplets/home/home-banners.tpl' with {'has_banner': true} %}
	{% endif %}
	{% if banner_name == 'promotional' %}
		{% include 'snipplets/home/home-banners.tpl' with {'has_banner_promotional': true} %}
	{% endif %}
	{% if banner_name == 'news' %}
		{% include 'snipplets/home/home-banners.tpl' with {'has_banner_news': true} %}
	{% endif %}
</div>