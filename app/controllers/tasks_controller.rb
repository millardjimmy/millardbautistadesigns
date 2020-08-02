class TasksController < ApplicationController
    before_action :require_login
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only: [:show, :edit]

    def index
        @tasks = Project.find(params[:project_id]).tasks
    end
    
    def new
        @task =Task.new
        @project = Project.find(params[:project_id])
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to task_path(@task)
        else
            @project = Project.find(params[:project_id])
            render :new
        end
    end

    def show
        @comment = Comment.new
        @comments = @task.comments.all
    end

    def edit
    end

    def update
        if current_user.lead
            params[:task][:due_date] = flatten_date_array(params[:task])
            if @task.update(task_params)
                redirect_to task_path(@task)
            else
                render :edit
            end
        end
        
        if !current_user.lead
            if !@task.employee.nil?
                if params[:task]
                    @task.update(task_params)
                else
                    @task.employee_id = nil
                    @task.save
                end
            else
                @task.employee_id = current_user.id
                @task.save
            end

            redirect_to task_path(@task)
        end

    end

    def destroy
        if :project_lead?
            @task.comments.each do |comment|
                comment.destroy
            end
            @task.destroy
            redirect_to project_path(@task.project)
        else
            return head(:forbidden)
        end
    end

    private

    def task_params
        params.require(:task).permit(:content, :lead_notes, :completed, :employee_id, :project_id, :due_date)
    end

    def set_task
        @task = Task.find(params[:id])
        require_company_permission(@task.project.company_id)
    end

    def flatten_date_array(date_hash)
        %w(1 2 3).map {|e| date_hash["date(#{e}i)"].to_i }
    end
end