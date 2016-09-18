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
      			    $scope.projectName = "New Project";  				  
  				  	$scope.defaultSerie = response.data.default.serie;  				  
  				  	$scope.selectedStrategyId = response.data.default.consensus;
  				  	$scope.consensusList = response.data.consensus_list;
      			    $scope.seriesList = response.data.series_list;  
      			    $scope.timebox = response.data.default.timebox;	
      			    $scope.hour = $scope.timebox[0];
      			    $scope.min = $scope.timebox[1];
      			    $scope.number_of_vals = response.data.default.number_of_vals;
                    $scope.values = Array.apply(null, {length: $scope.number_of_vals + 1}).map(Number.call, Number)
                    $scope.values.shift();			  	
                    $scope.selectedQuantityValues = $scope.number_of_vals; 
  				}); 

				$scope.sendData = function(){
						var project = { name: $scope.projectName,
										consensusStrategy : $scope.selectedStrategyId,
										values : $scope.selectedQuantityValues,
										serie : $scope.defaultSerie,
										stories : $scope.stories,
										//email:  Ver con los de login
										//nickname:														
		          		};
						$http.post("projects/", angular.toJson(project));					
					};					
});		
