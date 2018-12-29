class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :client_name
      t.string :start_date
      t.text :extras

      t.timestamps
    end
  end
end
