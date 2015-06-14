get '/decks/new' do
  @user = User.find(params[:id])
   erb :'decks/new'
end

post '/decks/new' do
  Deck.create(name: params[:deck_name], creator_id: @user.id)
  deck_id = Deck.last.id
  Card.create(question: params[:card1_q], answer: params[:card1_a], deck_id: deck_id)
  redirect "/users/1"
end