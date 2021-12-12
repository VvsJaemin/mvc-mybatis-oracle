<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>upload with Ajax</h1>
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<button id="uploadBtn">Upload</button>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880 // 5MB
	
	function checkExtension(fileName, fileSize) {
		if(fileSize >=maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return true;
		}
	}
	
	var cloneObj = $(".uploadDiv").clone();
	$("#uploadBtn").on("click", function (e) {
		var formData = new FormData();
	});
	
	
		$(document).ready(function () {
			$('#uploadBtn').on("click", function (e) {
				
				var formData = new FormData();
				var inputFile  = $("input[name='uploadFile']");
				
				var files = inputFile[0].files;
				
				console.log(files)
				
				//add fileData to formdata
				for(var i = 0; i < files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false
					}
					
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url: '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType:'json',
					success : function(result){
						alert("uploaded")
					}
				});
				
			});
		});
	</script>
</body>
</html>