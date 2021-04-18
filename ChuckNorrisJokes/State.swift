import Foundation

enum State<T> {
  case initial
  case loading
  case error(String)
  case data(T)
}
