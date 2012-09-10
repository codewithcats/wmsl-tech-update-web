'use strict';

function CreateTopicCtrl($scope, $http) {
	$scope.topic = {
		title: undefined,
		description: undefined,
		speakers: []
	};
	$scope.addSpeaker = function() {
		$scope.topic.speakers.push($scope._speaker);
	};
	$scope.createTopic = function() {
		$http.put('topic', $scope.topic);
	};
}
CreateTopicCtrl.$inject = ['$scope', '$http'];