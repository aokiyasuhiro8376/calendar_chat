// document.addEventListener('turbolinks:load', function() {
//   App.room = App.cable.subscriptions.create({
//     channel: "RoomChannel",
//     room: $('#chats').data('room_id')
//   }, {
//     connected: function() {

//     },
//     disconnected: function() {

//     },
//     received: function(data) {
//       $('#chats').append(data['chat']);
//     },
//     speak: function(chat) {
//       this.perform('speak', {
//         chat: chat
//       });
//     }
//   });
//   $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
//     if (event.keyCode === 13) {
//       App.room.speak(event.target.value);
//       event.target.value = '';
//       event.preventDefault();
//     }
//   });
// });