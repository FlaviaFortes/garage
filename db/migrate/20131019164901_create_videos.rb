class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.references :artist, index: true

      t.timestamps
    end
  end
end
