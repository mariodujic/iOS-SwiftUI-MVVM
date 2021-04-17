import Foundation

class JokeApiService {
  
  private static let BASE_URL = "https://api.chucknorris.io/jokes/random"
  
  func getUrlSession(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask? {
    guard let url = getUrl() else { return nil }
    return URLSession.shared.dataTask(with: url, completionHandler: completionHandler)
  }
  
  private func getUrl() -> URL? {
    return URL(string: JokeApiService.BASE_URL)
  }
}
