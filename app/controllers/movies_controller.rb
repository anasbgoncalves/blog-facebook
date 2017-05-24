class MoviesController < ApplicationController

  def index
    @movies = Facebook.get_object(current_user, '/me/movies?fields=name,picture')
  end
end
