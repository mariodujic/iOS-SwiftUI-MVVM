import Foundation

class JokeViewModel: ObservableObject {
  
  private var apiService = JokeApiService()
  
  @Published var message: String = ""
  @Published var image: String = ""
  
  func fetchWeather() {
    
    let task = apiService.getUrlSession(){data, _ , error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let model = try JSONDecoder().decode(JokeModel.self, from: data)
        DispatchQueue.main.async {
          self.message = model.message
          self.image = model.image
        }
      }catch {
        print("Failed to fetch joke")
      }
    }
    task?.resume()
  }
}
