import Foundation

protocol JokeRepositoryProtocol {
  func writeJoke(joke: JokeModel)
  func getUrlSession(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask?
}

class JokeRepository: JokeRepositoryProtocol {
  
  let storage: JokeStorageProtocol
  let apiService: JokeApiServiceProtocol
  
  init(storage: JokeStorageProtocol, apiService: JokeApiServiceProtocol) {
    self.storage = storage
    self.apiService = apiService
  }
  
  func writeJoke(joke: JokeModel) {
    self.storage.writeJoke(joke: joke)
  }
  
  func getUrlSession(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask? {
    return self.apiService.getUrlSession(completionHandler: completionHandler)
  }
}
