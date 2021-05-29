import SwiftUI

struct JokesHistoryView: View {
  
  private var viewModel = JokesHistoryViewModel()
  
  var body: some View {
    NavigationView{
      List(viewModel.getPreviousJokes()!, id: \.self) { joke in
        Text(joke.message)
      }
      .navigationTitle(Resources.PreviousJokesText.previousJokesScreenTitle)
    }
  }
}

struct JokesHistoryView_Previews: PreviewProvider {
  
  static var previews: some View {
    JokesHistoryView()
  }
}
