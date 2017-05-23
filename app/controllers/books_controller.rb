class BooksController < ApplicationController

  def index
    @books = Facebook.get_object(current_user, '/me/books')
  end
end
