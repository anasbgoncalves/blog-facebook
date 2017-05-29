class MoviesController < ApplicationController

  def index
    @movies = Facebook.get_object(current_user.token, '/me/movies?fields=name,picture,studio')
    @active_tab = 'movies'
  end
end
