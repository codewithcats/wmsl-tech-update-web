'use strict';


// Declare app level module which depends on filters, and services
angular.module('wmsl.tech', []).
  config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/home', {templateUrl: 'resources/angularjs/partials/home.html'});
	$routeProvider.when('/day', {templateUrl: 'resources/angularjs/partials/day/day-home.html', controller: CreateDayCtrl});
    $routeProvider.when('/speaker', {templateUrl: 'resources/angularjs/partials/speaker/speaker-home.html', controller: SpeakerCtrl});
    $routeProvider.when('/admin', {templateUrl: 'resources/angularjs/partials/admin/admin-home.html', controller: AdminCtrl});
    $routeProvider.otherwise({redirectTo: '/home'});
  }]);
