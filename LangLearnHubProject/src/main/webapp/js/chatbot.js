var Message;
var message_side = 'right';
var $message_input = $('.message_input');
var $message_output = $('.message_output');
var jsChatList = '<%= s %>';
function Message(arg){
  this.text = arg.text // 텍스트
  this.message_side = arg.message_side; //왼쪽, 오른쪽
  this.before = arg.before; //이전 텍스트
  this.draw = function (_this) {
    return function () {
      var $message;
      $message = $($('.message_template').clone().html());
      //북마크 
      
      $message.find('.bookmark').click(function(){
        console.log("bookmark");  
        var swal_textQ,swal_textA;
        if(arg.idx%2==0){
			console.log(arg.idx);
			swal_textQ=arg.text;		
			swal_textA=arg.after;
		}else{
			console.log(arg.idx);
			swal_textQ=arg.before;
			swal_textA=arg.text;
		}
    Swal.fire({
      title: "해당 내용을 저장 할까요?",
      html:
      '<form action="SignUpFail.jsp">' +
      '  <label>Q: '+swal_textQ+'</label><br>' +
      '  <label>A: '+swal_textA+'</label><br>' +
      '  <label>북마크 이름을 입력하세요.<br><br>'+
      '  <input type="text" class="form-control form-control-lg" placeholder="Untitled"><br>'+
      '  <button class="btn btn-outline-success">save</button>'+
      '</form>'+
      '  <input type="button" class="btn btn-outline-danger" value="cancel" onClick="window.location.reload()"></input>',
      showConfirmButton: false
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire("Saved!", "입력된 값: " + inputValue, "success");
      }
    });
      });
      $message.addClass(_this.message_side).find('.text').html(_this.text);
      $('.messages').append($message);
      return setTimeout(function () {
          return $message.addClass('appeared');
      }, 100);
      };
    }(this);
  return this;
};
function getMessageText(input=true){
  if(input){
    console.log("input: "+$message_input.val());
    return $message_input.val();
  }else{//chatList값이 입력돼있으면
      var outputMessage = $message_output.val();
      $message_output.val('');
      console.log("output: "+outputMessage);
      return outputMessage;
  }
}
function sendMessage(text,road=false){ //road = 로딩,새로고침
  // 'text' to String
  var text_toString=text;
  if(typeof(text)!="string")text_toString = text.join(",");
  //'text' to array
  var array = [];
  var inQuotes = false;
  var currentElement = '';
  for (var i = 0; i < text_toString.length; i++) {
    var char = text_toString[i];
    if (char === '"')inQuotes = !inQuotes;
    else if (char === ',' && !inQuotes) {
      array.push(currentElement);
      currentElement = '';
    } else currentElement += char;
  }
  if (currentElement !== '') array.push(currentElement);

  if (array[0].trim() === '') {return;} //input이 비어있으면
  $('.message_input').val('');

  var $messages, message, len;
  len = array.length;
  // console.log("len: "+len);
  $messages = $('.messages');
  if(road){
    // console.log(road);
    for(var i=0;i<len;i++){
      message = new Message({
        text: array[i],
        message_side: message_side,
        before: array[i-1],
        after: array[i+1],
        idx: i
      });
      message_side = (message_side === 'left') ? 'right' : 'left';
      message.draw();
    }
  }else{
    message = new Message({
      text: array[len-1],
      message_side: message_side,
      before: array[len-2], //이전 텍스트
      after: array[len],
      idx: len-1
    })  
    message_side = (message_side === 'left') ? 'right' : 'left';
    message.draw();
  }
    return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
}

window.onload = function(){
  console.log("onload");
  console.log(sessionStorage.getItem("question"));
  if(sessionStorage.getItem("question")!=null){//저장 돼 있을 때만
    var array_tem;
    var send_message;
    const entries = performance.getEntriesByType("navigation")[0];
    if (entries.type==="reload"){ //새로고침 눌렀을 때
      console.log("새로고침 클릭");
      array_tem=sessionStorage.getItem("question");
      
    }else{ //재로딩 
      console.log("re_onload");
      array_tem=sessionStorage.getItem("question")+',"'+getMessageText(false)+'"';
      sessionStorage.setItem("question",array_tem);
    }
    array_tem = array_tem.split(",");
    send_message = array_tem;
    return sendMessage(send_message,true);
  }
}


$message_input.keyup(function (e) {
  if (e.which === 13) {
    if($message_input.val()!='') { //입력 돼 있으면
      var send_message,array_tem;
      if(sessionStorage.getItem("question")!=null){//
        array_tem=sessionStorage.getItem("question")+',"'+getMessageText()+'"';
        array_tem = array_tem.split(",");
      }else{array_tem = '"'+getMessageText()+'"';} //처음저장
      sessionStorage.setItem("question",array_tem);
      send_message = array_tem;
      return sendMessage(send_message);
    }

  }
});
// $('.send_message').click(function (){
//   var send_message;
//       if(sessionStorage.getItem("question")!=null){
//         var array_tem=sessionStorage.getItem("question")+","+getMessageText();
//         array_tem = array_tem.split(",");
//         console.log(array_tem);
//         sessionStorage.setItem("question",array_tem);
//         send_message = array_tem;
//       }else{
//         var array_tem = [getMessageText()];
//         sessionStorage.setItem("question",array_tem);
//         console.log(array_tem);
//         send_message = array_tem;
//       }
//       ;
//       return sendMessage(send_message);
// });

// $(document).read(function(){
//   console.log("onload");
//   // var $message_output = $('.message_output');
//   console.log($message_output.val()); //답 입력 잘됨.
  
//   var send_message;
//   if(sessionStorage.getItem("question")!=null){
//     const entries = performance.getEntriesByType("navigation")[0];
//     if (entries.type==="reload"){ //새로고침 눌렀을 때
//       console.log("새로고침 클릭");
//       var array_tem=sessionStorage.getItem("question");
//     }else{
//       tem= getMessageText();
//       var array_tem=sessionStorage.getItem("question")+","+tem;
//     }
//     array_tem = array_tem.split(",");
//     console.log("array_tem: "+array_tem);
//     sessionStorage.setItem("question",array_tem);
//     send_message = array_tem;
//     $message_output.val(''); //hidden 답변 비우고 sen
//     console.log("send_message: "+send_message+"send_message+length: "+send_message.length);
//     return sendMessageLoad(send_message,send_message.length);
//   }
// });