{# Main categories item demo #}

{% set help_item_path =  help_item_1 ? 'main-category-1' : help_item_2 ? 'main-category-2' : 'main-category-3'  %}

<div class="swiper-slide w-auto text-center pr-3 pr-md-0">
	<div class="home-category home-category-placeholder">
		<div class="home-category-image">
			{% include 'snipplets/svg/help/help-' ~ help_item_path ~ '.tpl'  %}
		</div>
	</div>
</div>