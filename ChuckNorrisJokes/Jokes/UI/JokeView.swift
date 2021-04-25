import SwiftUI
import URLImage

struct JokeView: View {
  
  @StateObject var viewModel = JokeViewModel()
  
  var body: some View {
    NavigationView{
      VStack{
        Group {viewState()}.padding()
        Button("Press me", action: {
          viewModel.fetchJoke()
        }).font(.system(size: 33))
      }
      .navigationTitle("Jokes")
    }
  }
  
  func viewState() -> AnyView {
    switch viewModel.state {
    case .initial:
      return initialView()
    case .loading:
      return loadingView()
    case .error(let message):
      return errorView(message)
    case .data(let model):
      return successView(model)
    }
  }
  
  func initialView() -> AnyView {
    return AnyView(
      Image("downArrow")
        .resizable()
        .frame(width: 250, height: 250, alignment: .center))
  }
  
  func loadingView() -> AnyView {
    return AnyView(Text("Loading"))
  }
  
  func errorView(_ message: String) -> AnyView {
    return AnyView(Text(message))
  }
  
  func successView(_ model: JokeModel) -> AnyView {
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    JokeView()
      .preferredColorScheme(.dark)
  }
}
