class AddYoutubePlaylistToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :youtube_playlist, :string
  end

  def self.down
    remove_column :artists, :youtube_playlist, :string
  end
end
