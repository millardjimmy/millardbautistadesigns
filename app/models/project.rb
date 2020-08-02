class Project < ApplicationRecord
    belongs_to :company
    has_many :tasks
    has_many :employees, through: :tasks
    has_many :comments, through: :tasks
    validates :name, presence: true

    def unassigned_project_tasks
    end

    def assigned_project_tasks
    end

    def completed_project_tasks
    end

    def self.active_project_ids(company_id)
    end

    def self.active_projects(company_id)
    end
    
end
