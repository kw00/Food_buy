var isCheck=false;
var use; 
var isChange = false;

$(function(){
	alert("시작");
	$("input[name=id]").keydown(function() {
    	isChange = true;
    	use="";
    	$('#idmessage').css("display","none");
    	var isCheck=false;
	});
});


	
/*function writeSave(){ 
	
	if($('input[name="id"]').val()==""){
		alert("id를 입력하세요.");
		$('input[name="id"]').focus();
		isChange = false;
		return false;
	}
	if(use=="impossible"){
		alert("이미 사용중인 아이디입니다.");
		return false;
	}
	if(isCheck==false || isChange == true){
		alert("중복체크 하세요.");
		return false;
	}
	if($('input[name="password"]').val()==""){
		alert("비번을 입력하세요.");
		$('input[name="password"]').focus();
		return false;
	}
	
	if($('input[name="repassword"]').val()==""){
		alert("비번확인을 입력하세요.");
		$('input[name="repassword"]').focus();
		return false;
	}
	
	if($('input[name="xxx"]').val()=="YES"){
		alert("YES");
		return true;
	}
	else{
		alert("NO"+"비번 불일치입니다.");
		$('input[name="repassword"]').focus();
		return false;
	}
}*/


function duplicate(){
	
    	alert("id_check");
    	isCheck=true;
        $.ajax({
         url: "id_check_proc.jsp", //아이디 중복체크할 페이지 지정
         data : ({
        	 userid: $("input[name=id]").val() // userid=hong
         }),
         success: function (data){ //data=NO YES
           
           if ($('input[name="id"]').val()==""){
        	   $('#idmessage').html("<font color=red>id 입력 누락</font>");
               $('#idmessage').show();
           }
           else if (jQuery.trim(data)=='YES'){ 
              $('#idmessage').html("<font color=red>사용 가능합니다.</font>");
              $('#idmessage').show(); 
              use = "possible";
              isChange = false;
              
            }else{
            	$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
            	$('#idmessage').show();                
            	use = "impossible";
            }
           } // success의 끝
        });//ajax()의 끝
    
    
} // duplicate의 끝



function passwd_keyup(){

	if($("input[name=password]").val() == $("input[name=repassword]").val()){
		$('#pwmessage').html("<font color=red>비번 일치</font>");
		$('#pwmessage').show();
		$('input[name=xxx]').val("YES");
	}
	else{
		$('#pwmessage').html("<font color=red>비번 불일치</font>");
		$('#pwmessage').show();
		$('input[name=xxx]').val("NO");
	
	}
} // passwd_keyup의 끝

function goBack() {
    window.history.back();
 }




