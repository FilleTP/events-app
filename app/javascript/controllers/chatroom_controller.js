import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom"
export default class extends Controller {
  static targets = ["messages"]

  connect() {
    const chatroomId = this.element.getAttribute('data-chatroom-id');
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: chatroomId },
      { received: data =>
        this.messagesTarget.insertAdjacentHTML("beforeend", data) }
    )
  }
}
