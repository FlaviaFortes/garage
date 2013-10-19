class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :email
      t.text :description
      t.string :site
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end