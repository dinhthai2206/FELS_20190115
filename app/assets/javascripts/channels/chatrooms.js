(function() {
  App.chatrooms = App.cable.subscriptions.create("ChatroomsChannel",{
    connected: function() {},

    disconnected: function() {},

    received: function(data) {
      active_chatroom = $("[data-behavior='messages'][data-chatroom-id='" + data.chatroom_id + "']")
      if (active_chatroom.length > 0) {
        active_chatroom.append(data.message)
      }
    },

    send_message: function(chatroom_id, message) {
      this.perform("send_message", {
        chatroom_id: chatroom_id, content: message
      });
    }
  });
}).call(this);
