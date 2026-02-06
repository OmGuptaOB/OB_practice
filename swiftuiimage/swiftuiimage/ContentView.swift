//
//  ContentView.swift
//  swiftuiimage
//
//  Created by OBMac-13 on 05/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("helloo world")
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }.padding()
       
    }
}

#Preview {
    ContentView()
}
