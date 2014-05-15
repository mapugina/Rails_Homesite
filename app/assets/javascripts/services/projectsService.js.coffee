angular.module('Homesite').factory('projectService', ['$http', ($http) ->
	instance = 
		isLoaded: false
		projects: []
	console.log('creating homesite')
	
	instance.loadProjects = ->
		if !instance.isLoaded
			$http.get('./projects.json').success( (data) ->
						instance.projects = data
						console.log('Projects aquired')
						console.log(instance.projects)
						instance.isLoaded = true;
					).error( ->
						console.error('Failed to load posts.')
					)
		return instance.projects
	return instance
])