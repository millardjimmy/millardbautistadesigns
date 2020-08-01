class Employee < ApplicationRecord
    has_secure_password
    belongs_to :company
    has_many :tasks
    has_many :projects, through: :tasks
    has_many :comments
    has_many :commented_projects, through: :comments, source: :projects
end
