class MoviesController < ApplicationController

  def index
    @movies = Facebook.get_object(current_user, { id: '/me/movies'})
  end
end
