<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>살까말까</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/cscenter/csmain.css">
<link rel="stylesheet" href="/css/common.css">

<script language="JavaScript">

	function setCookie( name, value, expiredays ) {
		var date = new Date();
		date.setDate(date.getDate() + expiredays);
		window.opener.document.cookie = escape(name) + "=" + escape(value) + "; expires=" + date.toUTCString();
	}
	
    function closePopup() {
        if (document.getElementById("check").value) {
            setCookie("popupYN1", "N", 1);
            self.close();
        }
    }

</script>


</head>
<body>

<aside class="popup" id="popupWrap">
  <div class="inner" id="popup_1">
    <div class="area">
      <img src="/img/popup011.png" alt="배너이미지1">
    </div>
    <input type="checkbox" id="check" onclick="closePopup();"><span>하루동안 보지않기</span>
    <button type="button" onclick="window.close();">[닫기]</button>
  </div>

  <div class="popupbg" style="background:gray;"></div>
</aside>





</body>
</html>