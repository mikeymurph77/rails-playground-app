class WelcomeController < ApplicationController
  def index

    # require 'rspotify'
    # # RSpotify.authenticate("aa9e6084e70b4a3394a413d2ab2b4a51", "d7cff9dcafa8485bbafb53b6daa23035")

    # p me = RSpotify::User.find('mikeymurph77')

    if session[:spotify_user]
      # me = RSpotify::User.find(cookies[:spotify_user])
      spotify_user = RSpotify::User.new(session[:spotify_user])

      # Get count of User's total playlists
      count = 0
      limit = 50
      offset = 0
      total_num_in_pass = 50
      owners_playlists = []

      while total_num_in_pass == 50 do
        playlist_results = spotify_user.playlists(limit: 50, offset: offset)
        total_num_in_pass = playlist_results.size

        playlist_results.each do |playlist|
          if playlist.owner.id == spotify_user.id
            owners_playlists << playlist.id
          end
        end

        count += total_num_in_pass
        offset += 50
      end

      p "total playlists: #{count}"
      p "total OWNED playlists: #{owners_playlists.size}"
      p "total FOLLOWING playlists: #{count - owners_playlists.size}"
      p owners_playlists
    end
  end
end
