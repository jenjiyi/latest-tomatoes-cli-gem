class LatestTomatoes::CLI

  def call
      new_movies
      input_1
      adios
  end

  def new_movies
   puts <<-DOC.gsub /^\s+/, ""
    Lastest DVD and streaming releases with tomato meter ratings.
    DOC
    new_dvds
  end

  def new_dvds
    puts "New movies on DVD & Streaming:"
    @movies = LatestTomatoes::Movies.latest

    @movies.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie[:title]} - #{movie[:tomatoScore]}%"
    end
  end

  def input_1
    input = nil
    while input != "exit"
    puts <<-DOC.gsub /^\s+/, ""
      Type the number of a movie to view more information about it, or back to see the list again, or exit:
      DOC
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 31 # not an integer
        
          puts <<-DOC.gsub /^\s+/, ""
          -------------
          #{@movies[input.to_i-1][:title]} - tomato meter: #{@movies[input.to_i-1][:tomatoScore]}%
          Actors: #{@movies[input.to_i-1][:actors].join(", ")}
          MPAA: #{@movies[input.to_i-1][:mpaaRating]}
          #{@movies[input.to_i-1][:synopsis]}
          http://www.rottentomatoes.com#{@movies[input.to_i-1][:url]}
          -------------
          DOC

      elsif input.to_i > 30
        puts "Oops, there are only 30 movies listed. Enter a number between 1-30."
      elsif input == "back"
          new_dvds
      end  
    end 
  end

  def adios
    puts "\nBye! Check back next week for new releases.\n"
  end



end