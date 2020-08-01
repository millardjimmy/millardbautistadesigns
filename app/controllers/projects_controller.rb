class ProjectsController < ApplicationController

    def index
        @projects = # current projects
    end

    def new 
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to project_path
        else
            render :new
    end

    def show
    end

    def edit
    end

    def update
    end
    
    def destroy
    end

end
