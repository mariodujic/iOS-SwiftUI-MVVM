import SwiftUI
import URLImage

struct JokeView: View {
  
  @StateObject var viewModel = JokeViewModel()
  
  init() {
    JokeServiceLocatorModule.register()
  }
  
  var body: some View {
    NavigationView{
      VStack{
        NavigationLink(
          destination: JokesHistoryView(),
          label: {
            Text(Resources.JokeText.history).font(.system(size: Resources.JokeSize.historyText))
          })
        Group {viewState()}.padding()
        Button(Resources.JokeText.pressMe, action: {
          viewModel.fetchJoke()
        }).font(.system(size: Resources.JokeSize.pressMeText))
      }
      .navigationTitle(Resources.JokeText.jokeScreenTitle)
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
        .frame(
          width: Resources.JokeSize.jokeImage,
          height: Resources.JokeSize.jokeImage,
          alignment: .center
        )
    )
  }
  
  func loadingView() -> AnyView {
    return AnyView(Text(Resources.JokeText.loading))
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
      Text(model.message).font(.system(size: Resources.JokeSize.jokeText))
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    JokeView()
      .preferredColorScheme(.dark)
  }
}
