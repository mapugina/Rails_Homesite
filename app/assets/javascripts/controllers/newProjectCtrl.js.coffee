@newProjectCtrl = ['$scope', 'projectService', ($scope, projectService) ->
		$scope.createPost = ->
			projectService.createProject($scope.formData)
			
		$scope.clearPost = ->
			$scope.formData.title = ''
			$scope.formData.contents = ''
]
