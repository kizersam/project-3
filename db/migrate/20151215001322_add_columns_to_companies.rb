class AddColumnsToCompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :product, :string
    add_column :companies, :funding, :string
    add_column :companies, :brief, :string
    add_column :companies, :whyus, :text
    add_column :companies, :website, :string
    add_column :companies, :employees, :string
  end
end
