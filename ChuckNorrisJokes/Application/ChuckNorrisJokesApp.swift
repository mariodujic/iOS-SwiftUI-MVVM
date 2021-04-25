import SwiftUI

@main
struct ChuckNorrisJokesApp: App {
  
  init() {
    ApplicationServiceLocatorModule.register()
  }
  
  var body: some Scene {
    WindowGroup {
      JokeView()
    }
  }
}
