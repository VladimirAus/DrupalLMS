'use strict';

/**
 * @ngdoc function
 * @name d8frontendApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the d8frontendApp
 */
angular.module('d8frontendApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
