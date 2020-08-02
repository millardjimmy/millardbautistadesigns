class CompanysController < ApplicationController

    def index
    end

    def new
    end

    def create
        @new_company = Company.new(company_params)
        if @new_company.save
            redirect_to new_company_employree_path(@new_company)
        else
            render '/signup'
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def company_params
        params.require(:company).permit(:name)
    end
    
end
