import consumer from "./consumer"


const initChatRoom  = () =>{
    const messagesContainer = document.getElementById("messages")
    if (messagesContainer) {
        messagesContainer.scrollIntoView(false)
        const id = messagesContainer.dataset.chatroomId
        const currentUserId = Number(messagesContainer.dataset.currentUser)
        consumer.subscriptions.create({ channel: "ChatroomChannel"}, {
            received(data) { 
               const container = messagesContainer.querySelector(".main-container");
                if (currentUserId == data.message_author) {
                    container.insertAdjacentHTML("beforeend", data.user_is_author_partial)
                    const messageInput = document.getElementById("message_content")
                    messageInput.value = ""
                } else {
                    container.insertAdjacentHTML("beforeend", data.user_is_not_author)
                }
                messagesContainer.scrollIntoView(false)
            }
        });
    };
};


export { initChatRoom }