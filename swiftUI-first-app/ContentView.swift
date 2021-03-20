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
    
    @State var showAlert = false
    
    func computeScore() -> Int {
      let rDiff = rGuess - rTarget
      let gDiff = gGuess - gTarget
      let bDiff = bGuess - bTarget
      let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
      return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Color(red: rTarget, green: gTarget, blue: bTarget)
                        self.showAlert ? Text("R: \(Int(rTarget * 255.0))"
                          + "  G: \(Int(gTarget * 255.0))"
                          + "  B: \(Int(bTarget * 255.0))")
                          : Text("Match this color")
                    }
                    VStack {
                        ZStack {
                            Color(red: rGuess, green: gGuess, blue: bGuess)
                            Text("60")
                                .padding(.all,5)
                                .background(Color.white)
                                .mask(Circle())
                        }
                        Text("R:\(Int(rGuess*255))"
                            + " G:\(Int(gGuess*255))"
                            + " G:\(Int(bGuess*255))")
                    }
                }
                Button(action: {
                    self.showAlert = true
                }, label: {
                    Text("Hit me!")
                }).alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Your Score"),message: Text(String(computeScore())))
                }).padding()
                
                ColorSlider(value: $rGuess, textColor: .red)
                ColorSlider(value: $gGuess, textColor: .green)
                ColorSlider(value: $bGuess, textColor: .blue)
            }.navigationTitle("猜颜色")
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
    
    // @Binding可以传给@Binding,是间接修改,和双向修改. @State属性是直接修改.且单向.
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
                .background(textColor)
                .cornerRadius(10)//background和cornerRadius顺序不能调换,会影响整个view.
                .foregroundColor(.white)
                .accentColor(.white)
            Text("255").foregroundColor(textColor)
        }.padding(.horizontal)
    }
}
