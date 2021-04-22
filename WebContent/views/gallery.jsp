<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery</title>

<jsp:include page="shared/header.html" />
<!--  
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>-->
<script>
/*
$(document).ready( function() {
	$(document).on('change', '.btn-file :file', function() {
		var input = $(this),
		label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		input.trigger('fileselect', [label]);
	});

	$('.btn-file :file').on('fileselect', function(event, label) {	    
	    var input = $(this).parents('.input-group').find(':text'),
	    log = label;
	    
	    if( input.length ) {
	        input.val(log);
	    } else {
	        //if( log ) alert(log);
	        console.log(log);
	    }
    
	});
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();	        
	        reader.onload = function (e) {
	            $('#img-upload').attr('src', e.target.result);
	        }	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	function loadImage(){
		$('#article-img-preview').attr('src', 'assets/photos/'+$('#image-url').val()); 
	}

	$("#imgInp").change(function(){
	    readURL(this);
	}); 	
	
	loadImage();
});
function save_value(id, title,value ){
	$('#'+id).attr('name', title+':'+value);
}
*/
</script>
</head>
<body>
	<header>
		<!-- menu -->
		<jsp:include page="shared/main_menu.jsp" />
	</header>

	<div role="main" class="container" style="margin-top: 100px;">
	  <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Gallery</h1>
	
	  <hr class="mt-2 mb-5">
	
	  <div class="row text-center text-lg-left">
		
		<c:forEach items="${images}" var="image">
		    <div class="col-lg-3 col-md-4 col-6">
		      <a href="#" class="d-block mb-4 h-100">
		            <img class="img-fluid img-thumbnail" src="<%=request.getContextPath()%>/assets/photos/${image}" alt="">
		      </a>
		    </div>
	    </c:forEach>
	    
	    <!--  
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/aob0ukAYfuI/400x300" alt="">
	          </a>
	    </div>
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/EUfxH-pze7s/400x300" alt="">
	          </a>
	    </div>
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/M185_qYH8vg/400x300" alt="">
	          </a>
	    </div>
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/sesveuG_rNo/400x300" alt="">
	          </a>
	    </div>
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/AvhMzHwiE_0/400x300" alt="">
	          </a>
	    </div>
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/2gYsZUmockw/400x300" alt="">
	          </a>
	    </div>
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/EMSDtjVHdQ8/400x300" alt="">
	          </a>
	    </div>
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/8mUEy0ABdNE/400x300" alt="">
	          </a>
	    </div>
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/G9Rfc1qccH4/400x300" alt="">
	          </a>
	    </div>
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/aJeH0KcFkuc/400x300" alt="">
	          </a>
	    </div>
	    <div class="col-lg-3 col-md-4 col-6">
	      <a href="#" class="d-block mb-4 h-100">
	            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/p2TQ-3Bh3Oo/400x300" alt="">
	          </a>
	    </div>
	    -->
	  </div>
	
	</div>
	<!-- /.container -->
	
	
	
	<!-- footer -->
	<jsp:include page="shared/footer.html" />
</body>
</html>