
import Foundation

struct ApiResponse: Codable{
    var page: Int
    var results:[Movie]
    var dates: Dates?
    var totalPages: Int
    var totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page = "page", results = "results", dates = "dates", totalPages = "total_pages", totalResults = "total_results"
    }
}

struct Dates: Codable{
    let maximum: String
    let minimum: String
}
