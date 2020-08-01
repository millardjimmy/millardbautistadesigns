class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :employee_id
      t.integer :task_id

      t.timestamps
    end
  end
end
