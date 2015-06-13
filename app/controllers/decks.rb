
enable :sessions


get '/decks/:id/start' do
  deck = Deck.find_by(id: params[:id])
	session['number'] = 0
  erb :''s
  redirect "/decks/#{deck.id}/play"
end

post '/decks/:id/start' do
  deck = Deck.find_by(id: params[:id])
  session['number'] = 0
  redirect "/decks/#{deck.id}/play"
end

get '/decks/:id/play' do

  deck = Deck.find(params[:id])

  if deck.cards.size > session['number']
	  @card = deck.cards[session['number']]
    erb :'decks/show'
  end

end

post '/decks/:id/play' do
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
