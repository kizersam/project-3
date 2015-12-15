class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|

      t.timestamps null: false
      t.references :student
      t.references :job
      t.text :body
      t.string :status
    end
  end
end
