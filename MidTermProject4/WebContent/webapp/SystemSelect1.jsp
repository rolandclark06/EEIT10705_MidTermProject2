<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select One Data</title>
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
	height: 200px;
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

.st3 {
	width: 1000px;
	margin: auto;
	position: absolute;
	top: 35%;
	right: 23%;
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

table {
	margin: auto;
}

#bottom {
	width: 50%;
	margin: auto;
	text-align: center;
}

.title2 {
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
		let verify1 = document.getElementById('verify1');
		let verify1Pho = document.getElementById('verifypho1');
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
		<form Action='servlet.do' method='POST'>
			<div class="st1">
				<label class="t1" for="account1">分行代碼:</label> 
				<input class="input" type="text" id="bankbranchcode1" name="bankbranchcode"
					autocomplete="off" size="20" onblur="bankbranchcodeVerify()"
					placeholder="請輸入分行代碼"> 
					<img src="" style="width: 15px"	id="verifypho1"><span id="verify1" class=""></span>
				<p class="st2">(必須為數字)</p>
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
	<p>
	<p class='title2' style="color: red">${ErrorMsg.id}</p>
	<p class='title2' style='color: red;'>${ErrorMsg.exception}</p>
	<p class='title2' style='color: red;'>${ErrorMsg.id2}</p>
	<div class='st3'>

		<hr>
		<p id='title2'>銀行資料如下：</p>
		<br>
		<table border='1'>
			<tr>
				<th width='120'>銀行歸屬</th>
				<th width='120'>銀行代號</th>
				<th width='140'>分行代號</th>
				<th width='360'>部門名稱</th>
				<th width='130'>部門地址</th>
				<th width='150'>部門電話</th>
				<th width='150'>負責人</th>
				<th width='150'>最後修改時間</th>
				<th width='150'>部門網址</th>
			</tr>
			<tr>
				<td>${aBean.bankclass}</td>
				<td>${aBean.bankheadcode}</td>
				<td>${aBean.bankbranchcode}</td>
				<td>${aBean.departmentname}</td>
				<td>${aBean.departmentaddress}</td>
				<td>${aBean.departmentphonum}</td>
				<td>${aBean.departmentprincipal}</td>
				<td>${aBean.changedate}</td>
				<td>${aBean.bankwebsite}</td>
			</tr>
		</table>
	</div>
	<br>
</body>
</html>