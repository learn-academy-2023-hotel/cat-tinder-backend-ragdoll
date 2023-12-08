require 'rails_helper'

RSpec.describe Dog, type: :model do
  it "should validate name exists in database entry" do
    # assign ruby variable to Cat.create and pass it all the required info EXCEPT name
    dog = Dog.create(age:3, enjoys:'reading by candlelight', image: 'url')
    # if cat name is not present, throw an error
    expect(dog.errors[:name]).to_not be_empty
  end

  it "should validate age exists in db entry" do
    dog = Dog.create(name:'Junior', enjoys:'reading by candlelight', image:'url')
    expect(dog.errors[:age]).to_not be_empty
  end

  it "should validate enjoys exists in db entry" do
    dog = Dog.create(name:'Junior', age:3, image:'urls')
    expect(dog.errors[:enjoys]).to_not be_empty
  end

  it "should validate image exists in db entry" do
    dog = Dog.create(name:'Junior', age:3, enjoys: 'reading by candlelight')
    expect(dog.errors[:image]).to_not be_empty
  end

  it "should validate enjoys is minimum 10 characters" do
    dog = Dog.create(name:'Junior', age:3, enjoys: 'walk', image: 'url')
    # expect(dog.errors[:enjoys]).to_not be_empty
    expect(dog[:enjoys].length).to be >= 10
  end
  

end