class LatestTomatoes::Movies
  attr_accessor :popcornScore, :title, :tomatoScore, :actors, :mpaaRating, :synopsis, :url


  def self.latest
    self.scrape_movies
  end
 
  def self.scrape_movies
    movies = []
    doc = Nokogiri::HTML(open("http://d3biamo577v4eu.cloudfront.net/api/private/v1.0/m/list/find?page=1&limit=30&type=dvd-new-releases&services=amazon%3Bamazon_prime%3Bflixster%3Bhbo_go%3Bitunes%3Bnetflix_iw%3Bvudu&sortBy=release"))
    jsonstring = doc.search("p").text # gets json string from main html element
    x=JSON.parse(jsonstring) #parsed array/hash of movie data
    x["results"].each do |movies_hash|
        # movies.each {|k,v| self.send(("#{k}="), v) }

      # movies_hash.each do |key, value|
      #   movies_hash
      #   key
      #   puts "#{key}"
      #   # self.send(("#{key}="), value)  
      # # if key == "title" || key == ["tomatoScore"] || key == ["actors"]  ||  key == ["synopsis"] ||  key == ["url"]    
      # #   self.send(("#{key}="), value)  
      # # end
      # end
    
      movies<< movies_hash
    end
    movies

  end



end