
import Foundation
import Alamofire

class ApiRequest {
    
    public static func requestGet<T>(url: String, completion: @escaping(_ data: T?) -> Void) where T: Codable{
        AF.request(url, method: .get).responseDecodable{ (response: DataResponse<T, AFError>) in
            debugPrint(response)
            
            if response.error != nil{
                NSLog("Api error \(String(describing: response.error))")
                completion(nil)
            }else{
                completion(response.value)
            }
        }
    }
    
    public static func requestPost<T>(url:String, object: Codable, completion: @escaping(_ data: T?) -> Void) where T: Codable{
        AF.request(url, method: .post, parameters: object as? Parameters, encoding: JSONEncoding.default).responseDecodable{ (response: DataResponse<T, AFError>) in
            debugPrint(response)
            
            if response.error != nil{
                NSLog("Api error \(String(describing: response.error))")
                completion(nil)
            }else{
                completion(response.value)
            }
        }
    }
}
