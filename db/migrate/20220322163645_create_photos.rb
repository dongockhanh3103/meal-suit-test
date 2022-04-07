class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name, default: '', null: false
      t.text :short_description, default: ''
      t.datetime :shoot_date
      t.references :gallery

      t.timestamps
    end
  end
end
