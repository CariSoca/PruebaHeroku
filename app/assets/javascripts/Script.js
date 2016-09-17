/// <reference path="angular.js" />

var app = angular.module("mainScreenModule", []);
			app.controller("mainScreenCtrl", function($scope, $http) {

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

        $http.get("home.json").then(function(response) {      			  
      			  $scope.projectName = response.data.name;  				  
  				  	$scope.series = response.data.series;  				  
  				  	$scope.strategies = response.data.consensusStrategies;
  				  	//TODO add default settings  				  	
  				}); 

				$scope.sendData = function(){
						var project = { name: $scope.projectName,
										consensusStrategy : $scope.selectedStrategyId,
										values : $scope.selectedQuantityValues,
										serie : $scope.selectedSerieId,
										stories : $scope.stories														
		};
						$http.post("projects/", angular.toJson(project));					
					};					
				});		