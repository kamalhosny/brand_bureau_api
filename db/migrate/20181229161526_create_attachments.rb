class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :attachment_type
      t.text :file
      t.references :project
      t.boolean :preview

      t.timestamps
    end
  end
end
