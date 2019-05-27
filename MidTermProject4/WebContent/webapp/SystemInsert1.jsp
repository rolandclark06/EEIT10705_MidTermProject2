<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	width: 600px;
	border: 1px solid black;
	margin: 15px auto;
	border-radius: 15px;
}

.st1 {
	width: 600px;
	border-bottom: 1px solid #e0e0e0;
	margin: 10px;
	padding-bottom: 10px;
}

.st2 {
	color: gray;
	font-size: 12px;
}

.sub {
	width: 600px;
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

.p2 {
	text-align: center;
}

#bottom {
	width: 50%;
	margin: auto;
	text-align: center;
}
</style>
<script>
	function bankheadcodeVerify() {
		let bankbranchcode1 = document.getElementById('bankheadcode1').value;

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
	function departmentnameVerify() {
		let bankbranchcode1 = document.getElementById('departmentname1').value;

		function isNumber(temp) {
			var re = /[^\u4e00-\u9fa5]/;
			if (temp == "")
				return 1;
			if (re.test(temp))
				return 2;
			return 3;
		}
		let verify1 = document.getElementById('verify3');
		let verify1Pho = document.getElementById('verifypho3');
		if (isNumber(bankbranchcode1) == 3) {
			verify1.innerHTML = "格式正確";
			verify1Pho.src = "/MidTermProject4/res/images/greenHook.jpg"
			return true;
		} else if (isNumber(bankbranchcode1) == 1) {
			verify1.innerHTML = "必填";
			verify1Pho.src = "/MidTermProject4/res/images/redX.jpg"
			return false;
		} else if (isNumber(bankbranchcode1) == 2) {
			verify1.innerHTML = "請輸入中文";
			verify1Pho.src = "/MidTermProject4/res/images/redX.jpg"
			return false;
		}
	}
	function departmentaddressVerify() {
		let bankbranchcode1 = document.getElementById('departmentaddress1').value;

		function isNumber(temp) {
			if (temp == "")
				return 1;
			return 3;
		}
		let verify1 = document.getElementById('verify4');
		let verify1Pho = document.getElementById('verifypho4');
		if (isNumber(bankbranchcode1) == 3) {
			verify1.innerHTML = "格式正確";
			verify1Pho.src = "/MidTermProject4/res/images/greenHook.jpg"
			return true;
		} else if (isNumber(bankbranchcode1) == 1) {
			verify1.innerHTML = "必填";
			verify1Pho.src = "/MidTermProject4/res/images/redX.jpg"
			return false;
		}
	}
	function departmentphonumVerify() {
		let bankbranchcode1 = document.getElementById('departmentphonum1').value;

		function isNumber(temp) {
			var re = /^[\d]+$/;
			if (temp == "")
				return 1;
			if (!re.test(temp))
				return 2;
			return 3;
		}
		let verify1 = document.getElementById('verify5');
		let verify1Pho = document.getElementById('verifypho5');
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
	function departmentprincipalVerify() {
		let bankbranchcode1 = document.getElementById('departmentprincipal1').value;

		function isNumber(temp) {
			if (temp == "")
				return 1;
			return 3;
		}
		let verify1 = document.getElementById('verify6');
		let verify1Pho = document.getElementById('verifypho6');
		if (isNumber(bankbranchcode1) == 3) {
			verify1.innerHTML = "格式正確";
			verify1Pho.src = "/MidTermProject4/res/images/greenHook.jpg"
			return true;
		} else if (isNumber(bankbranchcode1) == 1) {
			verify1.innerHTML = "必填";
			verify1Pho.src = "/MidTermProject4/res/images/redX.jpg"
			return false;
		}
	}
	function changedateVerify() {
		let bankbranchcode1 = document.getElementById('changedate1').value;

		function isNumber(temp) {
			var re = /^([0-9]{4})[./]{1}([0-9]{1,2})[./]{1}([0-9]{1,2})$/;

			if (temp == "")
				return 1;
			if (!re.test(temp))
				return 2
			return 3;
		}
		let verify1 = document.getElementById('verify7');
		let verify1Pho = document.getElementById('verifypho7');
		if (isNumber(bankbranchcode1) == 3) {
			verify1.innerHTML = "格式正確";
			verify1Pho.src = "/MidTermProject4/res/images/greenHook.jpg"
			return true;
		} else if (isNumber(bankbranchcode1) == 1) {
			verify1.innerHTML = "必填";
			verify1Pho.src = "/MidTermProject4/res/images/redX.jpg"
			return false;
		} else if (isNumber(bankbranchcode1) == 2) {
			verify1.innerHTML = "時間格式錯誤";
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
		<form Action='servlet2.do' method='POST'>
			<div class="st1">
				<label class="t1" for="account1">銀行所屬:</label> <select
					name="bankclass" id="selectyear"
					style="width: 100px; height: 30px;">
					<option value="本國">本國</option>
					<option value="他國">他國</option>
				</select>

			</div>
			<div class="st1">
				<label class="t1" for="account1">總部代碼:</label> <input class="input"
					type="text" id="bankheadcode1" name="bankheadcode"
					autocomplete="off" size="20" onblur="bankheadcodeVerify()"
					placeholder="請輸入總部代碼"> <img src="" style="width: 15px"
					id="verifypho1"> <span id="verify1" class=""></span>

				<p class="st2">(1.不可空白，2.必須全部為數字)</p>

			</div>
			<div class="st1">
				<label class="t1" for="account1">分行代碼:</label> <input class="input"
					type="text" id="bankbranchcode1" name="bankbranchcode"
					autocomplete="off" size="20" onblur="bankbranchcodeVerify()"
					placeholder="請輸入分行代碼"> <img src="" style="width: 15px"
					id="verifypho2"> <span id="verify2" class=""></span>

				<p class="st2">(1.不可空白，2.必須全部為數字)</p>

			</div>
			<div class="st1">
				<label class="t1" for="account1">部門名稱:</label> <input class="input"
					type="text" id="departmentname1" name="departmentname"
					autocomplete="off" size="20" onblur="departmentnameVerify()"
					placeholder="請輸入部門名稱"> <img src="" style="width: 15px"
					id="verifypho3"> <span id="verify3" class=""></span>

				<p class="st2">(1.不可空白，2.必須全部為中文字)</p>

			</div>
			<div class="st1">
				<label class="t1" for="account1">部門地址:</label> <input class="input"
					type="text" id="departmentaddress1" name="departmentaddress"
					autocomplete="off" size="20" onblur="departmentaddressVerify()"
					placeholder="請輸入部門地址"> <img src="" style="width: 15px"
					id="verifypho4"> <span id="verify4" class=""></span>

				<p class="st2">(1.不可空白)</p>

			</div>
			<div class="st1">
				<label class="t1" for="account1">部門電話:</label> <input class="input"
					type="text" id="departmentphonum1" name="departmentphonum"
					autocomplete="off" size="20" onblur="departmentphonumVerify()"
					placeholder="請輸入部門電話"> <img src="" style="width: 15px"
					id="verifypho5"> <span id="verify5" class=""></span>

				<p class="st2">(1.不可空白，2.必須全部為數字)</p>

			</div>
			<div class="st1">
				<label class="t1" for="account1">負責人:</label> <input class="input"
					type="text" id="departmentprincipal1" name="departmentprincipal"
					autocomplete="off" size="20" onblur="departmentprincipalVerify()"
					placeholder="請輸入負責人"> <img src="" style="width: 15px"
					id="verifypho6"> <span id="verify6" class=""></span>

				<p class="st2">(1.不可空白)</p>

			</div>
			<div class="st1">
				<label class="t1" for="account1">修改日期:</label> <input class="input"
					type="text" id="changedate1" name="changedate" autocomplete="off"
					size="20" onblur="changedateVerify()" placeholder="請輸入修改日期">
				<img src="" style="width: 15px" id="verifypho7"> <span
					id="verify7" class=""></span>

				<p class="st2">(1.不可空白，2.日期格式yyyy/MM/dd)</p>

			</div>
			<div class="st1">
				<label class="t1" for="account1">部門網址:</label> <input class="input"
					type="text" id="bankwebsite1" name="bankwebsite" autocomplete="off"
					size="20" onblur="" placeholder="請輸入部門網址"><img src=""
					style="width: 15px" id="verifypho8"> <span id="verify8"
					class=""></span>

				<p class="st2"></p>

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
	<p class='p2' style="color: red">${ErrorMsg.bankheadcode}</p>
	<p class='p2' style="color: red">${ErrorMsg.bankbranchcode}</p>
	<p class='p2' style="color: red">${ErrorMsg.departmentname}</p>
	<p class='p2' style="color: red">${ErrorMsg.departmentaddress}</p>
	<p class='p2' style="color: red">${ErrorMsg.departmentphonum}</p>
	<p class='p2' style="color: red">${ErrorMsg.departmentprincipal}</p>
	<p class='p2' style="color: red">${ErrorMsg.changedate}</p>
	<p class='p2' style="color: red">${ErrorMsg.bankwebsite}</p>
	<div id='bottom'>新增筆數:${insertNum}</div>
</body>
</html>