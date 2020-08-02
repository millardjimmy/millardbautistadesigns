class ApplicationController < ActionController::Base

    def logged_in?
        !!session([:employee_id])
    end

    def require_login
        return head(:forbidden) unless logged_in?
    end

    def current_user
        Employee.find_by(id: session[:employee_id]) if logged_in?
    end

    def set_user
        @curr_user = current_user
    end

    def project_lead?
        current_user.lead
    end

    def in_company?
        company_id == session[:company_id]
    end

    def require_company_permission(company_id)
        return head(:forbidden) if !in_company?(company_id)
    end


end
