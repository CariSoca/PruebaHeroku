var contributors = angular.module('share', ['ngResource']);

contributors.factory("Contributors", function($resource) {
 return $resource("share/:id", { id: '@id' }, {
   index:   { method: 'GET', isArray: true, responseType: 'json' }
 });
});

projects.controller("shareCtrl", function($scope, Contributors) {
 
 $scope.contributors = Contributors.index()  
 
 $scope.link = "https://toggl.com/app/timer"

})