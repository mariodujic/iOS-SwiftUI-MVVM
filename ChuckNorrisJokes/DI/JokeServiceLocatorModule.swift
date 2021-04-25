import Foundation

class JokeServiceLocatorModule {
  
  public static func register() {
    ServiceLocator.get.register(JokeStorage() as JokeStorageProtocol)
    ServiceLocator.get.register(JokeApiService() as JokeApiServiceProtocol)
    ServiceLocator.get.register(JokeRepository() as JokeRepositoryProtocol)
  }
}
