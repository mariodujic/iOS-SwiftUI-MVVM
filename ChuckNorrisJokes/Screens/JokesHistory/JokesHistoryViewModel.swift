protocol JokesHistoryViewModelProtocol {
  func getPreviousJokes() -> [JokeModel]?
 func getPreviousJokesSize() -> Int
}

class JokesHistoryViewModel: JokesHistoryViewModelProtocol {
  
  private let repository: JokeRepositoryProtocol?
  
  init() {
    self.repository = ServiceLocator.get.resolve()
  }
  
  func getPreviousJokes() -> [JokeModel]? {
    return self.repository?.getPreviousJokes()
  }
  
  func getPreviousJokesSize() -> Int {
    return self.getPreviousJokes()?.count ?? 0;
  }
}
