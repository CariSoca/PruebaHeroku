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

				$scope.series = [{id: 1, name:"Fibonacci"}];
				$scope.idSerieSeleccionada = 1;

				$scope.consensos =[{id: 1, name: "Average"}];
				$scope.idConsensoSeleccionado = 1;

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
      			  $scope.projectData = response.data;
  				});

			});