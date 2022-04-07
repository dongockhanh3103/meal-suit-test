class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :user_name, null: false
      t.text :content, default: ''
      t.references :photo

      t.timestamps
    end
  end
end
