require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['spotify_client_id'], ENV['spotify_client_key'],
            scope: 'playlist-read-private playlist-read-collaborative playlist-modify-public playlist-modify-private streaming user-follow-modify user-follow-read user-library-read user-library-modify user-read-private user-read-birthdate user-read-email user-top-read'
            # scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
