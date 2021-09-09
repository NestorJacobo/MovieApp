
import Foundation
import RealmSwift

class Movie: Object, Codable {

    // Both
    @Persisted var id: Int64!
    @Persisted var title: String!
    @Persisted var posterPath: String!
    @Persisted var backdropPath: String!
    @Persisted var overview: String!
    var adult: Bool
    @Persisted var originalTitle: String!
    @Persisted var originalLanguage: String!
    @Persisted var popularity: Double!
    var releaseDate: String
    var video: Bool
    var voteCount: UInt
    var voteAverage: Double
    @Persisted var movieBType: MovieType?

    // List
    var genreIds: [Int]?

    // Detail
    var budget: Int?
    var genres: [Genre]?
    @Persisted var homepage: String?
    var imdbId: String?
    var revenue: UInt?
    var runtime: UInt?
    var spokenLanguages: [SpokenLanguage]?
    var status: String?
    var tagline: String?
    var productionCountries: [ProductionCountries]?
    var productionCompanies: [ProductionCompanies]?

    enum CodingKeys: String, CodingKey {
        case
            id = "id",
            title = "title",
            posterPath = "poster_path",
            backdropPath = "backdrop_path",
            overview = "overview",
            adult = "adult",
            originalTitle = "original_title",
            originalLanguage = "original_language",
            popularity = "popularity",
            releaseDate = "release_date",
            video = "video",
            voteCount = "vote_count",
            voteAverage = "vote_average",
            genreIds = "genre_ids",
            budget = "budget",
            genres = "genres",
            homepage = "homepage",
            imdbId = "imdb_id",
            revenue = "revenue",
            runtime = "runtime",
            spokenLanguages = "spoken_languages",
            status = "status",
            tagline = "tagline",
            productionCountries = "production_countries",
            productionCompanies = "production_companies"
    }
    
    public static func fetchMovies(movieType: MovieType, completion: @escaping(_ response: [Movie]) -> Void){
        Api.getMovies(movieType: movieType) { response in
            if response == nil{
                
                let realm = try! Realm()
                                
                let predicate = NSPredicate(format: "movieBType == %@", "\(movieType)")
                
                let movies = realm.objects(Movie.self).filter(predicate)
                
                print(movies)
                                
                let array = Array(movies)

                completion(array)
                return
            }
            
            saveMovies(response!.results, movieType: movieType){
                completion(response!.results)
            }
        }
    }
    
    public static func fetchMovieDetails(movieId: Int64, completion: @escaping(_ movieDetails: Movie?) -> Void){
        Api.getMovieDetail(movieId: movieId) { response in
            
            if response == nil{
                completion(nil)
                return
            }
            
            completion(response)
        }
    }
    
    public static func saveMovies(_ movies: [Movie], movieType:MovieType, completion: @escaping() -> Void){
        
        for movie in movies{
            movie.movieBType = movieType
        }
        
        let realm = try! Realm()
        
        try! realm.write{
            
            print(movieType)
            
            let predicate  = NSPredicate(format: "movieBType == %@", "\(movieType)")
            
            let moviesToDelete = realm.objects(Movie.self).filter(predicate)
            
            realm.delete(moviesToDelete)
            realm.add(movies)
        }
        completion()
    }
}

class Genre: Codable {
    var id: Int16?
    var name: String?
}

class SpokenLanguage: Codable {
    var englishName: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name",
             name = "name"
    }
}

struct ProductionCountries: Codable {
    let name: String
}

struct ProductionCompanies: Codable {
    let id: Int
    let logoPath: String?
    let name: String
    let originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id", logoPath = "logo_path", name = "name", originCountry = "origin_country"
    }
}

enum MovieType: String, PersistableEnum {
    case mostPopular, playingNow
}

