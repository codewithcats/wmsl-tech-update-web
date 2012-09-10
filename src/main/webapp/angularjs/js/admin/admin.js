'use strict';

function AdminCtrl($scope, $rootScope) {
	$scope.$on('speaker.create.success', function() {
		$scope.$broadcast('speaker.fetch.request');
	});
	$scope.$on('speaker.fetch.success', function(e, speakers) {
		$rootScope.speakers = speakers;
	});
}
AdminCtrl.$inject = ['$scope', '$rootScope'];