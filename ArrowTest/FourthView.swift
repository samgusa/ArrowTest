//
//  FourthView.swift
//  ArrowTest
//
//  Created by Sam Greenhill on 10/14/22.
//

import SwiftUI

struct FourthView: View {
  var body: some View {
    ScrollViewHorizontal {
      Rectangle()
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .foregroundColor(.green)
        .padding()
      Rectangle()
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .foregroundColor(.blue)
        .padding()
      Rectangle()
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .foregroundColor(.red)
        .padding()
      Rectangle()
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .foregroundColor(.purple)
        .padding()
      Rectangle()
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .foregroundColor(.orange)
        .padding()
      Rectangle()
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .foregroundColor(.green)
        .padding()
      Rectangle()
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .foregroundColor(.blue)
        .padding()
      Rectangle()
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .foregroundColor(.red)
        .padding()
      Rectangle()
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .foregroundColor(.purple)
        .padding()
      Rectangle()
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .foregroundColor(.orange)
        .padding()
    }
  }
}

struct FourthView_Previews: PreviewProvider {
  static var previews: some View {
    FourthView()
  }
}

struct ScrollViewHorizontal<Content: View>: View {

  @State private var cgTest: CGFloat = 0.0
  @State private var cgTest2: CGFloat = 0.0
  @State private var leadingBool: Bool = false
  @State private var trailingBool: Bool = true
  @State private var scrolling: scrollingEnum = .leading
  var leftArrowType: leftArrowTypes
  var rightArrowType: rightArrowTypes
  let content: () -> Content


  init(
    leftArrowType: leftArrowTypes = .arrowFillLeftCircle,
    rightArrowType: rightArrowTypes = .arrowFillRightCircle,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.leftArrowType = leftArrowType
    self.rightArrowType = rightArrowType
    self.content = content
  }

  var body: some View {
    GeometryReader { geo in
      ScrollView(.horizontal, showsIndicators: false) {
        GeometryReader { geo2 in
          Rectangle()
            .frame(width: 0, height: 0)
            .onAppear(perform: {
              let test = geo2.frame(in: .global).midX
              cgTest2 = test
              let width = geo.size.width
              cgTest = -(test - width)
            })
            .onChange(of: geo2.frame(in: .global).midX) { newValue in

              var arr = Array(stride(from: cgTest, through: cgTest2, by: 1.0))
              arr.removeLast()
              arr.removeFirst()

              arr.map { value in
                if value == newValue {
                  scrolling = .scrolling
                } else if newValue == cgTest {
                  scrolling = .trailing
                } else if newValue == cgTest2 {
                  scrolling = .leading
                }
              }

              switch scrolling {
              case .leading:
                leadingBool = false
                trailingBool = true
              case .trailing:
                leadingBool = true
                trailingBool = false
              case .scrolling:
                leadingBool = true
                trailingBool = true
              }
            }
        }
        .frame(width: 0, height: 0)
        LazyHStack {
          content()
        }
      }
      .overlay {
        ArrowUIView(
          leadingBool: leadingBool,
          trailingBool: trailingBool,
          leftArrowImage: leftArrowType,
          rightArrowImage: rightArrowType
        )
        
      }
    }
  }
}
