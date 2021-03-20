//
//  ContentView.swift
//  swiftUI-first-app
//
//  Created by smilemike on 2021/3/15.
//

import SwiftUI

struct ContentView: View {
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match this color")
                }
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                    Text("R:\(Int(rGuess*255))"
                        + " G:\(Int(gGuess*255))"
                        + " G:\(Int(bGuess*255))")
                }
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Hit me!")
            })
            
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $rGuess, textColor: .green)
            ColorSlider(value: $rGuess, textColor: .blue)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.7, gGuess: 0.3, bGuess: 0.6)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

struct ColorSlider: View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }.padding(.horizontal)
    }
}
