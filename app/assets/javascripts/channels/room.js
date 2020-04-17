App.room = App.cable.subscriptions.create("RoomChannel", {
  room: $('#room').data('room_id'),
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received() {
    // 新しいP要素を用意します．
    var node = document.createElement("P"); 
    // 受信したメッセージを変数に入れます．
    var textnode = document.createTextNode(data.content.message); 
    // テキストノードを新規作成したP要素に追加します．
    node.appendChild(textnode); 
  
    // DOM に新しく作られた要素とその内容を追加します 
    document.getElementById("new_message").appendChild(node);
    // フォームの中身を空にします
    document.getElementById('chat_message').value= ''
  }
  // received: function(data) {
  //   // Called when there's incoming data on the websocket for this channel
  // }
});

$(document).on('keypress', '#message-form', function(e) {
  if (e.keyCode === 13 && e.target.value !== "") {
    App.room.create(e.target.value);
    e.target.value = '';
  }
});
