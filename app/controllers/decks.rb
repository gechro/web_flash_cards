require 'pry'
enable :sessions


get '/decks/:id/start' do
	session['number'] = 0
	redirect ("/decks/#{params[:id]}/play")
end


get '/decks/:id/play' do

  deck = Deck.find(params[:id])

  if deck.cards.size > session['number']
	  @card = deck[session['number']]
	  session['number'] += 1
	    erb :"decks/show"
  end

end
