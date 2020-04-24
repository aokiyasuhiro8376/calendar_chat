// App.room = App.cable.subscriptions.create("RoomChannel", {
//   connected: function() {
//     // Called when the subscription is ready for use on the server
//   },

//   disconnected: function() {
//     // Called when the subscription has been terminated by the server
//   },

//   received: function(data) {
//     // Called when there's incoming data on the websocket for this channel
//   },

//   speak: function() {
//     return this.perform('speak');
//   }
// });



document.addEventListener('turbolinks:load', function() {
  App.room = App.cable.subscriptions.create({
    channel: "RoomChannel",
    room: $('#chats').data('room_id')
  }, {
    connected: function() {

    },
    disconnected: function() {

    },
    received: function(data) {
      return $('#chats').append(data['chat']);
    },
    speak: function(chat) {
      return this.perform('speak', {
        chat: chat
      });
    }
  });
  // $(document)
  // return $('#chat-input')
  return $('#chat-input').on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      App.room.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});