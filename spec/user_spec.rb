require 'spec_helper'



describe User do
  # pending "add some examples to (or delete) /Users/apprentice/Desktop/web_flash_cards/Rakefile"
  before(:all) do
       @giovanna =  User.create({email: 'gigi@hotmail.com', name: "Giovanna", password: "1234"})
       @joseph = User.create({email: 'jfizi@hotmail.com', name: "Joseph", password: "1234"})
       @jordan = User.create({email: 'jojo@hotmail.com', name: "Jordan", password: "1234"})
       @sheldon = User.create({email: 'sheldor@hotmail.com', name: "Sheldon", password: "1234"})
  end

  after(:all) do
    User.all.each {|user| user.destroy}
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
    expect(@sheldon.password).to exist
  end

end
