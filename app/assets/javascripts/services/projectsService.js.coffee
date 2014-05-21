angular.module('Homesite').factory('projectService', ['$http', ($http) ->
	instance = 
		isLoaded: false
		projects: []
	console.log('creating homesite')
	
	instance.loadProjects = (deferred)->
		if !instance.isLoaded
			$http.get('./projects.json').success( (data) ->
						instance.projects = data
						instance.isLoaded = true;
						console.log('Projects aquired')
						if deferred?
							deferred.resolve()
						
					).error( ->
						console.error('Failed to load posts.')
						if deferred?
							deferred.reject('Failed to load posts')
					)
		else
			if deferred?
					deferred.resolve()
		return instance.projects
		
	instance.createProject = (newProject) ->
		console.log(newProject.title)
		console.log(newProject.contents)
		if newProject.title == '' or newProject.contents == ''
			alert('Neither the title nor the body are allowed to be left blank.')
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
		
	instance.findById = (id) ->
		return project for project in instance.loadProjects() when project.id == id
	
		
	return instance
])