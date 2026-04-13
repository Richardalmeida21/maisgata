{# Whatsapp button #}
<a class="social-share-button d-block d-md-none mb-3" data-network="whatsapp" target="_blank" href="whatsapp://send?text={{ product.social_url }}" title="{{ 'Compartir en WhatsApp' | translate }}" aria-label="{{ 'Compartir en WhatsApp' | translate }}">
	{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline icon-md icon-w svg-icon-text"} %}
	<span class="btn-link">{{ "Whatsapp" | translate }}</span>
</a>

{# Facebook button #}
<a class="social-share-button d-block d-md-inline-block mb-3" data-network="facebook" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}" title="{{ 'Compartir en Facebook' | translate }}" aria-label="{{ 'Compartir en Facebook' | translate }}">
	{% include "snipplets/svg/facebook-f.tpl" with {svg_custom_class: "icon-inline icon-md icon-w svg-icon-text"} %}
	<span class="btn-link">{{ "Facebook" | translate }}</span>
</a>

{# Twitter button #}
<a class="social-share-button d-block d-md-inline-block mb-3" data-network="twitter" target="_blank" href="https://twitter.com/share?url={{ product.social_url }}" title="{{ 'Compartir en Twitter' | translate }}" aria-label="{{ 'Compartir en Twitter' | translate }}">
	{% include "snipplets/svg/twitter.tpl" with {svg_custom_class: "icon-inline icon-md icon-w svg-icon-text"} %}
	<span class="btn-link">{{ "Twitter" | translate }}</span>
</a>

{# Pinterest button #}
<a class="js-pinterest-share social-share-button d-block d-md-inline-block mb-3" data-network="pinterest" target="_blank" href="#" title="{{ 'Compartir en Pinterest' | translate }}" aria-label="{{ 'Compartir en Pinterest' | translate }}">
	{% include "snipplets/svg/pinterest.tpl" with {svg_custom_class: "icon-inline icon-md icon-w svg-icon-text"} %}
	<span class="btn-link">{{ "Pinterest" | translate }}</span>
</a>
<div class="pinterest-hidden social-share-button" style="display: none;" data-network="pinterest">
	{{product.social_url | pin_it('https:' ~ product.featured_image | product_image_url('large'))}}
</div>
