get "/categories" do
  @categories = Category.all

  erb :"/categories/index"
end

get "/categories/:id" do
  @category = Category.find(params[:id])
  @decks = @category.decks

  erb :"/categories/show"
end
