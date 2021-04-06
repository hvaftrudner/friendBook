//
//  ContentView.swift
//  FriendBook
//
//  Created by Kristoffer Eriksson on 2021-04-01.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userList = UserList()
   
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Welcome to FriendBook")
                    .font(.headline)
                    .foregroundColor(Color.purple.opacity(0.75))
                    .padding()
                
                
                NavigationLink(destination: ListView(userList: userList.userList, userList2: userList)){
                    Text("See Users")
                        .font(.title2)
                        .foregroundColor(Color.red.opacity(0.8))
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userList: UserList())
    }
}
