/**
 * 
 */

function idCheck(id) {
	frm = document.regFrm;
	if (id == "") {
		alert("아이디를 입력해 주세요.");
		frm.id.focus();
		return;
	}
	url = "idCheck.jsp?id=" + id;
	window.open(url, "IDCheck", "width=300,height=150");
}

function zipSearch() {
	url = "zipSearch.jsp?search=n";
	window
		.open(url, "ZipCodeSearch",
			"width=500,height=300,scrollbars=yes");
}