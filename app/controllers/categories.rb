get "/categories" do
  @categories = Category.all

  erb :"/categories/index"
end

get "/categories/:id" do
  p @decks = Category.find(params[:id]).decks

  erb :"/categories/show"
end
