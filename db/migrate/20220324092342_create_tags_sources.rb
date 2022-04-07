class CreateTagsSources < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_sources do |t|
      t.bigint :source_id
      t.references :tag
      t.string :type

      t.timestamps
    end
  end
end
