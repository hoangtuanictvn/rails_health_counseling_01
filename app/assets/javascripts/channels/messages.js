App.messages = App.cable.subscriptions.create("MessagesChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log('data', data);
    $('.chat_content-' + data.conversation_id + ' .chat_timeline--view').append(data.html)
  }
});
