
enable :sessions


get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
	session[:deck_index] = 0
  round = Round.create(player_id: session[:user_id],deck_id: @deck.id)
  session[:round_id] = round.id
  erb :'decks/index'
end

post '/decks/:id' do
  deck = Deck.find_by(id: params[:id])
  session[:deck_index] = 0
  redirect "/decks/#{deck.id}/play"
end

get '/decks/:id/play' do
  deck = Deck.find(params[:id])
  @round = Round.find(session[:round_id])
  @correct_answers_count = @round.guesses.where(correct: true).count
  @wrong_answers = @round.guesses.where(correct: false)
  # binding.pry

  if deck.cards.size > session[:deck_index]
	  @card = deck.cards[session[:deck_index]]
    erb :'decks/show', locals: {deck: deck}
  else
    erb :'decks/results'
  end

end

post '/decks/:id/play' do
  @deck = Deck.find(params[:id])
  card = @deck.cards[session[:deck_index]]
	session[:deck_index] += 1
  if card.answer == params[:answer]
    add_guess(true,card)
    @correct = "correct"
    erb :'decks/show_result'
  else
    add_guess(false,card)
    @correct = "incorrect"
    @answer = card.answer
    erb :'decks/show_result'
  end
end
