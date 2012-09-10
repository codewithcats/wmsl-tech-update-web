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
		$scope.topic.sessionDate = moment($scope._date, 'DD/MM/YYYY HH:mm').valueOf();
		$http.put('topic', $scope.topic);
	};
}
CreateTopicCtrl.$inject = ['$scope', '$http'];