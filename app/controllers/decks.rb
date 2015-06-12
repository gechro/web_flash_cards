get '/decks/:id/play' do
  deck = Deck.find(params[:id])
  @card = deck.card.first
    erb :"decks/show"
end