get "/categories" do
  @categories = Category.all

  erb :"/categories/index"
end

get "/categories/:id" do
  @category = Category.find(params[:id])
  @decks = @category.decks

  erb :"/categories/show"
end

#deck 1 1 - 20

#deck 2 20 - 40

# deck = Deck.find(params[:id])
# card = deck.cards[session[:number]]

# We do not know the proper convention, for the routes.
# We don't know whether to use deck/id or card/id for the game.
