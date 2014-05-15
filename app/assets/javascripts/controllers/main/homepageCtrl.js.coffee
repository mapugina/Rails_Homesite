
###
@Homesite.controller 'homepageCtrl', ['$scope', ($scope) ->
	$scope.data
]
###
console.log('homepageCtrl init')
@homepageCtrl = ['$scope', '$http', '$routeParams', '$location', ($scope, $http, $routeParams, $location) ->
  $scope.projects =  []
  $http.get('./projects.json').success( (data) ->
			$scope.projects = data
			console.log('Projects aquired')
			).error( ->
				console.error('Failed to load posts.')
			)			
  $scope.projectId = $routeParams.projectId
		$scope.openProj = (projectId) ->
			$location.url('/project/' + projectId)
	
]