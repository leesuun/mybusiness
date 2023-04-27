/**
 * 
 */

function loadSearch() {
	frm = document.zipFrm;
	if (frm.area3.value == "") {
		alert("도로명을 입력하세요.");
		frm.area3.focus();
		return;
	}
	frm.action = "zipSearch.jsp"
	frm.submit();
}

function sendAdd(zipcode, adds) {
	opener.document.regFrm.zipcode.value = zipcode;
	opener.document.regFrm.address.value = adds;
	self.close();
}