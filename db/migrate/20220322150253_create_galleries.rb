class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :name, default: '', null: false
      t.text :short_description, default: '', null: false

      t.timestamps
    end
  end
end
