//
//  ListView.swift
//  FriendBook
//
//  Created by Kristoffer Eriksson on 2021-04-01.
//

import SwiftUI

struct ListView: View {
    
    var userList: [User]
    @ObservedObject var userList2: UserList
    
    var body: some View {
        NavigationView{
            
                ScrollView(.vertical){
                    ForEach(userList, id: \.self){ user in
                        NavigationLink(destination: UserDetailView(userList: userList2, user: user)){
                            HStack{
                                
                                //insert circle/image
                                
                                Text(user.name)
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                
                                Spacer()
                                
                                Text(user.isActive ? "Active" : "not Active")
                                    .font(.subheadline)
                                    .foregroundColor(user.isActive ? Color.init( red: 0, green: 1, blue: 0, opacity: 0.75) : Color.init(red: 1, green: 0, blue: 0, opacity: 0.75))
                                
                            }
                            .frame( height: 30)
                            .padding()
                            .background(Color.secondary)
                            .border(Color.black.opacity(0.2), width: 2)
                            .clipShape(Capsule())
                            .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                        }
                    }
                }
            
        }.navigationBarTitle("Users")
    }
}

struct ListView_Previews: PreviewProvider {
    
    static let list = [User]()
    static let userList = UserList()
    
    static var previews: some View {
        ListView(userList: list, userList2: userList)
    }
}
