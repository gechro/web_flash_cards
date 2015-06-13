#users

users = [
{email: 'gigi@hotmail.com', name: "Giovanna", password: "1234"},
{email: 'jfizi@hotmail.com', name: "Joseph", password: "1234"},
{email: 'jojo@hotmail.com', name: "Jordan", password: "1234"},
{email: 'sheldor@hotmail.com', name: "Sheldon", password: "1234"}

]

users.each {|user| User.create(user)}



#decks

pokemon = [
{name: 'pokemon', creator_id: 1}
]

pokemon_deck = Deck.create({name: 'pokemon', creator_id: 1, category_id: 1})




#cards

pokemon_cards = [{question: 'name the pokemon that looks like an electric mouse', answer: 'pikachu',deck_id: 1},{question: 'name the first pokemon',answer: 'bulbasaur',deck_id: 1}]


pokemon_cards.each {|card| Card.create(card)}

#categories


Category.create(name: 'anime')








