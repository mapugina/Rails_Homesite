@projectPageCtrl = ['$scope', 'projectService', '$routeParams', '$q', ($scope, projectService, $routeParams, $q) ->
			
		$scope.setProject = ->
			@routeId = parseInt($routeParams.projectId)
			$scope.project = project for project in projectService.projects when project.id == @routeId
			console.log($scope.project)
		
		@deferred = $q.defer()
		@deferred.promise.then($scope.setProject);
		
		projectService.loadProjects(@deferred)
		
		# $scope.$watchCollection "projectService.projects", ->
			# $scope.project = projectService.findById($routeParams.projectId)
			# console.log("project")
			# console.log($scope.project)
]