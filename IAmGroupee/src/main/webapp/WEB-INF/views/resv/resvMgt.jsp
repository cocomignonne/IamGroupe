<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resv_management</title>

	<!-- Theme style -->
	<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
	<!-- Favicon -->
	<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
	

</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	 
	<main class="main container">
		<section class="content-header">
        		<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>예약 자산</h1>
						</div>
						
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
								<li class="breadcrumb-item active">Asset Management</li>
							</ol>
						</div>
					</div> <!--/.row -->
	       		</div> <!--/.container-fluid -->
	    </section>
		
		<section class="content">
			<div class="container-fluid">
				
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">회의실 목록 관리</h3>	
					</div>

					<div class="card-body">
						<div id="jsGrid1"></div>
					</div>
				</div>
		
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">비품 목록 관리</h3>	
					</div>

					<div class="card-body">
						<div id="jsGrid2"></div>
					</div> 
				</div>

			</div> <!-- /.container-fluid -->
		</section> <!-- /.content-body -->
	</main>    

	<script>
		$(function () {

			$("#jsGrid1").jsGrid({
				width: "100%",
				height: "auto",

				inserting: true,
				editing: true,
				sorting: true,
				autoload: true,
				
				deleteConfirm: "선택한 자산을 정말 삭제하시겠습니까?",
				
				fields: [
					{ name: "roomName", type: "text", width: 150 },
					{ name: "activateYn", type: "checkbox",title: "활성화", width: 50 },
					{ name: "createDate", type: "date", width: 150 },
					{ name: "modDate", type: "date", width: 150 },
					{ type: "control" , width:"15%"}
				],

				controller:  {
		            loadData: function(filter) {
		                var d = $.Deferred();
		                $.ajax({
		                	contentType : "application/json; charset=UTF-8",
		                	type: "GET",
		                	url: "<%=request.getContextPath()%>/admin/resv/room",
		                    dataType: "json",
		                    data: filter
		                }).done(function(response) {
		                	if(response.status == "ok") {
		                		d.resolve(response.data);	
		                	}
		                });
		                return d.promise();
		            }
		            
				}
			
			
			});


			$("#jsGrid2").jsGrid({
					width: "100%",
					height: "auto",
			
					inserting: true,
					editing: true,
					sorting: true,
					paging: true,
					autoload: true,
					
					deleteConfirm: "선택한 자산을 정말 삭제하시겠습니까?",
			
					fields: [
						{ name: "assetName", type: "text", width: 150 },
						{ name: "activateYn", type: "checkbox",title: "활성화", width: 50 },
						{ name: "createDate", type: "date", width: 150 },
						{ name: "modDate", type: "date", width: 150 },
						{ type: "control" , width:"15%"}
					],
					
					controller:  {
			            loadData: function(filter) {
			                var d = $.Deferred();
			                $.ajax({
			                	contentType : "application/json; charset=UTF-8",
			                	type: "GET",
			                	url: "<%=request.getContextPath()%>/admin/resv/asset",
			                    dataType: "json",
			                    data: filter
			                }).done(function(response) {
			                	if(response.status == "ok") {
			                		d.resolve(response.data);	
			                	}
			                });
			                return d.promise();
			            }
					}
			});
	
		});

	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<!-- jsGrid -->
	<link rel="stylesheet" href="${root}/resources/plugins/jsgrid/jsgrid.min.css">
	<link rel="stylesheet" href="${root}/resources/plugins/jsgrid/jsgrid-theme.min.css">
	
	<%-- <script src="${root}/resources/js/resv/jsGrid.js"></script> --%>
	<script src="${root}/resources/plugins/jsgrid/jsgrid.min.js"></script>

</body>
</html>