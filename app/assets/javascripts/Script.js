/// <reference path="angular.js" />

var app = angular.module("mainScreenModulo", []);
			app.controller("mainScreenControlador", function($scope, $http) {

				$scope.proyecto = {
					name: "Proyecto",
					estrategia: "PlanningPoker",
					serie: "Fibonacci",
					consenso: "Average"
				};

				$scope.estrategias = [{id: 1, name:"PlanningPoker"}];
				$scope.idEstrategiaSeleccionada = 1;

				$scope.sync = true;

				$scope.historias = ["login google"];

				$scope.agregarHistoria = function () {
					$scope.historias.push($scope.nuevaHistoria);
					$scope.nuevaHistoria = null;
				};

				$scope.eliminarHistoria = function () {
					$scope.historias.splice($scope.HistoriaBorrar,1);
					$scope.HistoriaBorrar = null;
				};

                $http.get("home.json")
  				.then(function(response) {
      			  $scope.consensusList = response.data.consensus_list;
      			  $scope.seriesList = response.data.series_list;

  				});

			});