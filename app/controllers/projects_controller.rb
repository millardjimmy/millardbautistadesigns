class ProjectsController < ApplicationController

    def index
        @projects = Project.each
    end

    def new 
        @projects = Project.new
    end

    def create
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
