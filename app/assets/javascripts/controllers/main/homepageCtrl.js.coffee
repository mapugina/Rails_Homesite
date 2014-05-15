
###
@Homesite.controller 'homepageCtrl', ['$scope', ($scope) ->
	$scope.data
]
###

@homepageCtrl = ['$scope', '$routeParams', '$location', 'projectService', ($scope, $routeParams, $location, projectService) ->
		$scope.projectService =  projectService
		$scope.openProj = (projectId) ->
			$location.url('/project/' + projectId)
			
		projectService.loadProjects()
		
]