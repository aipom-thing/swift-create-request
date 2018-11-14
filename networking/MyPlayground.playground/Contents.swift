import Alamofire
import UIKit

struct ArticleSource: Codable{
    let id: String?
    let name: String?
}

struct Article: Codable{
    let source: ArticleSource?
    let author: String?
    let title: String?
    let description: String?
}

struct ArticleResponse: Codable{
//    let totalResults: Int = 0
    let totalResults: Int?
    let articles: [Article]?
    let status: String?

// mode semi otomatis .
//    enum CodingKeys: String, CodingKey{
//        case totalResult
//        case articles
//        case status
//    }
//
//    init(from decoder: Decoder) throws{
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        let strTotalResult = try values.decode(String.self, forKey: .totalResult)
//        totalResults = Int(strTotalResult)
//    }
    
// mode manual harus satu2
}

Alamofire.request("https://newsapi.org/v2/everything?q=bitcoin&from=2018-10-14&sortBy=publishedAt&apiKey=72fbf5e64b3448d2a8ebbb71fc9dba7f").responseJSON{(response) in
//    if let value = response.result.value as? [String : Any]{
//        print("Response from server")
//        print(value)
//
//        if let totalResults = value["totalResults"]{
//            print("Total result : \(totalResults)")
//        }
    
//        print("Total result : \(value["totalResults"])")
//        print("Articles : \(value["articles"])")
//    }
    
    // response.data = data yg masih mentah
    // response.result.value = data yg sudah diserialise menjadi json (data yg dah diolah setengah)
    
    if let data = response.data {
        print("Response from server")
        let jsonDecoder = JSONDecoder()
//        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        if let mappedResponse = try? jsonDecoder.decode(ArticleResponse.self, from: data){
            print(mappedResponse.articles ?? [])
        }
        
//        let total = mappedResponse.totalResults ? 0 // nil coalescing operator
//        print(total)
    }
   
}
