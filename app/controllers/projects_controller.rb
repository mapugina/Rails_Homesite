class ProjectsController < ApplicationController
  respond_to :json
  
  def index
    
    #gather all projects
    projects = Project.all
    
    #respond to request with post data in json format
    respond_with(projects) do |format|
      format.json { render :json => projects.as_json }
    end
    
  end
  
end
