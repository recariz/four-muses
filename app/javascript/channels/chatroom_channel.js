import consumer from "./consumer"

const messagesContainer = document.getElementById("messages")
if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId
    const currentUserId = Number(messagesContainer.dataset.currentUser)
    consumer.subscriptions.create({ channel: "ChatroomChannel"}, {
        received(data) { 
            console.log(data)
           const container = messagesContainer.querySelector(".main-container");
            if (currentUserId == data.message_author) {
                console.log("yo soy el autor")
                container.insertAdjacentHTML("beforeend", data.user_is_author_partial)
            } else {
                console.log("yo no soy el autor")
                container.insertAdjacentHTML("beforeend", data.user_is_not_author)
            } 
            container.scrollTop = container.scrollHeight;
             
            
            console.log(currentUserId)
        }
    });
}