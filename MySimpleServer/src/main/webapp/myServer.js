var app = angular.module('MomondoMetaApp', ['ngRoute']);

app.controller('SearchCtrl', function ($scope, $http, $routeParams, $location) {

    $scope.search3Param = function () {

        var date;
        date = new Date($scope.myDate);
      
        JSON.stringify($scope.date);
        if (angular.isUndefined($scope.flight.destination)) {
            $http({
                method: 'GET',
                url: 'api/search/' + $scope.flight.startPlace
                      
            }).then(function (response) {

                $scope.result = response.data;
                $scope.flights = response.data.flights;
                console.log($scope.result);
                console.log($scope.flights);
            });
        } else 
        {
            $http({
                method: 'GET',
                url: 'api/search/' + $scope.flight.startPlace 
            }).then(function (response) {

                $scope.result = response.data;
                $scope.flights = response.data.flights;
                console.log($scope.result);
                console.log($scope.flights);
            });
        }
    };
      
});
