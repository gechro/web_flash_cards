require 'spec_helper'


# How do I run this all in the config. How do I run controllers with out a class? Do I simply run tests for routes in the global scope?

describe User, :type => :feature do
  # pending "add some examples to (or delete) /Users/apprentice/Desktop/web_flash_cards/Rakefile"
  before(:all) do
     @giovanna =  User.create({email: 'gigi@hotmail.com', name: "Giovanna", password: "1234"})
     @joseph = User.create({email: 'jfizi@hotmail.com', name: "Joseph", password: "1234"})
     @jordan = User.create({email: 'jojo@hotmail.com', name: "Jordan", password: "1234"})
     @sheldon = User.create({email: 'sheldor@hotmail.com', name: "Sheldon", password: "1234"})
     @pokemon_deck = Deck.create({name: 'pokemon', creator_id: 1, category_id: 1})
     @pikachu = Card.create({question: 'name the pokemon that looks like an electric mouse', answer: 'pikachu',deck_id: 1})
     @bulbasaur = Card.create({question: 'name the first pokemon',answer: 'bulbasaur',deck_id: 1})
     @anime = Category.create(name: 'anime')
     @round_1 = Round.create(player_id: 1, deck_id: 1)
  end

  after(:all) do
    # User.all.each {|user| user.destroy}
    # Card.all.each {|card| card.destroy}
    # Category.all.each {|category| category.destroy}
    # Deck.all.each {|deck| deck.destroy}
    # Round.all.each {|round| round.destroy}

    # How do I rollback all of these transactions? I know that deleteing everything is not the best route to take.
  end

  it 'should show all users in an array' do
    expect(User.all.size).to eq (4)
  end


  it 'should show the email of the user' do
    expect(@sheldon.email).to eq ('sheldor@hotmail.com')
  end

  it 'should show the the name of the user' do
    expect(@sheldon.name).to eq("Sheldon")
  end

  it 'show a user password' do
    expect(@sheldon.password).to be_truthy
  end

  it 'should find the user based of his/her id' do
    p User.find(2)
    expect(@joseph).to eq(User.find(2))
  end

  it 'should show the round for the user' do
    expect(@giovanna.rounds.count).to eq(1)
  end

  it 'should visit the home page' do
     visit '/'
     expect(page).to have_content 'Welcome to our site'
  end

  it 'should redirect to login from the home page' do
    visit '/'
    click_link('Login')
    # fill_in('Name',with: 'Sheldon')
    fill_in('Email',with: 'sheldor@hotmail.com')
    fill_in('Password', with: '1234')
    click_button('Login')
    expect(page).to have_content 'Sheldon Decks'
  end
  it 'should post invalid user for invalid login attempts' do
    visit '/'
    click_link('Login')
    # fill_in('Name',with: 'Sheldon')
    fill_in('Email',with: 'sheldor@hotmail.com')
    fill_in('Password', with: '4444')
    click_button('Login')
    expect(page).to_not have_content('Sheldon Decks')
  end
end
