import SwiftUI

struct JokesHistoryView: View {
  
  private var viewModel: JokesHistoryViewModelProtocol = JokesHistoryViewModel()
  
  var body: some View {
    NavigationView{
      List(viewModel.getPreviousJokes()!, id: \.self) { joke in
        Text(joke.message)
      }
      .navigationBarTitle(
        Resources.PreviousJokesText.previousJokesScreenTitle+" (\(viewModel.getPreviousJokesSize()))", displayMode: .inline
      )
    }
  }
}

struct JokesHistoryView_Previews: PreviewProvider {
  
  static var previews: some View {
    JokesHistoryView()
  }
}
