## peter's code ##

class Person
  # A person has ...
  def initialize(name)
    @name = name
  end
  attr_accessor :name
end

class Actor < Person
  # A actor has ...
  def initialize(name, acting_style)
    super(name)
    @acting_style = acting_style
  end
  attr_accessor :acting_style

  def acted_in
    # Some method that returns all the movies that is directed by this director.
  end
end

class Director < Person
    def initialize(name)
      super(name)
    end

    def filmography
      # Some method that returns all the movies that is directed by this director.
    end
end

class Junior_Director < Director
  def initialize

  end
end

class Movie
  def initialize(title, description, actors, director)
    @title = title
    @description = description
    @actors = actors
    @director = director
  end

  attr_accessor :title, :description, :actors, :director

  def self.all
   ObjectSpace.each_object(self).to_a
 end

 def self.search(search_term)
   # get all movies
   movies = self.all
   # return only matches in all attributes
   movies.select do |movie|
     movie.title =~ /#{search_term}/i ||
     movie.description =~ /#{search_term}/i ||
     Array(movie.actors).map{|actor| actor.name}.join =~ /#{search_term}/i ||
     movie.director =~ /#{search_term}/i
  end
 end
end



leo = Actor.new("Leo", "bad")
wallice = Director.new("wallice")
superbad4 = Movie.new("Superbad4", "test", [leo, leo], wallice)
superbad3 = Movie.new("Superbad3", "test", leo, wallice)


puts Movie.all.count
puts "this is the actors"
puts superbad4.actors

puts "=" * 5


#
# IMDB LIVE
#

require "curses"


Curses.noecho()
Curses.curs_set(0)              #invisible cursor
Curses.timeout = 0

search_string = ""

while true

  # show the user our search panel
  Curses.clear
  Curses.addstr("Type your movie search: #{search_string}\n\n")

  # find matching movies
  if search_string.size > 0

    movie_results = Movie.search(search_string)

    # show the current results
    if movie_results.count > 0
      Curses.addstr("Found #{movie_results.count} movies:\n")
      movie_results.each do |movie|
        Curses.addstr("#{movie.title}\n")
      end
    end
  end

  # get input
  ch = loop do
    ch = Curses.getch
    break ch if !ch.nil?
    sleep 0.01
  end

  # process keyboard input
  if ch.ord == 127
    search_string = search_string[0...-1]
  else
    search_string += ch.to_s
  end

end
