class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|

      t.timestamps null: false
      t.references :company
      t.string :role
      t.string :compensation
      t.text :description
      t.string :location
      t.string :college
      t.integer :numreplies
    end
  end
end
