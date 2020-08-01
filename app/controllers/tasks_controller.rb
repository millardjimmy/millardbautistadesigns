class TasksController < ApplicationController

    def index
        @tasks = Project.find(params[param here]).task
    end

    def new
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
