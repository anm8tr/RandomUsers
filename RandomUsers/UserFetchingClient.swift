//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Richard Garrison on 6/3/22.
//

import Foundation
//: Create a user fetching structure to return a string containing 10 randomly generated users

struct UserFetchingClient {
    // Configure a static property to retrieve 10 users from the Random User Generator API
    static private let url = URL(string: "https://randomuser.me/api/?results-10&format-pretty")!
    
    // Add a function to retrieve the random user data asynchronously
    static func getUsers() async throws -> String {
        // Create a URL request that returns data only
        async let (data, _) = URLSession.shared.data(from: url)
        return try await String(data: data, encoding: .utf8)!
    }
}
