class BooksController < ApplicationController

  def index
    @books = Facebook.get_object(current_user, '/me/books?fields=name,picture')
  end
end
