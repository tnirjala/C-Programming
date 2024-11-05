
            document.addEventListener('DOMContentLoaded', function () {
                const chatbotIcon = document.getElementById('chatbot-icon');
                const chatbotContainer = document.getElementById('chatbot-container');
                const chatMessage = document.getElementById('chat-message');
                const locationBtn = document.getElementById('location-btn');
                const infoBtn = document.getElementById('info-btn');
                const locationInfo = document.getElementById('location-info');
                const generalInfo = document.getElementById('general-info');
                const thankYou = document.getElementById('thank-you');
                const expandedContent = document.getElementById('expanded-content');

                chatbotIcon.addEventListener('click', () => {
                    chatbotIcon.style.display = 'none';
                    chatbotContainer.style.display = 'block';
                    chatbotContainer.style.height = '240px';
                    expandedContent.style.display = 'block';
                });

                locationBtn.addEventListener('click', () => {
                    locationInfo.style.display = 'block';
                    chatMessage.style.display = 'none';
                    hideOptions();
                    setTimeout(() => {
                        locationInfo.style.display = 'none';
                        thankYou.style.display = 'block';
                        setTimeout(() => {
                            resetChatbot();
                        }, 2000);
                    }, 3000);
                });

                infoBtn.addEventListener('click', () => {
                    generalInfo.style.display = 'block';
                    chatMessage.style.display = 'none';
                    hideOptions();
                    setTimeout(() => {
                        generalInfo.style.display = 'none';
                        thankYou.style.display = 'block';
                        setTimeout(() => {
                            resetChatbot();
                        }, 2000);
                    }, 3000);
                });

                function hideOptions() {
                    const options = document.getElementById('options');
                    options.style.display = 'none';
                }

                function resetChatbot() {
                    chatbotIcon.style.display = 'block';
                    chatbotContainer.style.display = 'none';
                    chatbotContainer.style.height = '0';
                    expandedContent.style.display = 'none';
                    locationInfo.style.display = 'none';
                    generalInfo.style.display = 'none';
                    thankYou.style.display = 'none';
                    showOptions();
                }

                function showOptions() {
                    const options = document.getElementById('options');
                    options.style.display = 'block';
                }
            });
 