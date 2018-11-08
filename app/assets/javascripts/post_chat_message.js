function postChatMessage() {
  event.preventDefault();
  // var element = document.querySelector('input[type="text"]');
  var element = document.querySelector('textarea[id="message_area"]');
  App.room.speak(element.value);
  element.value = '';
}