import SwiftUI
import URLImage

struct ContentView: View {
  
  @StateObject var viewModel = JokeViewModel()
  
  var body: some View {
    NavigationView{
      VStack{
        Group {viewState()}
          .padding()
        Button("Press me", action: {
          viewModel.fetchJoke()
        })
      }
      .navigationTitle("Jokes")
    }
  }
  
  func viewState() -> AnyView {
    switch viewModel.state {
    case .initial:
      return AnyView(
        Image("downArrow")
          .resizable()
          .scaledToFit()
      )
    case .loading:
      return AnyView(Text("Loading"))
    case .error(let message):
      return AnyView(Text(message))
    case .data(let model):
      return AnyView(VStack{
        if !model.image.isEmpty {
          URLImage(
            url: URL(string: model.image)!,
            content: { image in
              image.aspectRatio(contentMode: .fit)
            })
        }
        Text(model.message).font(.system(size: 19))
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
