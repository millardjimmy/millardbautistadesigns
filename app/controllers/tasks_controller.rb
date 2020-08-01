class TasksController < ApplicationController

    def index
        @tasks = Project.find(params[:project_id]).tasks
    end

    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to task_path
        else
            render :new
    end
    
    def show
    end

    def update
    end

    def destroy
    end

end