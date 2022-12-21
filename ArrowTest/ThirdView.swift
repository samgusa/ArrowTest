//
//  ThirdView.swift
//  ArrowTest
//
//  Created by Sam Greenhill on 10/13/22.
//

import SwiftUI

struct ThirdView: View {

  @State private var cgTest: CGFloat = 0.0
  @State private var cgTest2: CGFloat = 0.0
  @State private var testBool: Bool = false
  @State private var leadingBool: Bool = false
  @State private var trailingBool: Bool = true
  @State private var scrolling: scrollingEnum = .leading

  var body: some View {
    GeometryReader { geo in
      ScrollView(.horizontal) {
        GeometryReader { geo2 in

          Rectangle()
            .frame(width: 0, height: 0)
            .onAppear(perform: {
              let test = geo2.frame(in: .global).midX
              cgTest2 = test
              let width = geo.size.width
              cgTest = -(test - width)
              print(cgTest)
              print(cgTest2)

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
        .border(Color.red)
        LazyHStack {
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
      .overlay {
        ArrowUIView(leadingBool: leadingBool, trailingBool: trailingBool, leftArrowImage: .arrowFillLeftCircle, rightArrowImage: .arrowFillRightCircle)
      }
    }
  }
}

struct ThirdView_Previews: PreviewProvider {
  static var previews: some View {
    ThirdView()
  }
}



