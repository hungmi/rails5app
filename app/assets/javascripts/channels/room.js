var scroll_bottom, submit_message;

App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
  	alert("connected!")
  },
  disconnected: function() {},
  received: function(data) {
  	data.mention ? alert("You have a new mention") : void 0
  	data.message && (data.message.blank == null) ? ($('#messages-table').append(data.message), scroll_bottom()) : void 0
  }
})

$(document).on('turbolinks:load', function() {
  submit_message();
  scroll_bottom();
  return console.log("load room.coffee");
});

submit_message = function() {
  return $('#message_content').on('keydown', function(event) {
    if (event.keyCode === 13) {
      $('input').click();
      event.target.value = "";
      return event.preventDefault();
    }
  });
};

scroll_bottom = function() {
  return $('#messages').scrollTop($('#messages')[0].scrollHeight);
};