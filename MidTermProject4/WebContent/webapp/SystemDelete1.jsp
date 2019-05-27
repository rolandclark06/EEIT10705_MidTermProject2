<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<style>
.p {
	padding-top: 10px;
}

* {
	margin: 0px;
	padding: 0px;
}

#title {
	width: 100%;
	font-family: 微軟正黑體;
	margin: auto;
	text-align: center;
	background-color: #80ffff;
	height: 50px;
}

.div1 {
	width: 600px;
	border: 3px black solid;
	margin: auto;
}

fieldset {
	width: 500px;
	border: 1px solid black;
	margin: 15px auto;
	border-radius: 15px;
}

.st1 {
	width: 450px;
	border-bottom: 1px solid #e0e0e0;
	margin: 10px;
	padding-bottom: 0px;
}

.st2 {
	color: gray;
	text-align: left;
	font-size: 12px;
}

.sub {
	width: 450px;
	margin: 20px;
	text-align: center;
}

.t1 {
	width: 80px;
	float: left;
	text-align: left;
	padding-right: 0px;
}

.correct {
	color: black;
}

.error {
	color: red;
}

textarea {
	resize: none;
}

.p1 {
	font-size: 100px;
	width: 300px;
	margin: auto;
}
#bottom {
	width:50%;
	margin: auto;
	text-align: center;
}
.p2 {
	text-align: center;
}
</style>
<script type="text/javascript">

function bankbranchcodeVerify() {
	let bankbranchcode1 = document.getElementById('bankbranchcode1').value;

	function isNumber(temp) {
		var re = /^[\d]+$/;
		if (temp == "")
			return 1;
		if (!re.test(temp))
			return 2;
		return 3;
	}
	let verify1 = document.getElementById('verify2');
	let verify1Pho = document.getElementById('verifypho2');
	if (isNumber(bankbranchcode1) == 3) {
		verify1.innerHTML = "格式正確";
		verify1Pho.src = "/MidTermProject4/res/images/greenHook.jpg"
		return true;
	} else if (isNumber(bankbranchcode1) == 1) {
		verify1.innerHTML = "必填";
		verify1Pho.src = "/MidTermProject4/res/images/redX.jpg"
		return false;
	} else if (isNumber(bankbranchcode1) == 2) {
		verify1.innerHTML = "請輸入數字";
		verify1Pho.src = "/MidTermProject4/res/images/redX.jpg"
		return false;
	}
}
</script>
</head>
<body>
	<div id='title'>
		<p class='p'>EEIT107_05_期中專題2_台灣金融法人登錄系統</p>
	</div>
	<fieldset>
		<legend>Form Check</legend>
		<form Action='servlet3.do' method='POST'>
			<div class="st1">
				<label class="t1" for="account1">分行代碼:</label> <input class="input"
					type="text" id="bankbranchcode1" name="bankbranchcode"
					autocomplete="off" size="20" onblur="bankbranchcodeVerify()"
					placeholder="請輸入分行代碼"> <img src="" style="width: 15px"
					id="verifypho2"> <span id="verify2" class=""></span>
					
					<p class="st2">(1.不可空白，2.必須全部為數字)</p>

			</div>
			<hr>
			<div class="sub">
				<input type="submit" value="送出"> <input type="reset"
					value="清除">
				<p>
					<a href='../index.jsp'>回首頁</a>
			</div>
		</form>
	</fieldset>
	<p class='p2'style="color: red">${ErrorMsg.bankbranchcode}</p>
	<div id='bottom'>刪除筆數:${deleteNum}</div>
	
</body>
</html>