<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String title = "Upload";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=title %></title>
	<jsp:include page="views/shared/header.html" />
</head>
<body>
	<header>
		<jsp:include page="views/shared/main_menu.jsp" />
	</header>
	
	<div role="main" class="container" style="margin-top:100px;">
		<div class="row">
		    <div class="col-sm">
		    	<h2>Upload Image</h2>
				<!--  p class="lead">..</b></p-->			
				<form id="file-upload-form" class="uploader" 
					method="post" 
					action="<%=request.getContextPath()%>/upload"
					enctype="multipart/form-data">
				  <input id="file-upload" type="file" name="photo" accept="image/*" />
				
				  <label for="file-upload" id="file-drag" class="label">
				    <img id="file-image" src="#" alt="Preview" class="hidden">
				    <div id="start">
				      <i class="fa fa-download" aria-hidden="true"></i>
				      <div>Select a file or drag here</div>
				      <div id="notimage" class="hidden">Please select an image</div>
				      <span id="file-upload-btn" class="btn btn-primary">Select a file</span>
				    </div>
				    <div id="response" class="hidden">
				      <div id="messages"></div>
				      <progress class="progress" id="file-progress" value="0">
				        <span>0</span>%
				      </progress>
				      <input type="submit" class="btn btn-sm" value="Upload!" style="display:block; width:100%;" />
				    </div>
				  </label>
				</form>
		    </div>

		    <div class="col-sm">
		     	<h2>Preview (Last Upload)</h2>
				<div class="label">
					<img class="preview" src="<%=request.getContextPath()%>/assets/photos/${img}" alt="image preview" />
				</div>
		    </div>
		</div>
	</div>
	<jsp:include page="views/shared/footer.html" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/main.js"></script>
</body>
</html>