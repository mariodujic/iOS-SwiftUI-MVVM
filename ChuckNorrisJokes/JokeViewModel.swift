import Foundation

class JokeViewModel: ObservableObject {
  
  private var apiService = JokeApiService()
  
  @Published var joke: String = ""
  @Published var image: String = ""
  
  func fetchWeather() {
    
    let task = apiService.getUrlSession(){data, _ , error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let model = try JSONDecoder().decode(JokeModel.self, from: data)
        DispatchQueue.main.async {
          self.joke = model.value
          self.image = model.icon_url
        }
      }catch {
        print("Failed to fetch joke")
      }
    }
    task?.resume()
  }
}
