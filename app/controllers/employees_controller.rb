class EmployeesController < ApplicationController

    def index
        @employees = current_company_employees
    end
    
    def new
        @employee = Employee.new
        @company = Company.find(params[:company_id])
    end

    def create
        @employee = Employee.new(employee_params)
        @company = Company.find(params[:company_id]) if params[:company_id]
        if @employee.save
            if !session[:employee_id] 
                session[:employee_id] = @employee.id
                session[:company_id] = @employee.company_id
                redirect_to employee_path(@employee)
            else 
                redirect_to employee_path(@employee)
            end
        else
                render :new
        end
    end

    def show
        @assigned = @employee.assigned_tasks
        @completed = @employee.completed_tasks
    end

    def edit
        if :project_lead?
            @company = Company.find(session[:company_id]) 
            render "edit"
        else
            return head(:forbidden)
        end
    end

    def update
        @company = Company.find(session[:company_id])
        if :project_lead?
            if @employee.update(employee_params)
                redirect_to employee_path(@employee)
            else
                render :edit
            end
        else
            return head(:forbidden)
        end
    end

    def destroy
        if :project_lead?
            @employee.tasks.each do |task|
                task.employee_id = nil
            end
            @employee.destroy
            redirect_to projects_path
        else
            return head(:forbidden)
        end
    end

    def month
        company = Company.find(session[:company_id])
        @emp_month = company.employees.most_completed_tasks
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :title, :password, :email, :lead, :password_confirmation, :company_id)
    end

    def set_employee
        @employee = Employee.find(params[:id])
        require_company_permission(@employee.company_id)
    end

    def current_company_employees
        Employee.all.select {|emp| emp.company_id == session[:company_id]}
    end
   
end