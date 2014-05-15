@Homesite = angular.module('Homesite', ['ngRoute'])


@Homesite.config( ['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/', {
        templateUrl: 'assets/main.html',
        controller: 'homepageCtrl'
      })
      .when('/about', {
        templateUrl: 'assets/about.html',
        controller: 'homepageCtrl'
      })
      .when('/contact', {
        templateUrl: 'assets/contact.html',
        controller: 'homepageCtrl'
      })
])
