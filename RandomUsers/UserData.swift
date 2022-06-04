//
//  UserData.swift
//  RandomUsers
//
//  Created by Richard Garrison on 6/3/22.
//

import Foundation

//: Create class to store user information.
@MainActor
class UserData: ObservableObject  {
    @Published var users: [User] = []
    
//: init() does not support concurrency, add Task to execute getUsers() asynchronous function.
    init() {
        Task {
           await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            let users = try await UserFetchingClient.getUsers()
            self.users = users
        }
        catch {
            print(error)
        }
    }
}
