class JokesHistoryViewModel {
  
  private let repository: JokeRepositoryProtocol?
  
  init() {
    self.repository = ServiceLocator.get.resolve()
  }
  
  func getPreviousJokes() -> [JokeModel]? {
    return self.repository?.getPreviousJokes()
  }
}
