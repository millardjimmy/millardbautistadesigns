class Employee < ApplicationRecord
    has_secure_password
    belongs_to :company
    has_many :tasks
    has_many :projects, through: :tasks
    has_many :comments
    has_many :commented_projects, through: :comments, source: :projects

    validates :email, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])+\.[a-z](?:[a-z]{0,2}[a-z])\z/ }, presence: true, uniqueness: true
    validates :first_name, presence: true

    def full_name
        self.first_name + ' ' + self.last_name
    end
    
    def assigned_tasks
        self.tasks.select do |task|
            task.completed == false
        end
    end

    def completed_tasks
        self.tasks.select do |task|
            task.completed == true
        end
    end
    

    def self.most_completed_tasks
        self.all.sort_by {|emp| emp.completed_tasks.count }.last
    end



    private

    @email_regexp = /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])+\.[a-z](?:[a-z]{0,2}[a-z])\z/


end

end
