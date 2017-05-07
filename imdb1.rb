#####
class Person
  def initialize(name)
    @name = name
  end

  attr_accessor :name

end
#####
class Actor < Person
  def initialize(name, acting_style)
    super(name)
    @acting_style = acting_style
  end

  attr_accessor :acting_style
end
#####
class Director < Person
  def initialize(name)
    super(name)
  end

  def filmography
    #some method that returns all the movies that is directed by this directed
  end

end
#####
class Movie
  def initialize(title, description, actors, directors)
    @title = title
    @description = description
    @actors = actors
    @directors = directors
  end

  attr_accessor :title, :description, :actors, :directors

  #class level methods -->
  #file read
  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def search
    print "Type in your search term here: "
    input = gets.chomp.downcase
    ObjectSpace.each_object(self).to_a.each do |movie|
      if movie.title.downcase.incude? input
        puts "Title: #{movie.title}\nDescription: #{movie.description}\nActors: #{movie.actors}\nDirectors: #{movie.directors}"
      end
    end
  end
end
#####

leo = Actor.new("Leo", "bad")
wally = Director.new("Wally")
findingnemo = Movie.new("Finding Nemo", "test", leo, wally)
findingdory = Movie.new("Finding Dory", "test", leo, wally)

#puts Movie.all.count

#Movie.all.each do |movie|
#  puts movie.title
#end

findingdory.search
