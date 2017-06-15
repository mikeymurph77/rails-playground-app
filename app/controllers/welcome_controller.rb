class WelcomeController < ApplicationController
  def index

    # require 'rspotify'
    # # RSpotify.authenticate("aa9e6084e70b4a3394a413d2ab2b4a51", "d7cff9dcafa8485bbafb53b6daa23035")

    # p me = RSpotify::User.find('mikeymurph77')

    if session[:spotify_user]
      # me = RSpotify::User.find(cookies[:spotify_user])
      spotify_user = RSpotify::User.new(session[:spotify_user])
      binding.pry
    end
  end
end
