/**
 * 
 */
function loginCheck() {
	if (document.loginFrm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.loginFrm.id.focus();
		return;
	}
	if (document.loginFrm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.loginFrm.pwd.focus();
		return;
	}
	document.loginFrm.submit();
}

function passCheck(){
	
}
