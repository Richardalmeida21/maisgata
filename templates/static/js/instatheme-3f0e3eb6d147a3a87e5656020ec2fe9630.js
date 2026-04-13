window.tiendaNubeInstaTheme = (function(jQueryNuvem) {
	return {
		waitFor: function() {
			return [];
		},
		placeholders: function() {
			return [
				{
					placeholder: '.js-home-slider-placeholder',
					content: '.js-home-slider-top',
					contentReady: function() {
						return $(this).find('img').length > 0;
					},
				},
				{
					placeholder: '.js-category-banner-placeholder',
					content: '.js-category-banner-top',
					contentReady: function() {
						return $(this).find('img').length > 0;
					},
				},
				{
					placeholder: '.js-promotional-banner-placeholder',
					content: '.js-promotional-banner-top',
					contentReady: function() {
						return $(this).find('img').length > 0;
					},
				},
				{
					placeholder: '.js-news-banner-placeholder',
					content: '.js-news-banner-top',
					contentReady: function() {
						return $(this).find('img').length > 0;
					},
				},
				{
					placeholder: '.js-module-banner-placeholder',
					content: '.js-module-banner-top',
					contentReady: function() {
						return $(this).find('img').length > 0;
					},
				},
			];
		},
		handlers: function(instaElements) {
			const handlers = {
				logo: new instaElements.Logo({
					$storeName: jQueryNuvem('#no-logo'),
					$logo: jQueryNuvem('#logo')
				}),
				// ----- Section order -----
				home_order_position: new instaElements.Sections({
					container: '.js-home-sections-container',
					data_store: {
						'slider': 'home-slider',
						'main_categories': 'home-categories-featured',
						'products': 'home-products-featured',
						'welcome': 'home-welcome-message',
						'institutional': 'home-institutional-message',
						'informatives': 'banner-services',
						'categories': 'home-banner-categories',
						'promotional': 'home-banner-promotional',
						'news_banners': 'home-banner-news',
						'new': 'home-products-new',
						'video': 'home-video',
						'sale': 'home-products-sale',
						'instafeed': 'home-instagram-feed',
						'main_product': 'home-product-main',
						'brands': 'home-brands',
						'testimonials': 'home-testimonials',
						'newsletter' : 'home-newsletter',
						'modules': 'home-image-text-module',
					}
				}),
			};

			// ----------------------------------- Slider -----------------------------------

			// Build the html for a slide given the data from the settings editor
			function buildHomeSlideDom(aSlide, imageClasses) {
				return '<div class="swiper-slide slide-container">' +
							(aSlide.link ? '<a href="' + aSlide.link + '">' : '' ) +
								'<img src="' + aSlide.src + '" class="js-slider-image slider-image ' + imageClasses + '"/>' +
								'<div class="container position-relative">' +
									'<div class="swiper-text swiper-' + aSlide.color + '">' +
										(aSlide.title ? '<div class="h1-huge mb-3">' + aSlide.title + '</div>' : '' ) +
										(aSlide.description ? '<p class="mb-3 pl-1">' + aSlide.description + '</p>' : '' ) +
										(aSlide.button && aSlide.link ? '<div class="btn btn-default d-inline-block">' + aSlide.button + '</div>' : '' ) +
									'</div>' +
								'</div>' +
								(aSlide.title || aSlide.description || aSlide.button && aSlide.link ? '<div class="swiper-overlay"></div>' : '' ) +
							(aSlide.link ? '</a>' : '' ) +
						'</div>'
			}

			// Update slider animation
			handlers.slider_animation = new instaElements.Lambda(function(sliderAnimation){
				const $swiperImage = $('.js-home-slider, .js-home-slider-mobile').find('.js-slider-image');
				const $homeSlider = $('.js-home-slider, .js-home-slider-mobile');

				if (sliderAnimation) {
					$homeSlider.attr('data-animation', 'true');
					$swiperImage.addClass('slider-image-animation');
				} else {
					$homeSlider.attr('data-animation', 'false');
					$swiperImage.removeClass('slider-image-animation');
				}
			});

			// Update main slider
			handlers.slider = new instaElements.Lambda(function(slides){
				if (!window.homeSwiper) {
					return;
				}

				// Update animation classes
				const sliderAnimation = $('.js-home-slider').attr('data-animation');
				const imageClasses = sliderAnimation == 'true' ? 'slider-image-animation' : '';

				window.homeSwiper.removeAllSlides();
				slides.forEach(function(aSlide){
					window.homeSwiper.appendSlide(buildHomeSlideDom(aSlide, imageClasses));
				});
				window.homeSwiper.update();
			});

			// Update mobile slider
			handlers.slider_mobile = new instaElements.Lambda(function(slides){
				// This slider is not included in the html if `toggle_slider_mobile` is not set.
				// The second condition could be removed if live preview for this checkbox is implemented but changing the viewport size forces a refresh, so it's not really necessary.
				if (!window.homeMobileSwiper || !window.homeMobileSwiper.slides) {
					return;
				}

				// Update animation classes
				const sliderAnimation = $('.js-home-slider-mobile').attr('data-animation');
				const imageClasses = sliderAnimation == 'true' ? 'slider-image-animation' : '';

				window.homeMobileSwiper.removeAllSlides();
				slides.forEach(function(aSlide){
					window.homeMobileSwiper.appendSlide(buildHomeSlideDom(aSlide, imageClasses));
				});
				window.homeMobileSwiper.update();
			});

			// ----------------------------------- Main Banners -----------------------------------

			// Build the html for a slide given the data from the settings editor

			var slideCount = 0;

			function buildHomeBannerDom(aSlide, bannerClasses, textBannerClasses, columnClasses, textClasses, imageContainerClasses, imageClasses, bannerModule) {
				slideCount++;
				var evenClass = slideCount % 2 === 0 ? 'js-banner-even order-md-first ' : '';
				return '<div class="js-banner ' + bannerClasses + (bannerModule ? ' col-12 ' : ' ') + columnClasses + '">' +
						'<div class="js-textbanner textbanner text-center ' + (bannerModule ? 'mb-md-4' : '') + textBannerClasses + '">' +
							(aSlide.link ? '<a href="' + aSlide.link + '">' : '' ) +
								(bannerModule ? '<div class="row no-gutters align-items-center">' : '' ) +
									'<div class="js-textbanner-image-container textbanner-image ' + (bannerModule ? 'col-md-6 ' : '') + imageContainerClasses + '">' +
										'<img src="' + aSlide.src + '" class="js-textbanner-image textbanner-image-effect ' + imageClasses + '">' +
									'</div>' +
									(aSlide.title || aSlide.description || aSlide.button ? '<div class="js-textbanner-text textbanner-text ' + (bannerModule ? 'col-md-6 px-3 px-md-4 ' + evenClass : '') + textClasses + '">' : '') +
										(aSlide.title ? '<div class="h1 mb-0">' + aSlide.title + '</div>' : '' ) +
										(aSlide.description ? '<div class="textbanner-paragraph">' + aSlide.description + '</div>' : '' ) +
										(aSlide.button && aSlide.link ? '<div class="btn btn-secondary btn-medium d-inline-block mt-2">' + aSlide.button + '</div>' : '' ) +
									(aSlide.title || aSlide.description || aSlide.button ? '</div>' : '') +
								(bannerModule ? '</div>' : '' ) +
							(aSlide.link ? '</a>' : '' ) +
						'</div>' +
					'</div>'
			}

			// Build swiper JS for Banners

			function initSwiperJS(bannerMainContainer, swiperId, swiperName, isModule){

				const swiperDesktopColumns = isModule ? 1 : bannerMainContainer.attr('data-desktop-columns');
				const swiperMobileColumns = (bannerMainContainer.attr('data-mobile-columns') == 2) ? 2.25 : 1.15;
				const bannerMargin = bannerMainContainer.attr('data-margin');
				const bannerSpaceBetween = bannerMargin == 'false' ? 0 : 20;

				// Initialize swiper
				createSwiper(`.js-swiper-${swiperId}`, {
					watchOverflow: true,
					centerInsufficientSlides: true,
					threshold: 5,
					watchSlideProgress: true,
					watchSlidesVisibility: true,
					slideVisibleClass: 'js-swiper-slide-visible',
					spaceBetween: bannerSpaceBetween,
					navigation: {
						nextEl: `.js-swiper-${swiperId}-next`,
						prevEl: `.js-swiper-${swiperId}-prev`
					},
					slidesPerView: swiperMobileColumns,
					breakpoints: {
						768: {
							slidesPerView: swiperDesktopColumns,
						}
					}
				},
				function(swiperInstance) {
					window[swiperName] = swiperInstance;
				});

			}

			['banner', 'banner_promotional', 'banner_news', 'module'].forEach(setting => {

				const bannerName = setting.replace('_', '-');
				const bannerPluralName = 
					setting == 'banner' ? 'banners' : 
					setting == 'banner_promotional' ? 'banners-promotional' : 
					setting == 'banner_news' ? 'banners-news' :
					setting == 'module' ? 'modules' :
					null;

				const isModule = setting == 'module';
				const $generalBannersContainer = $(`.js-home-${bannerName}`);

				// Main banner
				const $mainBannersContainer = $generalBannersContainer.find(`.js-${bannerPluralName}`);

				// Mobile banner
				const bannerMobileName = 
					setting == 'banner' ? 'banners-mobile' : 
					setting == 'banner_promotional' ? 'banners-promotional-mobile' : 
					setting == 'banner_news' ? 'banners-news-mobile' :
					null;
				const $mobileBannersContainer = $generalBannersContainer.find(`.js-${bannerMobileName}`);

				const bannerSwiper = 
					setting == 'banner' ? 'homeBannerSwiper' :
					setting == 'banner_promotional' ? 'homeBannerPromotionalSwiper' : 
					setting == 'banner_news' ? 'homeBannerNewsSwiper' :
					setting == 'module' ? 'homeModuleSwiper' :
					null;

				// Used for specific mobile images swiper updates
				const bannerSwiperMobile = 
					setting == 'banner' ? 'homeBannerMobileSwiper' : 
					setting == 'banner_promotional' ? 'homeBannerPromotionalMobileSwiper' : 
					setting == 'banner_news' ? 'homeBannerNewsMobileSwiper' :
					null;
				
				const bannerModuleSetting = setting == 'module' ? true : false;
				const bannerFormat = $generalBannersContainer.attr('data-format');

				const desktopColumns = $generalBannersContainer.attr('data-desktop-columns');
				const mobileColumns = $generalBannersContainer.attr('data-mobile-columns');

				// Update section title
				handlers[`${setting}_title`] = new instaElements.Text({
					element: `.js-${bannerPluralName}-title`,
					show: function(){
						$(this).show();
					},
					hide: function(){
						$(this).hide();
					},
				})

				// Update banners content and order

				handlers[`${setting}`] = new instaElements.Lambda(function(slides){

					// Update text classes
					const textPosition = $generalBannersContainer.attr('data-text');
					const textClasses = textPosition == 'above' ? 'over-image' : '';

					// Update margin classes
					const bannerMargin = $generalBannersContainer.attr('data-margin');
					const textBannerClasses = bannerMargin == 'false' ? 'textbanner-no-border m-0' : '';

					// Update image classes
					const imageSize = $generalBannersContainer.attr('data-image');
					const imageClasses = imageSize == 'same' ? 'textbanner-image-background' : 'img-fluid d-block w-100';
					const imageContainerClasses = 
						imageSize == 'original' ? 'p-0' : 
						isModule && imageSize == 'same' ? 'textbanner-image-md' : '';

					const bannerFormat = $generalBannersContainer.attr('data-format');

					if (bannerFormat == 'slider') {
						// Update banner classes
						const bannerClasses = 'swiper-slide slide-container';
						// Avoids columnsClasses on slider
						const columnClasses = '';

						if (!window[bannerSwiper]) {
							return;
						}

						// Try using already created swiper JS, if it fails initialize swipers again
						try{
							window[bannerSwiper].removeAllSlides();
							slides.forEach(function(aSlide){
								window[bannerSwiper].appendSlide(buildHomeBannerDom(aSlide, bannerClasses, textBannerClasses, columnClasses, textClasses, imageContainerClasses, imageClasses, bannerModuleSetting));
							});
							window[bannerSwiper].update();
						}catch(e){
							initSwiperJS($generalBannersContainer, bannerPluralName, bannerSwiper, isModule);

							setTimeout(function(){
								slides.forEach(function(aSlide){
									window[bannerSwiper].appendSlide(buildHomeBannerDom(aSlide, bannerClasses, textBannerClasses, columnClasses, textClasses, imageContainerClasses, imageClasses, bannerModuleSetting));
								});	
							},500);
						}
					} else {
						// Update banner classes
						const bannerClasses = isModule ? '' : 'col-grid';
						// Update column classes
						const desktopColumnsClasses = $generalBannersContainer.attr('data-grid-classes');
						const mobileColumns = $generalBannersContainer.attr('data-mobile-columns');
						const mobileColumnsClasses = mobileColumns == '2' ? 'col-6' : '';
						const columnClasses = desktopColumnsClasses + ' ' + mobileColumnsClasses;

						$mainBannersContainer.find('.js-banner').remove();
						$generalBannersContainer.find('.js-swiper-controls').remove();
						slides.forEach(function(aSlide){
							$mainBannersContainer.find('.js-banner-row').append(buildHomeBannerDom(aSlide, bannerClasses, textBannerClasses, columnClasses, textClasses, imageContainerClasses, imageClasses, bannerModuleSetting));
						});
					}

					$generalBannersContainer.data('format', bannerFormat);
				});

				function initSwiperElements(bannerRow, bannerCol, sectionCol, swiperId, swiperName, isModule) {

					const bannerMargin = $generalBannersContainer.attr('data-margin');
					const $bannerItem = $generalBannersContainer.find('.js-banner');

					$bannerItem.removeClass('col-grid col-6 col-12 col-md-3 col-md-4 col-md-6 col-md-12');

					// Row to swiper wrapper
					bannerRow.removeClass('row row-grid').addClass('swiper-wrapper');

					// Wrap everything inside a swiper container
					bannerRow.wrapAll(`<div class="js-swiper-${swiperId} swiper-container"></div>`);

					// Replace each banner into a slide
					$bannerItem.addClass('swiper-slide slide-container p-0');

					// Add previous and next controls
					sectionCol.after(`
						<div class="js-swiper-controls col text-right d-none d-md-block">
							<div class="js-swiper-${swiperId}-prev swiper-button-prev d-inline-block svg-circle svg-icon-text">
								<svg class="icon-inline icon-lg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><path d="M241,451.75l-18.11,18.1L9.07,256,222.92,42.15,241,60.25,45.28,256Z"/></svg>
							</div>
							<div class="js-swiper-${swiperId}-next swiper-button-next d-inline-block svg-circle svg-icon-text ml-2">
								<svg class="icon-inline icon-lg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><path d="M210.72,256,15,60.25l18.11-18.1L246.93,256,33.08,469.85,15,451.75Z"/></svg>
							</div>
						</div>
					`);

					if (bannerMargin == 'true' || isModule) {
						bannerCol.addClass('pr-0 pr-md-3');
					}

					// Initialize swiper

					initSwiperJS($generalBannersContainer, swiperId, swiperName, isModule);
				}

				// Build grid markup and reset swiper

				function resetSwiperElements(bannersGroupContainer, bannerRow, bannerCol, isModule) {
					const $bannerItem = bannersGroupContainer.find('.js-banner');
					const $bannerText = $generalBannersContainer.find('.js-textbanner');
					const $bannerTextEven = $generalBannersContainer.find('.js-banner-even');
					const $swiperControls = bannersGroupContainer.find('.js-swiper-controls');
					const desktopColumnsClasses = $generalBannersContainer.attr('data-grid-classes');
					const mobileColumns = $generalBannersContainer.attr('data-mobile-columns');
					const mobileColumnsClasses = mobileColumns == '2' ? 'col-6' : '';
					const columnClasses = desktopColumnsClasses + ' ' + mobileColumnsClasses;
					const bannerClasses = isModule ? '' : 'col-grid ' + columnClasses;

					bannerCol.removeClass('pr-0 pr-md-3');

					if (isModule) {
						$bannerItem.addClass('col-12');
						$bannerText.addClass('mb-md-4');
						$bannerTextEven.addClass('order-md-first');
					}

					// Remove duplicate slides and slider controls
					bannersGroupContainer.find('.swiper-slide-duplicate').remove();
					$swiperControls.remove();

					// Swiper wrapper to row
					bannerRow.removeClass('swiper-wrapper').addClass('row row-grid').removeAttr('style');

					// Undo all slider wrappers and restore original classes
					bannerRow.unwrap();
					$bannerItem
						.removeClass('js-swiper-slide-visible swiper-slide-active swiper-slide-next swiper-slide-prev swiper-slide slide-container p-0 pr-3 pr-md-0')
						.addClass(bannerClasses)
						.removeAttr('style');
				}

				// Toggle grid and slider view

				handlers[`${setting}_slider`] = new instaElements.Lambda(function(bannerSlider){

					const $sectionMainCol = $mainBannersContainer.find('.js-section-col');
					const $mainBannerCol = $mainBannersContainer.find('.js-banner-col');
					const $mainBannerRow = $mainBannersContainer.find('.js-banner-row');
					const $mainBanner = $mainBannersContainer.find('.js-textbanner');
					const $mainBannerText = $mainBannersContainer.find('.js-textbanner-text');

					// Mobile banners markup container
					const $sectionMobileCol = $mobileBannersContainer.find('.js-section-col');
					const $mobileBannerCol = $mobileBannersContainer.find('.js-banner-col');
					const $bannerMobileRow = $mobileBannersContainer.find('.js-banner-row');
					
					if (bannerSlider) {
						$generalBannersContainer.attr('data-format', 'slider');
						if (isModule) {
							$mainBanner.removeClass('mb-md-4');
							$mainBannerText.removeClass('order-md-first');
						}
					} else {
						$generalBannersContainer.attr('data-format', 'grid');
					}

					const bannerFormat = $generalBannersContainer.attr('data-format');

					const toSlider = bannerFormat == "slider";

					const $bannerItem = $generalBannersContainer.find('.js-banner');

					if ($generalBannersContainer.data('format') == bannerFormat) {
						// Nothing to do
						return;
					}

					// From grid to slider
					if (toSlider) {
						initSwiperElements($mainBannerRow, $mainBannerCol, $sectionMainCol, bannerPluralName, bannerSwiper, isModule);
						if (!isModule) {
							initSwiperElements($bannerMobileRow, $mobileBannerCol, $sectionMobileCol, bannerMobileName, bannerSwiperMobile);
						}
					// From slider to grid
					} else {
						resetSwiperElements($generalBannersContainer, $mainBannerRow, $mainBannerCol, isModule);
						if (!isModule) {
							resetSwiperElements($generalBannersContainer, $bannerMobileRow, $mobileBannerCol);
						}
					}

					// Persist new format in data attribute
					$generalBannersContainer.data('format', bannerFormat);
				});

				// Update banner text position
				handlers[`${setting}_text_outside`] = new instaElements.Lambda(function(hasOutsideText){
					const $bannerText = $generalBannersContainer.find('.js-textbanner-text');

					if (hasOutsideText) {
						$generalBannersContainer.attr('data-text', 'outside');
						$bannerText.removeClass('over-image');
					} else {
						$generalBannersContainer.attr('data-text', 'above');
						$bannerText.addClass('over-image');
					}
				});

				// Update banner size
				handlers[`${setting}_same_size`] = new instaElements.Lambda(function(bannerSize){
					const $bannerImageContainer = $generalBannersContainer.find('.js-textbanner-image-container');
					const $bannerImage = $generalBannersContainer.find('.js-textbanner-image');

					if (bannerSize) {
						$generalBannersContainer.attr('data-image', 'same');
						$bannerImageContainer.removeClass('p-0');
						if (isModule) {
							$bannerImageContainer.addClass('textbanner-image-md');
						}
						$bannerImage.removeClass('img-fluid d-block w-100').addClass('textbanner-image-background');
					} else {
						$generalBannersContainer.attr('data-image', 'original');
						$bannerImageContainer.addClass('p-0');
						if (isModule) {
							$bannerImageContainer.removeClass('textbanner-image-md');
						}
						$bannerImage.removeClass('textbanner-image-background').addClass('img-fluid d-block w-100');
					}
				});

				if (!isModule) {
					// Update banner margins
					handlers[`${setting}_without_margins`] = new instaElements.Lambda(function(bannerMargin){
						const $bannerContainer = $generalBannersContainer.find('.js-banner-container:not(.js-banner-container-without-margin)');
						const $bannerCol = $generalBannersContainer.find('.js-banner-col');
						const $bannerRow = $generalBannersContainer.find('.js-banner-row:not(.swiper-wrapper)');
						const $bannerMainTitle = $generalBannersContainer.find('.js-section-title');
						const $bannerItemContainer = $generalBannersContainer.find('.js-banner');
						const $bannerItem = $bannerItemContainer.find('.js-textbanner');
						const $bannerItemSlide = $generalBannersContainer.find('.js-banner.swiper-slide');
						const bannerFormat = $generalBannersContainer.attr('data-format');

						if (bannerMargin) {
							$generalBannersContainer.attr('data-margin', 'false');
							$bannerContainer.removeClass('container').addClass('container-fluid p-0');
							$bannerRow.removeClass('row-grid').addClass('no-gutters');
							$bannerMainTitle.addClass('container');
							$bannerItemContainer.addClass('m-0');
							$bannerItem.addClass('textbanner-no-border m-0');
							$bannerItemSlide.addClass('p-0');
							$bannerCol.addClass('p-0');
						} else {
							$generalBannersContainer.attr('data-margin', 'true');
							$bannerContainer.removeClass('container-fluid p-0').addClass('container');
							$bannerRow.removeClass('no-gutters').addClass('row-grid');
							$bannerMainTitle.removeClass('container');
							$bannerItemContainer.removeClass('m-0');
							$bannerItem.removeClass('textbanner-no-border m-0');
							$bannerItemSlide.removeClass('p-0');
							$bannerCol.removeClass('p-0');
						}

						// Updates slider width to avoids swipes inconsistency
						if (bannerFormat == 'slider') {
							// Try using already created swiper JS, if it fails initialize swipers again
							try{
								if (bannerMargin) {
									window[bannerSwiper].params.spaceBetween = 0;
									window[bannerSwiperMobile].params.spaceBetween = 0;
								} else {
									window[bannerSwiper].params.spaceBetween = 20;
									window[bannerSwiperMobile].params.spaceBetween = 20;
								}

								window[bannerSwiper].params.observer = true;
								window[bannerSwiper].update();

								window[bannerSwiperMobile].params.observer = true;
								window[bannerSwiperMobile].update();
							}catch(e){
								initSwiperJS($generalBannersContainer, bannerPluralName, bannerSwiper);
								initSwiperJS($generalBannersContainer, bannerMobileName, bannerSwiperMobile);
							}
						}
					});

					// Update quantity desktop banners
					handlers[`${setting}_columns_desktop`] = new instaElements.Lambda(function(bannerQuantity){
						const $bannerItem = $generalBannersContainer.find('.js-banner');
						const bannerFormat = $generalBannersContainer.attr('data-format');

						$bannerItem.removeClass('col-md-3 col-md-4 col-md-6 col-md-12');
						if (bannerQuantity == 4) {
							$generalBannersContainer.attr('data-desktop-columns', bannerQuantity);
							$generalBannersContainer.attr('data-grid-classes', 'col-md-3');

							if (bannerFormat == 'grid') {
								$bannerItem.addClass('col-md-3');
							} else {
								if (window.innerWidth > 768) {
									window[bannerSwiper].params.slidesPerView = 4;
									window[bannerSwiperMobile].params.slidesPerView = 4;
								}
							}
						} else if (bannerQuantity == 3) {
							$generalBannersContainer.attr('data-desktop-columns', bannerQuantity);
							$generalBannersContainer.attr('data-grid-classes', 'col-md-4');

							if (bannerFormat == 'grid') {
								$bannerItem.addClass('col-md-4');
							} else {
								if (window.innerWidth > 768) {
									window[bannerSwiper].params.slidesPerView = 3;
									window[bannerSwiperMobile].params.slidesPerView = 3;
								}
							}
						} else if (bannerQuantity == 2) {
							$generalBannersContainer.attr('data-desktop-columns', bannerQuantity);
							$generalBannersContainer.attr('data-grid-classes', 'col-md-6');

							if (bannerFormat == 'grid') {
								$bannerItem.addClass('col-md-6');
							} else {
								if (window.innerWidth > 768) {
									window[bannerSwiper].params.slidesPerView = 2;
									window[bannerSwiperMobile].params.slidesPerView = 2;
								}
							}
						} else if (bannerQuantity == 1) {
							$generalBannersContainer.attr('data-desktop-columns', bannerQuantity);
							$generalBannersContainer.attr('data-grid-classes', 'col-md-12');

							if (bannerFormat == 'grid') {
								$bannerItem.addClass('col-md-12');
							} else {
								if (window.innerWidth > 768) {
									window[bannerSwiper].params.slidesPerView = 1;
									window[bannerSwiperMobile].params.slidesPerView = 1;
								}
							}
						}

						if (bannerFormat == 'slider') {
							// Try using already created swiper JS, if it fails initialize swipers again
							try{
								window[bannerSwiper].update();
								window[bannerSwiperMobile].update();
							}catch(e){
								initSwiperJS($generalBannersContainer, bannerPluralName, bannerSwiper);
								initSwiperJS($generalBannersContainer, bannerMobileName, bannerSwiperMobile);
							}
						}
					});

					// Update quantity mobile banners
					handlers[`${setting}_columns_mobile`] = new instaElements.Lambda(function(bannerQuantity){
						const $bannerItem = $generalBannersContainer.find('.js-banner');
						const bannerFormat = $generalBannersContainer.attr('data-format');

						$bannerItem.removeClass('col-6');
						if (bannerQuantity == 2) {
							$generalBannersContainer.attr('data-mobile-columns', bannerQuantity);
							if (bannerFormat == 'grid') {
								$bannerItem.addClass('col-6');
							} else {
								if (window.innerWidth < 768) {
									window[bannerSwiper].params.slidesPerView = 2.25;
									window[bannerSwiperMobile].params.slidesPerView = 2.25;
								}
							}
						} else if (bannerQuantity == 1) {
							$generalBannersContainer.attr('data-mobile-columns', bannerQuantity);
							if (bannerFormat == 'slider') {
								if (window.innerWidth < 768) {
									window[bannerSwiper].params.slidesPerView = 1.15;
									window[bannerSwiperMobile].params.slidesPerView = 1.15;
								}
							}
						}

						if (bannerFormat == 'slider') {
							// Try using already created swiper JS, if it fails initialize swipers again
							try{
								window[bannerSwiper].update();
								window[bannerSwiperMobile].update();
							}catch(e){
								initSwiperJS($generalBannersContainer, bannerPluralName, bannerSwiper);
								initSwiperJS($generalBannersContainer, bannerMobileName, bannerSwiperMobile);
							}
						}
					});

					// Toggle mobile banners visibility

					handlers[`toggle_${setting}_mobile`] = new instaElements.Lambda(function(showMobileBanner){
						const bannerFormat = $generalBannersContainer.attr('data-format');

						$mainBannersContainer.removeClass("hidden d-md-none d-none d-md-block");
						$mobileBannersContainer.removeClass("hidden d-md-none d-none d-md-block");

						if (showMobileBanner) {
							// Each breakpoint shows on it's own device content
							$mainBannersContainer.addClass("d-none d-md-block");
							$mobileBannersContainer.addClass("d-md-none");
							$generalBannersContainer.attr('data-mobile-banners', '1');
							if (bannerFormat == 'slider') {
								// Try using already created swiper JS, if it fails initialize swipers again
								try{
									window[bannerSwiperMobile].update();
								}catch(e){
									initSwiperJS($generalBannersContainer, bannerMobileName, bannerSwiperMobile);
								}
							}
						} else {
							// Hide mobile banners
							$mobileBannersContainer.addClass("d-none");
							$generalBannersContainer.attr('data-mobile-banners', '0');
							if (bannerFormat == 'slider') {
								// Try using already created swiper JS, if it fails initialize swipers again
								try{
									window[bannerSwiper].update();
								}catch(e){
									initSwiperJS($generalBannersContainer, bannerPluralName, bannerSwiper);
								}
							}
						}
					});
				}
			});

			// Mobile banners: Banner content and order updates

			['banner_mobile', 'banner_promotional_mobile', 'banner_news_mobile'].forEach(setting => {

				const bannerName = setting.replace('_', '-').replace(/[-_]mobile$/, '');
				const bannerMobileName = 
					setting == 'banner_mobile' ? 'banners-mobile' : 
					setting == 'banner_promotional_mobile' ? 'banners-promotional-mobile' : 
					setting == 'banner_news_mobile' ? 'banners-news-mobile' :
					null;
				const $generalBannersContainer = $(`.js-home-${bannerName}`);

				// Target specific breakpoint to build correct slides on each device
				const $mobileBannersContainer = $generalBannersContainer.find(`.js-${bannerMobileName}`);

				const bannerSwiperMobile = 
					setting == 'banner_mobile' ? 'homeBannerMobileSwiper' : 
					setting == 'banner_promotional_mobile' ? 'homeBannerPromotionalMobileSwiper' : 
					setting == 'banner_news_mobile' ? 'homeBannerNewsMobileSwiper' :
					null;

				const desktopColumns = $generalBannersContainer.data('desktop-columns');
				const mobileColumns = $generalBannersContainer.data('mobile-columns');

				// Update banners content and order

				handlers[`${setting}`] = new instaElements.Lambda(function(slides){

					// Update text classes
					const textPosition = $generalBannersContainer.attr('data-text');
					const textClasses = textPosition == 'above' ? 'over-image' : '';

					// Update margin classes
					const bannerMargin = $generalBannersContainer.attr('data-margin');
					const textBannerClasses = bannerMargin == 'false' ? 'textbanner-no-border m-0' : '';

					// Update image classes
					const imageSize = $generalBannersContainer.attr('data-image');
					const imageClasses = imageSize == 'same' ? 'textbanner-image-background' : 'img-fluid d-block w-100';
					const imageContainerClasses = imageSize == 'original' ? 'p-0' : '';

					const bannerFormat = $generalBannersContainer.attr('data-format');
					const bannerModuleSetting = false;
					const isModule = false;
					
					if (bannerFormat == 'slider') {
						// Update banner classes
						const bannerClasses = 'swiper-slide slide-container';
						// Avoids columnsClasses on slider
						const columnClasses = '';

						if (!window[bannerSwiperMobile]) {
							return;
						}

						// Try using already created swiper JS, if it fails initialize swipers again
						try{

							window[bannerSwiperMobile].removeAllSlides();
							slides.forEach(function(aSlide){
								window[bannerSwiperMobile].appendSlide(buildHomeBannerDom(aSlide, bannerClasses, textBannerClasses, columnClasses, textClasses, imageContainerClasses, imageClasses, bannerModuleSetting));
							});
							window[bannerSwiperMobile].update();
						}catch(e){
							initSwiperJS($generalBannersContainer, bannerMobileName, bannerSwiperMobile, isModule);

							setTimeout(function(){
								slides.forEach(function(aSlide){
									window[bannerSwiperMobile].appendSlide(buildHomeBannerDom(aSlide, bannerClasses, textBannerClasses, columnClasses, textClasses, imageContainerClasses, imageClasses, bannerModuleSetting));
								});	
							},500);
						}

					} else {
						// Update banner classes
						const bannerClasses = 'col-grid';
						// Update column classes
						const desktopColumnsClasses = $generalBannersContainer.attr('data-grid-classes');
						const mobileColumns = $generalBannersContainer.attr('data-mobile-columns');
						const mobileColumnsClasses = mobileColumns == '2' ? 'col-6' : '';
						const columnClasses = desktopColumnsClasses + ' ' + mobileColumnsClasses;

						$mobileBannersContainer.find('.js-banner').remove();
						slides.forEach(function(aSlide){
							$mobileBannersContainer.find('.js-banner-row').append(buildHomeBannerDom(aSlide, bannerClasses, textBannerClasses, columnClasses, textClasses, imageContainerClasses, imageClasses));
						});
					}

					$generalBannersContainer.data('format', bannerFormat);
				});
			});

			// ----------------------------------- Welcome Message -----------------------------------

			// Update welcome message title
			handlers.welcome_message = new instaElements.Text({
				element: '.js-welcome-message-title',
				show: function(){
					$(this).show();
				},
				hide: function(){
					$(this).hide();
				},
			});

			// Update welcome message subtitle
			handlers.welcome_text = new instaElements.Text({
				element: '.js-welcome-message-text',
				show: function(){
					$(this).show();
				},
				hide: function(){
					$(this).hide();
				},
			});

			// ----------------------------------- Institutional Message -----------------------------------

			// Update institutional message title
			handlers.institutional_message = new instaElements.Text({
				element: '.js-institutional-message-title',
				show: function(){
					$(this).show();
				},
				hide: function(){
					$(this).hide();
				},
			});

			// Update institutional message subtitle
			handlers.institutional_text = new instaElements.Text({
				element: '.js-institutional-message-text',
				show: function(){
					$(this).show();
				},
				hide: function(){
					$(this).hide();
				},
			});

			// ----------------------------------- Highlighted Products -----------------------------------

			// Same logic applies to all 3 types of highlighted products

			function updateProductsDesktopQuantity(quantity, format, item, setting, featuredImage, swiper) {
				if (format == 'grid') {
					if (quantity == 6) {
						item.addClass('col-md-2');
					} else if (quantity == 5) {
						item.addClass('col-md-2-4');
					} else if (quantity == 4) {
						item.addClass('col-md-3');
					} else if (quantity == 3) {
						item.addClass('col-md-4');
					}
				}else{
					if((setting == 'featured') && (featuredImage == 'true')){
						window[swiper].params.slidesPerView = '2';
					}else{
						window[swiper].params.slidesPerView = quantity;
					}
					window[swiper].update();
				}
			}

			function updateProductsMobileQuantity(quantity, sliderQuantity, format, item, swiper) {
				if (format == 'grid') {
					if (quantity == 1) {
						item.addClass('col-12');
					} else if (quantity == 2) {
						item.addClass('col-6');
					}
				}else{
					window[swiper].params.slidesPerView = sliderQuantity;
					window[swiper].update();
				}
			}

			['featured', 'sale', 'new'].forEach(setting => {
				const $section = $(`.js-section-products-${setting}`);
				const $productContainer = $(`.js-products-${setting}-container`);
				const $productGridContainer = $(`.js-products-${setting}-grid-container`);
				const $productGrid = $(`.js-products-${setting}-grid`);
				const $productItem = $productGrid.find('.js-item-product');
				const $productItemInfoContainer = $productGrid.find(".js-item-info-container");
				const $productFeaturedImageContainer = $(".js-products-featured-image-container");
				const $productFeaturedImage = $(".js-products-featured-image");

				const productSwiper = 
					setting == 'featured' ? 'productsFeaturedSwiper' : 
					setting == 'new' ? 'productsNewSwiper' : 
					setting == 'sale' ? 'productsSaleSwiper' :
					null;

				// Updates title text
				handlers[`${setting}_products_title`] = new instaElements.Text({
					element: `.js-products-${setting}-title`,
					show: function() {
						$(this).show();
						if((setting == 'featured') || (setting == 'sale')){
							$(`.js-products-${setting}-controls`).removeClass("col").addClass("col-auto");
						}else{
							const productFormat = $productGrid.attr('data-format');
							$(".js-products-new-title-and-controls").show();
							if((productFormat == 'slider') && $productItem.length > 3){
								//Update swiper when layout changes
								window[productSwiper].update();
							}
						}
						$productGrid.attr("data-title", "true");
					},
					hide: function() {
						$(this).hide();
						if((setting == 'featured') || (setting == 'sale')){
							$(`.js-products-${setting}-controls`).addClass("col").removeClass("col-auto");
						}else{
							const productFormat = $productGrid.attr('data-format');
							const sectionLink = $productGrid.attr("data-link");
							if(((productFormat == 'slider') && $productItem.length > 3) || (sectionLink == 'true')){
								$(".js-products-new-title-and-controls").show();
							}else{
								$(".js-products-new-title-and-controls").hide();
								if(productFormat == 'slider'){
									//Update swiper when layout changes
									window[productSwiper].update();
								}
							}
						}
						$productGrid.attr("data-title", "false");
					},
				})

				// Updates see all products link

				handlers[`${setting}_products_link`] = new instaElements.Lambda(function(allProductsLink){
					const $link = $(`.js-products-${setting}-link-container`);
					if(allProductsLink){
						$link.show();
					}else{
						$link.hide();
					}
				})

				if(setting != 'new'){

					// Updates quantity products desktop
					handlers[`${setting}_products_desktop`] = new instaElements.Lambda(function(desktopProductQuantity){

						if (window.innerWidth > 768) {
							
							$productItem.removeClass('col-md-2 col-md-2-4 col-md-3 col-md-4');
							const productFormat = $productGrid.attr('data-format');
							const productHomeFeaturedImage = $productGrid.attr('data-featured-image');
							if (desktopProductQuantity == 'default') {
								$productGrid.attr('data-desktop-grid', 'true');
								const desktopListQuantity = $productGrid.attr('data-desktop-grid-columns');
								$productGrid.attr('data-desktop-columns', desktopListQuantity);
								updateProductsDesktopQuantity(desktopListQuantity, productFormat, $productItem, setting, productHomeFeaturedImage, productSwiper);
							}else{
								$productGrid.attr('data-desktop-grid', 'false');
								$productGrid.attr('data-desktop-columns', desktopProductQuantity);
								updateProductsDesktopQuantity(desktopProductQuantity, productFormat, $productItem, setting, productHomeFeaturedImage, productSwiper);
							}
						}
					})

					// Updates quantity products mobile
					handlers[`${setting}_products_mobile`] = new instaElements.Lambda(function(mobileProductQuantity){
						if (window.innerWidth < 768) {
							const productFormat = $productGrid.attr('data-format');
							const mobileListSliderQuantity = $productGrid.attr('data-mobile-grid-slider-columns');
							const mobileProductSliderQuantity = mobileProductQuantity == '2' ? '2.25' : '1.15';

							$productItem.removeClass('col-6 col-12');

							if (mobileProductQuantity == 'default') {
								$productGrid.attr('data-mobile-grid', 'true');
								const mobileListQuantity = $productGrid.attr('data-mobile-grid-columns');
								$productGrid.attr('data-mobile-columns', mobileListQuantity);
								updateProductsMobileQuantity(mobileListQuantity, mobileListSliderQuantity, productFormat, $productItem, productSwiper);
							}else{
								$productGrid.attr({
									'data-mobile-grid': 'false',
									'data-mobile-columns': mobileProductQuantity,
									'data-mobile-slider-columns': mobileProductSliderQuantity
								});
								updateProductsMobileQuantity(mobileProductQuantity, mobileProductSliderQuantity, productFormat, $productItem, productSwiper);
							}
						}
					})
				}

				// Initialize swiper function
				function initSwiperElements() {
					const desktopProductQuantity = $productGrid.attr('data-desktop-columns');
					const mobileProductQuantity = $productGrid.attr('data-mobile-columns');

					let desktopQuantity = $productGrid.attr('data-desktop-grid-columns');
					if (desktopProductQuantity != 'default') {
						desktopQuantity = $productGrid.attr('data-desktop-columns');
					}

					let mobileQuantity = $productGrid.attr('data-mobile-slider-columns');
					if (mobileProductQuantity != 'default') {
						mobileQuantity = $productGrid.attr('data-mobile-grid-slider-columns');
					}

					const sectionTitle = $productGrid.attr("data-title");
					const sectionLink = $productGrid.attr("data-link");

					$productGridContainer.addClass("pr-0 pr-md-3");
					$productGrid.addClass('swiper-wrapper').removeClass("row row-grid");

					// Wrap everything inside a swiper container
					$productGrid.wrapAll(`<div class="js-swiper-${setting} swiper-container"></div>`)

					// Wrap each product into a slide
					$productItem.removeClass("col-6 col-12 col-md-2 col-md-2-4 col-md-3 col-md-4").addClass("p-0").wrap(`<div class="swiper-slide"></div>`);
					$productItemInfoContainer.addClass("m-0");

					// Add previous and next controls

					var sliderControlsHtml = `
						<div class="js-products-${setting}-controls text-right d-none d-md-block">
							<div class="js-swiper-${setting}-prev swiper-button-prev d-inline-block svg-circle svg-icon-text">
								<svg class="icon-inline icon-lg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512">
								<path d="M241,451.75l-18.11,18.1L9.07,256,222.92,42.15,241,60.25,45.28,256Z"></path>
								</svg>
							</div>
							<div class="js-swiper-${setting}-next swiper-button-next d-inline-block svg-circle svg-icon-text ml-2">
								<svg class="icon-inline icon-lg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512">
								<path d="M210.72,256,15,60.25l18.11-18.1L246.93,256,33.08,469.85,15,451.75Z"></path>
								</svg>
							</div>
						</div>
					`;

					if(setting == 'new'){
						$(".js-products-new-title-and-controls").append(sliderControlsHtml);
						$(`.js-products-${setting}-controls`).removeClass("col text-right");

					}else{
						$(`.js-products-${setting}-controls-container`).append(sliderControlsHtml);
					}
					
					if((setting != 'new') && (sectionTitle == 'true')){
						$(`.js-products-${setting}-controls`).removeClass("col").addClass("col-auto");
					}

					// Define new desktop columns for featued products with image scenario
					const productHomeFeaturedImage = $productGrid.attr('data-featured-image');
					if((setting == 'featured') && (productHomeFeaturedImage == 'true')){
						desktopQuantity = '2';
						$productGridContainer.removeClass("pr-0 pr-md-3");
					}

					// Define mobile columns for new products different layout
					if(setting == 'new'){
						desktopQuantity = '3'
						mobileQuantity = '1.15';
						if(($productItem.length < 3) && (sectionTitle == 'false') && (sectionLink == 'false')){
							$(".js-products-new-title-and-controls").hide();
						}else{
							$(".js-products-new-title-and-controls").show();
						}
					}

					// Initialize swiper
					createSwiper(`.js-swiper-${setting}`, {
						lazy: true,
						watchOverflow: true,
						centerInsufficientSlides: true,
						threshold: 5,
						watchSlideProgress: true,
						watchSlidesVisibility: true,
						slideVisibleClass: 'js-swiper-slide-visible',
						spaceBetween: 20,
						loop: $productItem.length > 3,
						navigation: {
							nextEl: `.js-swiper-${setting}-next`,
							prevEl: `.js-swiper-${setting}-prev`
						},
						slidesPerView: mobileQuantity,
						breakpoints: {
							768: {
								slidesPerView: desktopQuantity,
							}
						},
					},
					function(swiperInstance) {
						window[productSwiper] = swiperInstance;
					});
				}

				// Reset swiper function
				function resetSwiperElements() {
					const desktopProductQuantity = $productGrid.attr('data-desktop-columns');
					const mobileProductQuantity = $productGrid.attr('data-mobile-columns');
					const sectionTitle = $productGrid.attr("data-title");

					// Remove duplicate slides and slider controls
					$productGridContainer.removeClass("pr-0 pr-md-3");
					$productContainer.find(`.js-products-${setting}-controls`).remove();
					$productGrid.find('.swiper-slide-duplicate').remove();
					$productGrid.addClass('row row-grid');

					// Undo all slider wrappers and restore original classes
					
					$productGrid.unwrap();
					$productItem.unwrap();
					$productItem.removeClass('js-item-slide js-swiper-slide-visible swiper-slide-active swiper-slide p-0').removeAttr('style');
					$productItemInfoContainer.removeClass("m-0");

					if(setting == 'new'){
						$productItem.addClass('col-12 col-md-4');
					}else{

						let desktopQuantity = $productGrid.attr('data-desktop-grid-columns');
						if (desktopProductQuantity != 'default') {
							desktopQuantity = $productGrid.attr('data-desktop-columns');
						}

						if (desktopQuantity == 6) {
							$productItem.addClass('col-md-2');
						} else if (desktopQuantity == 5) {
							$productItem.addClass('col-md-2-4');
						} else if (desktopQuantity == 4) {
							$productItem.addClass('col-md-3');
						}

						let mobileQuantity = $productGrid.attr('data-mobile-grid-columns');
						if (mobileProductQuantity != 'default') {
							mobileQuantity = $productGrid.attr('data-mobile-columns');
						}

						if (mobileQuantity == 2) {
							$productItem.addClass('col-6');
						} else if (mobileQuantity == 1) {
							$productItem.addClass('col-12');
						}
					}

					const sectionLink = $productGrid.attr("data-link");

					if((setting == 'new') && (sectionTitle == 'false') && (sectionLink == 'false')){
						$(".js-products-new-title-and-controls").hide();
					}
					
				}

				// Toggle grid and slider view
				handlers[`${setting}_products_format`] = new instaElements.Lambda(function(format){
					const toSlider = format == "slider";

					if ($productGrid.attr('data-format') == format) {
						// Nothing to do
						return;
					}

					let productHomeFeaturedImage;
					// From grid to slider
					if (toSlider) {
						$productGrid.attr('data-format', 'slider');

						//Set layout based for featured section case
						productHomeFeaturedImage = $productGrid.attr('data-featured-image');
						if(setting == 'featured'){
							$productGridContainer.removeClass("p-3");
							if(productHomeFeaturedImage == 'true'){
								$productFeaturedImageContainer.addClass("col-md-8");
								$productFeaturedImage.addClass("featured-product-image-with-slider");
								$productGridContainer.addClass("col-md-4 featured-product-container featured-product-image-with-slider");
							}
						}

						// Convert grid to slider if it's not yet
						if ($productContainer.find('.swiper-slide').length < 1) {
							initSwiperElements();
						}

					// From slider to grid
					} else {
						$productGrid.attr('data-format', 'grid');
						
						// Reset swiper settings
						resetSwiperElements();

						// Restore grid settings
						$productGrid.removeClass('swiper-wrapper').removeAttr('style');

						//Set layout based for featured section case
						productHomeFeaturedImage = $productGrid.attr('data-featured-image');
						if(setting == 'featured'){
							$productFeaturedImageContainer.removeClass("col-md-8");
							$productFeaturedImage.removeClass("featured-product-image-with-slider");
							$productGridContainer.removeClass("col-md-4 featured-product-image-with-slider");
							if(productHomeFeaturedImage == 'true'){
								$productGridContainer.addClass("p-3");
							}
						}
					}

					// Persist new format in data attribute
					$productGrid.attr('data-format', format);
				});

				if(setting == 'featured'){

					//Featured section color
					handlers[`${setting}_product_colors`] = new instaElements.Lambda(function(sectionColor){
						if (sectionColor) {
							$section.addClass("section-featured-home-colors");
						} else {
							$section.removeClass("section-featured-home-colors");
						}
					});

					//Featured section image
					handlers[`${setting}_products_image.jpg`] = new instaElements.Image({
						element: `.js-products-featured-image img`,
						show: function() {
							const productFormat = $productGrid.attr('data-format');
							$productGrid.attr("data-featured-image" , "true");
							$(this).show();
							$productFeaturedImageContainer.show();
							$(".js-featured-products-row").addClass("no-gutters");
							if(productFormat == 'slider'){
								$productFeaturedImageContainer.addClass("col-md-8");
								$productFeaturedImage.addClass("featured-product-image-with-slider");
								$productGridContainer.addClass("col-md-4 featured-product-container featured-product-image-with-slider").removeClass("pr-0 pr-md-3");
								//Update swiper when layout changes
								if (window.innerWidth > 768) {
									window[productSwiper].params.slidesPerView = '2';
								}
								window[productSwiper].update();
							}else{
								$productGridContainer.addClass("featured-product-container p-3");
							}
							
						},
						hide: function() {
							const productFormat = $productGrid.attr('data-format');
							$(this).hide();
							$productGrid.attr("data-featured-image" , "false");
							$productFeaturedImageContainer.hide().removeClass("col-md-8");
							$productFeaturedImage.removeClass("featured-product-image-with-slider");
							$productGridContainer.removeClass("featured-product-container featured-product-image-with-slider col-md-4 p-3");
							$(".js-featured-products-row").removeClass("no-gutters");
							if(productFormat == 'slider'){
								$productGridContainer.addClass("pr-0 pr-md-3");
								//Update swiper when layout changes
								if (window.innerWidth > 768) {
									const desktopProductQuantity = $productGrid.attr('data-desktop-columns');
									let desktopQuantity = $productGrid.attr('data-desktop-grid-columns');
									if (desktopProductQuantity != 'default') {
										desktopQuantity = $productGrid.attr('data-desktop-columns');
									}
									window[productSwiper].params.slidesPerView = desktopQuantity;
								}
								window[productSwiper].update();
							}
						},
					});
				}
			});

			// Update home quantities based on general list and each home produts format settings
			
			// Define home product grid
			const $productHomeGrid = $('.js-products-home-grid');

			// Updates quantity home products desktop
			handlers.grid_columns_desktop = new instaElements.Lambda(function(desktopProductQuantity){
				if (window.innerWidth > 768) {
					$productHomeGrid.attr('data-desktop-grid-columns', desktopProductQuantity);
					$productHomeGrid.each(function() {
						const productHomeFeaturedImage = $(this).attr('data-featured-image');
						const thisProductFormat = $(this).attr('data-format');
						const thisSectionId = $(this).attr('data-section-id');
						const thisListGrid = $(this).attr('data-desktop-grid');

						// Update all sections except "new products" due to horizontal item
						if (thisSectionId != 'new'){
							const productSwiper = 
								thisSectionId == 'featured' ? 'productsFeaturedSwiper' : 
								thisSectionId == 'sale' ? 'productsSaleSwiper' :
								null;

							const $thisProductHomeItem = $(this).find('.js-item-product');

							if (thisListGrid == 'true') {
								$thisProductHomeItem.removeClass('col-md-2 col-md-2-4 col-md-3 col-md-4');
								$productHomeGrid.attr('data-desktop-columns', desktopProductQuantity);
								updateProductsDesktopQuantity(desktopProductQuantity, thisProductFormat, $thisProductHomeItem, thisSectionId, productHomeFeaturedImage, productSwiper);
							}
						}
					});
				}
			});

			// Updates quantity home products mobile
			handlers.grid_columns_mobile = new instaElements.Lambda(function(mobileProductQuantity){
				if (window.innerWidth < 768) {
					const mobileProductSliderQuantity = mobileProductQuantity == '2' ? '2.25' : '1.15';
					$productHomeGrid.attr({
						'data-mobile-grid-slider-columns': mobileProductSliderQuantity,
						'data-mobile-grid-columns': mobileProductQuantity
					});
					$productHomeGrid.each(function() {
						const thisProductFormat = $(this).attr('data-format');
						const thisSectionId = $(this).attr('data-section-id');
						const thisListGrid = $(this).attr('data-mobile-grid');

						// Update all sections except "new products" due to horizontal item
						if (thisSectionId != 'new'){
							const productSwiper = 
							thisSectionId == 'featured' ? 'productsFeaturedSwiper' : 
							thisSectionId == 'sale' ? 'productsSaleSwiper' :
							null;

							const $thisProductHomeItem = $(this).find('.js-item-product');
							
							if (thisListGrid == 'true') {
								$thisProductHomeItem.removeClass('col-6 col-12');
								$productHomeGrid.attr('data-mobile-slider-columns', mobileProductSliderQuantity).attr('data-mobile-columns', mobileProductQuantity);
								updateProductsMobileQuantity(mobileProductQuantity, mobileProductSliderQuantity, thisProductFormat, $thisProductHomeItem, productSwiper);
							}
						}
					});
				}
			});

			return handlers;
		}
	};
})(jQueryNuvem);