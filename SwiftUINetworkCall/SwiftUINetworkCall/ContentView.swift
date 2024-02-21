//
//  ContentView.swift
//  SwiftUINetworkCall
//
//  Created by Moises Sanchez on 20/02/24.
//

import SwiftUI
//Step 1: Create Dummy UI
struct ContentView: View {
    @State private var user: GitHuberUser?
    var network: NetworkCall = NetworkCall()
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user?.avatar_url ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }                   
            .frame(width: 120, height: 120)
            
            Text(user?.login ?? "Login PlaceHolder")
                .bold()
                .font(.title3)
            
            Text(user?.bio ?? "Bio PlaceHolder")
                .padding()
            Spacer()
        }
        .padding()
        .task {
            do {
                user = try await network.getUser()
            } catch GHError.invalidURL {
                print("Invalid URL")
            } catch GHError.invalidResponse {
                print("Invalid response")
            } catch GHError.invalidData {
                print("Invalid Data")
            } catch {
                print("Unexpected error")
            }
        }
    }
}

#Preview {
    ContentView()
}
