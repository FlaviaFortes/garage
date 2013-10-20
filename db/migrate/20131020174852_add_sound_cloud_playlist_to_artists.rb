class AddSoundCloudPlaylistToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :soundcloud_playlist, :string
  end

  def self.down
    remove_column :artists, :soundcloud_playlist, :string
  end
end
