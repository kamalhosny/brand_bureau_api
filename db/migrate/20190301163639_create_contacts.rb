class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :label
      t.string :content

      t.timestamps
    end
  end
end
