<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>首頁</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
#title{
width:100%;
font-family: 微軟正黑體;
margin:auto;
text-align: center;
background-color:#80ffff;
height: 50px;

}
#index {
	width: 400px;
	margin: auto;
	margin-top: 50px;
	padding-left: 50px;
	padding-right:40px;
	border: 3px solid black;
	border-radius: 10px;
	text-align: center;
}

tr {
	height: 20px;
	background-color: 	#4dffff;
}
td{
font-family: 微軟正黑體;
font-size: 25px;


}
a {
	margin: auto;
	text-align: center;
}
.p{
padding-top: 10px;

}
</style>
</head>
<body>
<div id='title'>
<p class='p'>
EEIT107_05_期中專題2_台灣金融法人登錄系統</p>


</div>
	<table id="index">
		<tr>
			<td><a href='webapp/SystemSelect1.jsp'>查詢單筆資料</a></td>
		</tr>
		<tr>
			<td><a href='webapp/SystemInsert1.jsp'>新增單筆資料</a></td>
		</tr>
		<tr>
			<td><a href='webapp/SystemDelete1.jsp'>刪除單筆資料</a></td>
		</tr>
		<tr>
			<td><a href='webapp/SystemUpdate1.jsp'>更新單筆資料</a></td>
		</tr>

	</table>




</body>
</html>