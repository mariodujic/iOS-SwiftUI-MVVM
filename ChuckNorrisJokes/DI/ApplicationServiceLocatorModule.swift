import Foundation
import RealmSwift

class ApplicationServiceLocatorModule {
  
  public static func register() {
    ServiceLocator.get.register(try! Realm())
  }
}
