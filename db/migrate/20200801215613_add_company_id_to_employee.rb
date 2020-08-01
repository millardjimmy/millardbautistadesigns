class AddCompanyIdToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :company_id, :integer
  end
end
