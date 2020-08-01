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

    def edit
    end

    def update
        #Project Lead will have ability to change task
    end

    def destroy
        #Project Lead will have ability to delete a task
    end

    private

end
