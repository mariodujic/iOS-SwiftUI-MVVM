import Foundation

class JokeViewModel: ObservableObject {
  
  private let repository: JokeRepositoryProtocol?
  
  init() {
    self.repository = ServiceLocator.get.resolve()
  }
  
  @Published var state: State = State<JokeModel>.initial
  
  func fetchJoke() {
    
    state = State<JokeModel>.loading
    
    let task = repository?.getUrlSession(){data, _ , error in
      guard let data = data, error == nil else {
        self.state = State<JokeModel>.error("Request error")
        return
      }
      
      do {
        let model = try JSONDecoder().decode(JokeModel.self, from: data)
        DispatchQueue.main.async {
          self.state = State<JokeModel>.data(model)
          self.repository?.writeJoke(joke: model)
        }
      }catch {
        self.state = State<JokeModel>.error("Unable to deserialize data")
      }
    }
    task?.resume()
  }
}
