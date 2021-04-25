import Foundation
import RealmSwift

protocol JokeStorageProtocol {
  func writeJoke(joke: JokeModel)
}

class JokeStorage: JokeStorageProtocol {
  
  private let localRealm = try! Realm()
  
  func writeJoke(joke: JokeModel) {
    try! localRealm.write {
      localRealm.add(joke)
    }
  }
  
  func getJokes() -> Results<JokeModel> {
    return localRealm.objects(JokeModel.self)
  }
}
