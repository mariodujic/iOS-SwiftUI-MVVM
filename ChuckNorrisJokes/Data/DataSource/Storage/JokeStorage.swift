import RealmSwift

protocol JokeStorageProtocol {
  func writeJoke(joke: JokeModel)
  func getPreviousJokes() -> [JokeModel]?
}

class JokeStorage: JokeStorageProtocol {
  
  private let realm: Realm?
  
  init() {
    self.realm = ServiceLocator.get.resolve()
  }
  
  func writeJoke(joke: JokeModel) {
    try! realm?.write {
      realm!.add(joke)
    }
  }
  
  func getPreviousJokes() -> [JokeModel]? {
    if (realm?.objects(JokeModel.self)) != nil {
      return Array(realm!.objects(JokeModel.self))
    } else {
      return nil
    }
  }
}
