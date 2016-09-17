/// <reference path="angular.js" />

var app = angular.module("mainScreenModulo", []);
			app.controller("mainScreenControlador", function($scope, $http) {

				$scope.sync = true;

				$scope.stories = [];

				$scope.addStory = function () {
					$scope.stories.push($scope.newStory);
					$scope.newStory = null;
				};

				$scope.deleteStory = function () {
					$scope.stories.splice($scope.toDeleteStory,1);
					$scope.toDeleteStory = null;
				};

                $http.get("home.json")
  				.then(function(response) {      			  
      			  $scope.projectName = response.data.name;  				  
  				  $scope.series = response.data.series;  				  
  				  $scope.strategies = response.data.consensusStrategies;
  				}); 

  				/*sendData = function(){
  					var info = { name: $scope.projectName,
  							     consensus: $scope.

  					};
  				};*/ 

			});