class ApplicationController < ActionController::Base

    def logged_in?
        !!session([:employee_id])
    end

    def require_login
    end

    def current_user
    end

    def set_user
    end

    def project_lead?
    end

    def in_company?
    end


end
