class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :contents
      t.datetime :post_date

      t.timestamps
    end
  end
end
