//
//  User.swift
//  FriendBook
//
//  Created by Kristoffer Eriksson on 2021-04-01.
//

import Foundation

class UserList: ObservableObject {
    
    
    @Published var userList: [User]
    
    enum CodingKeys: CodingKey{
        case userList
    }
    
    init(){
        
        self.userList = [User]()
        
        print(self.userList)
        
        if self.userList.isEmpty {
            //force unwrap because it is hardtyped
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request){ data, response, error in
                
                guard let data = data else {
                    print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                DispatchQueue.main.async {
                    if let decodedData = try? JSONDecoder().decode([User].self, from: data){
                        
                        self.userList = decodedData
                        print("successful fetch")
                        
                    } else {
                        print("failed to init data")
                    }
                }
                
            }.resume()
            
            print(self.userList)
        } else {
            print("has stored info")
        }
            
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userList, forKey: .userList)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userList = try container.decode([User].self, forKey: .userList)
    }
}

struct User: Codable, Hashable {
    
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    
    var friends: [Friend]
    
}
