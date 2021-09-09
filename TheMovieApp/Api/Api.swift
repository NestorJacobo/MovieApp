
import Foundation

class Api{
    
    public static func getMovies(movieType: MovieType, completion: @escaping(_ movies: ApiResponse?) -> Void){
        let uri = movieType == .playingNow ? "now_playing" : "popular"
        let url = "\(ApiConstant.baseUrl)/\(uri)?api_key=\(ApiConstant.apiKeyMovie)&language=es-MX&page=1"
        
        ApiRequest.requestGet(url: url, completion: completion)
    }
    
    public static func getMovieDetail(movieId: Int64, completion: @escaping(_ movieDetails: Movie?) -> Void){
        
        let url = "\(ApiConstant.baseUrl)/\(movieId)?api_key=\(ApiConstant.apiKeyMovie)&language=es-MX"
        
        ApiRequest.requestGet(url: url, completion: completion)
    }
    
}
