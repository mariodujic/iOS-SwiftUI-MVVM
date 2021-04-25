import Foundation

protocol JokeRepositoryProtocol {
  func writeJoke(joke: JokeModel)
  func getUrlSession(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask?
  func getPreviousJokes() -> [JokeModel]?
}

class JokeRepository: JokeRepositoryProtocol {
  
  private let storage: JokeStorageProtocol?
  
  init() {
    self.storage = ServiceLocator.get.resolve()
  }
  
  func writeJoke(joke: JokeModel) {
    storage?.writeJoke(joke: joke)
  }
  
  func getPreviousJokes() -> [JokeModel]? {
    return storage?.getPreviousJokes()
  }
  
  func getUrlSession(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask? {
    guard let apiService: JokeApiServiceProtocol = ServiceLocator.get.resolve() else {return nil}
    return apiService.getUrlSession(completionHandler: completionHandler)
  }
}
