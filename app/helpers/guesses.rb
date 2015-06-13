def add_guess(status,card)
  guess = Guess.create(correct: status)
  guess.card = card
  guess.round = Round.find(session[:round_id])
  binding.pry
end
