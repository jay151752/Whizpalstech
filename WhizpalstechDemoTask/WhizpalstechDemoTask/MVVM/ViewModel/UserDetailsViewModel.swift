//
//  UserDetailsViewModel.swift
//  WhizpalstechDemoTask
//
//  Created by Jay Ghervada on 30/12/25.
//

class UserDetailsViewModel {
    
    var modelList = [UserDetailObject]()
    private let networkService: NetworkService
    
    //dependency injection
    init(networkService: NetworkService = NetworkManager.shared) {
        self.networkService = networkService
    }
    
    
    func fetchUserDetailModels() async {
        let url = "https://jsonplaceholder.typicode.com/users"
        
        do {
            let response: [UserDetailObject] = try await networkService.request(
                urlString: url,
                responseType: [UserDetailObject].self
            )
            modelList = response
        } catch let error as NetworkError {
            print("Network Error: \(error.localizedDescription)")
        } catch {
            print("Unexpected Error: \(error.localizedDescription)")
        }
    }
}
