require 'themoviedb-api'
require 'dotenv'
Dotenv.load('.env')

class SearchMovie

  def search(titre, number)
    Tmdb::Api.key(ENV["DBMOVIE_KEY"])

    all_results = Tmdb::Search.movie(titre).results[number]
      @id = all_results.id
      movie_hash = Tmdb::Movie.detail(@id)
      movies = []
      movies << movie_hash["title"]
      movies << movie_hash["release_date"]
      crew_hash = Tmdb::Movie.crew(@id)

      crew_hash.each do |an_array|
        if an_array.select {|k,v| v.include?("Director") }
          p an_array
          #movies << the_array["name"]
          #p the_array["name"]
        end
      end
      #movies << crew_hash["name"]
      #return crew_hash
      return "Titre du film: #{movies[0]}, Date de sortie: #{movies[1]}, Réalisateur: #{movies[2]}}"
  end

  def perform(title, num)
    search(title, num)
  end

end
