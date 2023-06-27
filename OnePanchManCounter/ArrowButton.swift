//
//  ArrowButton.swift
//  OnePanchManCounter
//
//  Created by Masaharu Hosomichi on 2023/06/27.
//

import SwiftUI

struct ArrowButton: View {
  init(_ direction: Direction, action: @escaping () -> Void){
    self.direction = direction
    self.dirImage = "chevron." +  (self.direction == .left ? "left" : "right") + ".circle"
    self.action = action
  }
  
  enum Direction {
    case right
    case left
  }
  
  let action : () -> Void
  let direction : Direction
  let dirImage : String
  
  
  var body : some View {
    Button(action: action){
      Image(systemName: dirImage)
        .resizable()
        .frame(width: 50, height: 50)
    }
  }
}

struct ArrowButton_Previews: PreviewProvider {
    static var previews: some View {
      HStack{
        ArrowButton(.right) {
          print("hello")
        }
        ArrowButton(.left) {}
      }.previewLayout(.fixed(width: 100, height: 100))
      
    }
}
