<!doctype html>
<html lang="en" ng-app="wmsl.tech">
<head>
<meta charset="utf-8">
<title>WMSL Tech Update</title>
<link rel="shortcut icon" href="resources/images/retro_p_wing.ico">
<link rel="stylesheet" href="resources/angularjs/css/app.css">
<link rel="stylesheet" href="resources/twitter-bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/styles/font-awesome.css">
<link rel="stylesheet" href="resources/styles/navbar.css">
<style type="text/css">
	body {padding: 40px 0;}
	@media(max-width: 979px) {
		body {padding-top: 0;}
	}
	@media(max-width: 768px) {
		body {padding-top: 0;}
	}
</style>
<script src="resources/jquery-1.8.1.min.js"></script>
<script src="resources/twitter-bootstrap/js/bootstrap.js"></script>
<script src="resources/angularjs/lib/angular/angular.js"></script>
<script src="resources/angularjs/js/app.js"></script>
<script src="resources/angularjs/js/controllers.js"></script>
<script src="resources/angularjs/js/speaker/speaker.js"></script>
<script src="resources/angularjs/js/day/day.js"></script>
<script src="resources/angularjs/js/admin/admin.js"></script>
<script src="resources/angularjs/js/topic/topic.js"></script>
<script src="resources/angularjs/js/schedule/schedule.js"></script>
<script src="resources/angularjs/lib/moment.min.js"></script>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="#">WMSL Tech Update</a>
			</div>
		</div>
	</div>
	<div class="container" ng-view></div>
</body>
</html>