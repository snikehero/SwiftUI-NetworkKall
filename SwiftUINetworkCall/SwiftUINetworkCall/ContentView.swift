//
//  ContentView.swift
//  SwiftUINetworkCall
//
//  Created by Moises Sanchez on 20/02/24.
//

import SwiftUI
//Step 1: Create Dummy UI
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .foregroundColor(.secondary)
                .frame(width: 120, height: 120)
            
            Text("Username")
                .bold()
                .font(.title3)
            
            Text("This is where the github bio will go. Lets make it long so it spans two lines.")
                .padding()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
