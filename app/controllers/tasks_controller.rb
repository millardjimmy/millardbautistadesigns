class TasksController < ApplicationController

    def index
        @tasks = Project.find(params[:project_id]).tasks
    end

    def new
        @task = Task.new
    end
    
    def create
    end
    
    def show
    end

    def update
    end

    def destroy
    end

end
