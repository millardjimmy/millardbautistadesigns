class Company < ApplicationRecord
    has_many :projects
    has_many :employees
    validates :name, presence: true, uniqueness: true
end
