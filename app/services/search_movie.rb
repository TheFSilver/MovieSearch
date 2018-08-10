require 'themoviedb-api'
require 'dotenv'
Dotenv.load('.env')

class SearchMovie

  def search(titre, number)
    Tmdb::Api.key(ENV["DBMOVIE_KEY"])
    sleep(1)
    all_results = Tmdb::Search.movie(titre).results[number]
    @id = all_results.id
    sleep(1)
    movie_hash = Tmdb::Movie.detail(@id)
    movies = []
    movies << movie_hash["title"]
    movies << movie_hash["release_date"]
    sleep(1)
    crew_hash = Tmdb::Movie.crew(@id)
    crew_hash.each do |an_array|
      if an_array["job"] == "Director"
        movies << an_array["name"]
        sleep(1)
      end
    end

    if movies[4] != nil
      return "Titre du film: #{movies[0]} \nDate de sortie: #{movies[1]} \nRéalisateurs: #{movies[2]}, #{movies[3]} et #{movies[4]}"
    elsif movies[3] != nil && movies[4] == nil
      return "Titre du film: #{movies[0]} \nDate de sortie: #{movies[1]} \nRéalisateurs: #{movies[2]} et #{movies[3]}"
    elsif movies[2] != nil && movies[3] == nil
      return "Titre du film: #{movies[0]} \nDate de sortie: #{movies[1]} \nRéalisateur: #{movies[2]}"
    elsif movies[2] == nil
      return "Titre du film: #{movies[0]} \nDate de sortie: #{movies[1]} \nRéalisateur: information inconnue"
    elsif movies[0] == nil
      return nil
    end
  end

  def perform(title, num)
    search(title, num)
  end
end
