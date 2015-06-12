
enable :sessions


get '/decks/:id/start' do
	session['number'] = 0
  redirect "/decks/#{params[:id]}/play"
end


get '/decks/:id/play' do

  deck = Deck.find(params[:id])

  if deck.cards.size > session['number']
	  @card = deck.cards[session['number']]
    erb :'decks/show'
  end

end

post '/decks/:id/play' do
  binding.pry
  deck = Deck.find(params[:id])
  card = deck.cards[session['number']]
	session['number'] += 1
  if card.question == params[:correct]
    card.correct = true
    @correct = true
    erb :show_correct
  else
    card.correct = false
  end

end
