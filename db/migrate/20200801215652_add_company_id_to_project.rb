class AddCompanyIdToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :company_id, :integer
  end
end
