require('pry')
class Cat
  attr_accessor :owner, :mood
  attr_reader :name
  
  @@all = []
  
  def initialize(name, owner)
    @name = name 
    @owner = owner
    @mood = "nervous"
    @@all.push(self)
  end
  
  def self.all 
    @@all
  end
  
end

class Owner
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all.push(self)
  end
    
  def say_species
    "I am a #{species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.size
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
    
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    my_cat = Cat.all.find{|cat| cat.name == name}
    my_cat.owner = self
  end
end

anna = Owner.new('Anna')
justin = Owner.new('Justin')
karen = Cat.new('Karen', justin)
anna.buy_cat(Karen.name)
binding.pry