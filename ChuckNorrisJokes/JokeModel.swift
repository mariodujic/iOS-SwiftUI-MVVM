import Foundation

struct JokeModel: Codable {
  var message: String = ""
  var image: String = ""
}

extension JokeModel {
     private enum CodingKeys: String, CodingKey {
        case message = "value"
        case image = "icon_url"
    }
}
