//
//  ContentView.swift
//  OnePanchManCounter
//
//  Created by Masaharu Hosomichi on 2023/06/27.
//

import SwiftUI

struct Training {
  let name : String
  var count : Int
}

struct ContentView: View {
  @State var flag : Bool = false
  @State var trainings = [
    Training(name: "Push up", count: 0),
    Training(name: "Sit up", count: 0),
    Training(name: "Squat", count: 0)
  ]
  @State var focusOnIndex : Int? = .none
  
  
  var body: some View {
    ZStack{
      Color.black.ignoresSafeArea()
      VStack{
        if let i = focusOnIndex {
          VStack{
            ArrowButton(.left){
              withAnimation(){
                self.focusOnIndex = .none
              }
              
            }
            CounterButton(training: trainings[i]){
              trainings[i].count += 1
            }
          }.transition(.opacity)
        } else {
          ForEach(Array(trainings.enumerated()), id: \.element.name) { (i, t) in
            HStack {
              CounterButton(training: t){
                trainings[i].count += 1
              }
              ArrowButton(.right) {
                withAnimation(){
                  self.focusOnIndex = i
                }
              }
            }
          }
        }
        
        
      }.padding()
    }}
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}





