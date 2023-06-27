//
//  CounterButton.swift
//  OnePanchManCounter
//
//  Created by Masaharu Hosomichi on 2023/06/27.
//

import SwiftUI

struct CounterButton: View {
  let training : Training
  var bgColor : UIColor = .black
  let action : () -> Void
  
  
  
  var body: some View {
    ZStack {
      Color(bgColor)
      CircleProgressBar(count: training.count)
      HStack(spacing: 10)
      {
        Button(action: action){
          VStack{
            Text(training.name)
              .foregroundColor(.white)
              .font(.title)
            Text(String(format: "%03d", training.count))
              .foregroundColor(.white)
              .font(.system(size: 60))
          }.frame(
            maxWidth: .infinity,
            maxHeight: .infinity
          )
        }
      }
    }
  }
}

struct CounterButton_Previews: PreviewProvider {
  static var previews: some View {
    CounterButton(training: Training(name: "Training Name", count: 10)) {}
      .previewLayout(.sizeThatFits)
  }
}
