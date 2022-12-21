import SwiftUI

enum leftArrowTypes {
  
  case basicArrowLeft
  case arrowLeftCircle
  case arrowLeftSquare
  case arrowFillLeftCircle
  case arrowFillLeftSquare
  case arrowTriangleLeft
  case arrowFillTriAngleLeft

  var leftArrow: String {
    switch self {
    case .basicArrowLeft:
      return "arrow.left"
    case .arrowLeftCircle:
      return "arrow.left.circle"
    case .arrowLeftSquare:
      return "arrow.left.square"
    case .arrowFillLeftCircle:
      return "arrow.left.circle.fill"
    case .arrowFillLeftSquare:
      return "arrow.left.square.fill"
    case .arrowTriangleLeft:
      return "arrowtriangle.left"
    case .arrowFillTriAngleLeft:
      return "arrowtriangle.left.fill"
    }
  }
}

enum rightArrowTypes {
  case basicArrowRight
  case arrowRightCircle
  case arrowRightSquare
  case arrowFillRightCircle
  case arrowFillRightSquare
  case arrowTriangleRight
  case arrowFillTriangleRight

  var rightArrow: String {
    switch self {
    case .basicArrowRight:
      return "arrow.right"
    case .arrowRightCircle:
      return "arrow.right.circle"
    case .arrowRightSquare:
      return "arrow.right.square"
    case .arrowFillRightCircle:
      return "arrow.right.circle.fill"
    case .arrowFillRightSquare:
      return "arrow.right.square.fill"
    case .arrowTriangleRight:
      return "arrowtriangle.right"
    case .arrowFillTriangleRight:
      return "arrowtriangle.right.fill"
    }
  }
}


struct ArrowUIView: View {

  var leadingBool: Bool
  var trailingBool: Bool
  var leftArrowImage: leftArrowTypes
  var rightArrowImage: rightArrowTypes

  var body: some View {
    HStack {
      Image(systemName: leftArrowImage.leftArrow)
        .resizable()
        .frame(width: 50, height: 50)
        .opacity(leadingBool ? 0.5 : 0.0)
        .animation(.easeInOut, value: leadingBool)

      Color.clear

      Image(systemName: rightArrowImage.rightArrow)
        .resizable()
        .frame(width: 50, height: 50)
        .opacity(trailingBool ? 0.5 : 0.0)
        .animation(.easeInOut, value: trailingBool)

    }
    .padding(2)
  }
}

struct ArrowUIView_Previews: PreviewProvider {
  static var previews: some View {
    ArrowUIView(
      leadingBool: false,
      trailingBool: true,
      leftArrowImage: .arrowFillLeftCircle,
      rightArrowImage: .arrowFillRightCircle
    )
  }
}
