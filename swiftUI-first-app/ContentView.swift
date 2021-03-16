//
//  ContentView.swift
//  swiftUI-first-app
//
//  Created by smilemike on 2021/3/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Color(red: 0.5, green: 0.5, blue: 0.5)
                Text("Hello, world!")
                    .padding()
            }
            VStack {
                Color(red: 0.5, green: 0.5, blue: 0.5)
                Text("Hello, world!")
                    .padding()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
