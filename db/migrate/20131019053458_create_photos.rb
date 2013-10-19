class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :description
      t.references :artist, index: true

      t.timestamps
    end
  end
end
