'use strict';

/**
 * @ngdoc function
 * @name d8frontendApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the d8frontendApp
 */
angular.module('d8frontendApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
