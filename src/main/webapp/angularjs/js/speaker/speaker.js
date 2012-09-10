'use strict';

/* Controllers */
function SpeakerCtrl($scope) {
	$scope.$on('speaker.create.success', function() {
		$scope.$broadcast('speaker.fetch.request');
	});
}
SpeakerCtrl.$inject = ['$scope'];

function ListSpeakerCtrl($scope, $http) {
	fetchAllSpeakers();
	$scope.$on('speaker.fetch.request', fetchAllSpeakers);
	function fetchAllSpeakers() {
		$http.get('speakers')
		.success(function(speakers) {
			$scope.$emit('speaker.fetch.success', speakers);
			$scope.speakers = speakers;
		});
	};
}
ListSpeakerCtrl.$inject = ['$scope', '$http'];

function CreateSpeakerCtrl($scope, $http) {
	$scope.createSpeaker = function() {
		$http.put('speaker', {
			'name': $scope.speakerName
		})
		.success(function(speaker) {
			$scope.$emit('speaker.create.success');
		});
	};
}
CreateSpeakerCtrl.$inject = ['$scope', '$http'];