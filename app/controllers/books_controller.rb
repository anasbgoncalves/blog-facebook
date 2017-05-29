class BooksController < ApplicationController

  def index
    @books = Facebook.get_object(current_user.token, '/me/books?fields=name,picture,written_by')
    @active_tab = 'books'
  end
end
