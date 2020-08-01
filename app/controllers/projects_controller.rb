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
        #lead will have ability to edit
    end

    def update
        #lead will have ability to update
    end
    
    def destroy
        #lead will have ability to delete
    end

    private

    def project_params
        params.require(:project).permit(:name, :due_date, :description, :organization, :lead_id)
    end

end
