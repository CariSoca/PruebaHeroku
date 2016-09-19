var app = angular.module('share',[]);


app.controller("shareCtrl", function($scope, $http) {  

  $http.get("share.json")
  .then(function(response) {      			  
    $scope.link = response.data.link;
    $scope.contributors = response.data.contributors;  				  			  
  }); 

});