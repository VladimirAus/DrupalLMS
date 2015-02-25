'use strict';

/**
 * @ngdoc function
 * @name d8OnepageApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the d8OnepageApp
 */
angular.module('d8OnepageApp')
  .controller('MainCtrl', function ($scope, $http) {
    $scope.mainMenu = [];

    $http.get('/entity/menu/onepage-front').
	    success(function(data, status, headers, config) {
	      $scope.mainMenu = data;
	    }).
	    error(function(data, status, headers, config) {
	      // log error
	    });

    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
