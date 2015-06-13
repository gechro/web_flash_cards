def add_guess(status,card)
  guess = Guess.create(round_id: session[:round_id] ,correct: status, card_id: card.id)
end
