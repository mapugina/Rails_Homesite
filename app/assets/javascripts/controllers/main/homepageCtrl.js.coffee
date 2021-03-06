
###
@Homesite.controller 'homepageCtrl', ['$scope', ($scope) ->
	$scope.data
]
###

@homepageCtrl = ['$scope', '$routeParams', '$location', 'projectService', ($scope, $routeParams, $location, projectService) ->
		$scope.projectService =  projectService
		$scope.openProj = (projectId) ->
			$location.url('/project/' + projectId)
		$scope.rows = []
			
		projectService.loadProjects()
		
		$scope.$watchCollection "projectService.projects", ->
			$scope.rows = chunk projectService.loadProjects(), 3

		chunk = (a,s)->
		    if a.length == 0
		        []
		    else               
		        ( a[i..i+s-1] for i in [0..a.length - 1 ] by s)
		
]