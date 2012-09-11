'use strict';

function ScheduleHighlightCtrl($scope, $http) {
	$http.get('topics/hl')
	.success(function(topics) {
		$scope.topics = topics;
	});

	$scope.getSessionDateLabel = function(d) {
		return moment(d).format('dddd, MMMM Do YYYY, h:mm a');
	};
}
ScheduleHighlightCtrl.$inject = ['$scope', '$http'];