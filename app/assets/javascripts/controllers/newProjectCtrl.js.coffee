@newProjectCtrl = ['$scope', '$location', 'projectService', ($scope, $location, projectService) ->
		$scope.formData = {}
		$scope.formData.title = ''
		$scope.formData.contents = ''
		
		$scope.createPost = ->
			if (projectService.createProject($scope.formData))
				$location.path('')
			
		$scope.clearPost = ->
			$scope.formData.title = ''
			$scope.formData.contents = ''
]
