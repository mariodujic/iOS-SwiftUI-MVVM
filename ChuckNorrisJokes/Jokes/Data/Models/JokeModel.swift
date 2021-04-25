import Foundation
import RealmSwift

class JokeModel: Object, Codable {
  @objc dynamic var message: String = ""
  @objc dynamic var image: String = ""
}

extension JokeModel {
  private enum CodingKeys: String, CodingKey {
    case message = "value"
    case image = "icon_url"
  }
}
