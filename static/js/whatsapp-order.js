document.addEventListener("DOMContentLoaded", function() {
    // Função simplificada para abrir WhatsApp
    window.openWhatsApp = function(element) {
        try {
            var phone = element.getAttribute('data-phone') || "5519992455113";
            
            // Obter o nome do produto atual
            var productName = "";
            var productNameElement = document.querySelector('.js-product-name, h1.product-title');
            if (productNameElement) {
                productName = productNameElement.textContent.trim();
            }
            
            // Obter apenas as variações selecionadas do formulário atual
            var currentForm = document.querySelector('.js-product-form');
            var currentVariations = "";
            
            if (currentForm) {
                // Limitar a busca apenas às select boxes dentro do formulário atual
                var variationSelects = currentForm.querySelectorAll('select.js-variation-option');
                var variations = [];
                
                variationSelects.forEach(function(select) {
                    if (select && select.options && select.selectedIndex >= 0) {
                        var label = select.parentNode.querySelector('.form-label');
                        var labelText = label ? label.textContent.trim() : '';
                        var selectedValue = select.options[select.selectedIndex].text.trim();
                        
                        if (labelText && selectedValue) {
                            variations.push(labelText + ": " + selectedValue);
                        }
                    }
                });
                
                if (variations.length > 0) {
                    currentVariations = variations.join(", ");
                }
            }
            
            // Criar a mensagem sem usar nenhuma variável do site
            var message = "Olá! Gostaria de fazer uma encomenda do produto " + productName;
            
            if (currentVariations) {
                message += " na variação " + currentVariations;
            }
            
            message += ".";
            
            // Codificar a mensagem para URL
            var encodedMessage = encodeURIComponent(message);
            
            // Criar URL do WhatsApp
            var whatsappUrl = "https://api.whatsapp.com/send?phone=" + phone + "&text=" + encodedMessage;
            
            // Detectar dispositivo
            var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
            
            if (isMobile) {
                window.location.href = whatsappUrl;
            } else {
                window.open(whatsappUrl, '_blank');
            }
        } catch (error) {
            console.error("Erro ao processar WhatsApp:", error);
            // Mensagem de fallback em caso de erro
            var fallbackUrl = "https://api.whatsapp.com/send?phone=5519992455113&text=" + encodeURIComponent("Oii, gostaria de fazer uma encomenda de um produto.");
            
            if (/Android|iPhone|iPad/i.test(navigator.userAgent)) {
                window.location.href = fallbackUrl;
            } else {
                window.open(fallbackUrl, '_blank');
            }
        }
    };
    
    // Cria o contêiner dinâmico para variações que ficam sem estoque após a seleção
    var whatsappDynamicContainer = document.createElement('div');
    whatsappDynamicContainer.className = "col-12";
    whatsappDynamicContainer.id = "whatsapp-dynamic-container";
    whatsappDynamicContainer.innerHTML = '<p class="mb-2">Esta variação está esgotada, faça uma encomenda clicando no botão abaixo</p>' +
                                        '<a class="btn-encomendar" onclick="openWhatsApp(this); return false;" href="javascript:void(0)" ' +
                                        'data-phone="5519992455113">Encomendar</a>';
    whatsappDynamicContainer.style.display = "none";
    
    // Adiciona ao DOM
    var formRow = document.querySelector('.form-row.mb-4');
    if (formRow) {
        formRow.appendChild(whatsappDynamicContainer);
    }
    
    // Função para verificar status de estoque
    function checkStockStatus() {
        var addToCartBtn = document.querySelector('.js-addtocart');
        if (addToCartBtn && addToCartBtn.classList.contains('nostock')) {
            // Esconde o botão original
            var originalContainer = document.getElementById('whatsapp-order-container');
            if (originalContainer) originalContainer.style.display = "none";
            
            // Mostra o botão dinâmico
            whatsappDynamicContainer.style.display = "block";
        } else {
            whatsappDynamicContainer.style.display = "none";
        }
    }
    
    // Verifica o estado inicial
    checkStockStatus();
    
    // Monitora mudanças nas variações
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('js-insta-variant') || 
            e.target.classList.contains('js-variation-option')) {
            setTimeout(checkStockStatus, 100);
        }
    });
    
    document.querySelectorAll('.js-variation-option').forEach(function(select) {
        select.addEventListener('change', function() {
            setTimeout(checkStockStatus, 100);
        });
    });
});