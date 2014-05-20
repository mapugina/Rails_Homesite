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
		
	instance.createProject = (newProject) ->
		console.log(newProject.title)
		console.log(newProject.contents)
		if newProject.title == '' or newProject.contents == ''
			alert('Neither the Title nor the body are allowed to be left blank.')
			return false
			
		data = 
			title: newProject.title
			contents: newProject.contents
				
		$http.post('./projects.json', data).success( (data) ->
			
			instance.projects.push(data)
			console.log('Successfully created post.')		
		).error( ->
				console.error('Failed to create post.')
		)
		
		return true
		
	return instance
])