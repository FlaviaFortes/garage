class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :url
      t.references :artist, index: true

      t.timestamps
    end
  end
end
