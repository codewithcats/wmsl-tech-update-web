'use strict';

function UserInfoNavCtrl($scope, $http) {
	$http.get('user/profile')
	.success(function(profile) {
		$scope.profile = profile;
		if(!!profile) {
			$http.get('user/connection')
			.success(function(conn) {
				$scope.profile.imageUrl = conn.imageUrl;
			});
		}
	});
}
UserInfoNavCtrl.$inject = ['$scope', '$http'];
