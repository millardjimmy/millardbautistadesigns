class StaticPagesController < ApplicationController
    def home
    end

    def login
    end

    def signup
        @new_company = Company.new
    end
end