import SwiftUI

struct CircleProgressBar: View {
  let count: Int
  let maxCount : CGFloat = 100
  private var progress : CGFloat {
    CGFloat(min(count, 100)) / maxCount
  }
  var body: some View {
    ZStack() {
      Circle()
        .stroke(lineWidth: 24)
        .opacity(0.3)
        .foregroundColor(.green)
      Circle()
        .trim(from: 0.0, to: min(progress, 1.0))
        .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round, lineJoin: .round))

        .foregroundColor(.green)
        .rotationEffect(Angle(degrees: 270.0))
      if (count >= Int(maxCount)) {
        Image(systemName: "checkmark.circle")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .padding(20)
          .foregroundColor(.blue)
      }
    }.padding()
  }
}

struct CircleProgressBar_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      CircleProgressBar(count: 25)
      CircleProgressBar(count: 100)
    }
  }
}
