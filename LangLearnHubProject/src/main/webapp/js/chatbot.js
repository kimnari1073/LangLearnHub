var Message;
var message_side = 'right';
var $message_input = $('.message_input');
var $message_output = $('.message_output');

function Message(arg){
  this.text = arg.text, this.message_side = arg.message_side;
  this.draw = function (_this) {
    return function () {
      var $message;
      $message = $($('.message_template').clone().html());
      $message.addClass(_this.message_side).find('.text').html(_this.text);
      $('.messages').append($message);
      return setTimeout(function () {
          return $message.addClass('appeared');
      }, 100);
      };
    }(this);
  return this;
};
function getMessageText(){
  if ($message_output.val() !=""){ //chatList값이 입력돼있으면
    var outputMessage = $message_output.val();
    $message_output.val('')
    console.log("output: "+outputMessage);
    return outputMessage;
  }else{
    console.log("input: "+$message_input.val());
    return $message_input.val();
  }
}
function sendMessage(text,len){
  var $messages, message;
    if (text[0].trim() === '') {return;} //input이 비어있으면
    $('.message_input').val('');
    console.log("sendMessage: "+$('.message_input').val(''));
    $messages = $('.messages');
        message = new Message({
        text: text[len-1],
        message_side: message_side
    })
    message_side = (message_side === 'left') ? 'right' : 'left';
    message.draw();
    return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
}
function sendMessageLoad(text,len){
  var $messages, message;
  if (text[0].trim() === '') {return;}
  $('.message_input').val('');
  $messages = $('.messages');
  for(var i=0;i<len;i++){
      message = new Message({
      text: text[i],
      message_side: message_side
    });
  message_side = (message_side === 'left') ? 'right' : 'left';
  message.draw();
  }
  return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
};

window.onload = function(){
  console.log("onload");
  // var $message_output = $('.message_output');
  console.log($message_output.val()); //답 입력 잘됨.
  var send_message;
  if(sessionStorage.getItem("question")!=null){
    const entries = performance.getEntriesByType("navigation")[0];
    if (entries.type==="reload"){ //새로고침 눌렀을 때
      console.log("새로고침 클릭");
      var array_tem=sessionStorage.getItem("question");
    }else{
      tem= getMessageText();
      var array_tem=sessionStorage.getItem("question")+","+tem;
    }
    array_tem = array_tem.split(",");
    console.log("array_tem: "+array_tem);
    sessionStorage.setItem("question",array_tem);
    send_message = array_tem;
    $message_output.val(''); //hidden 답변 비우고 sen
    console.log("send_message: "+send_message+"send_message+length: "+send_message.length);
    return sendMessageLoad(send_message,send_message.length);
  }
}
$('.message_input').keyup(function (e) {
  if (e.which === 13) {
      // return sendMessage(getMessageText());
      var send_message;
      if(sessionStorage.getItem("question")!=null){
        var array_tem=sessionStorage.getItem("question")+","+getMessageText();
        array_tem = array_tem.split(",");
        console.log(array_tem);
        sessionStorage.setItem("question",array_tem);
        send_message = array_tem;
      }else{
        var array_tem = [getMessageText()];
        sessionStorage.setItem("question",array_tem);
        console.log(array_tem);
        send_message = array_tem;
      }
      return sendMessage(send_message,send_message.length);
  }
});