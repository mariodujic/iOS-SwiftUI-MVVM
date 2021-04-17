import SwiftUI
import URLImage

struct ContentView: View {
  
  @StateObject var viewModel = JokeViewModel()
  
  var body: some View {
    NavigationView{
      VStack{
        if !viewModel.image.isEmpty {
          URLImage(url: URL(string: viewModel.image)!,
                   content: { image in
                    image.aspectRatio(contentMode: .fit)
                   })
        }
        Text(viewModel.joke)
          .font(.system(size: 19))
          .padding()
        Button("Press me", action: {
          viewModel.fetchWeather()
        })
      }
      .navigationTitle("Jokes")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
