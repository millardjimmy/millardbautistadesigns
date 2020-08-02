class ApplicationController < ActionController::Base

    def logged_in?
        !!session([:employee_id])
    end

    def require_login
        return "forbidden" unless logged_in?
    end

    def current_user
        Employee.find_by(id: session[:employee_id]) if logged_in?
    end

    def set_user
    end

    def project_lead?
    end

    def in_company?
    end


end
