//
//  ContentView.swift
//  ArrowTest
//
//  Created by Sam Greenhill on 10/11/22.
//

import SwiftUI

enum scrollingEnum {
  case leading
  case scrolling
  case trailing
}

struct ContentView: View {

  @State private var defaultX: CGFloat = 0.0
  @State private var leadingBool: Bool = false
  @State private var trailingBool: Bool = true
  @State private var scrolling: scrollingEnum = .leading

  var body: some View {
    ScrollView(.horizontal) {
      GeometryReader { geo in

        Rectangle()
          .frame(width: 0, height: 0)
          .onAppear(perform: {
            let offset = geo.frame(in: .named("scroll")).minX
            print(offset)
            defaultX = geo.frame(in: .global).midX
            print(geo.frame(in: .global).minX)
          })
          .onChange(of: geo.frame(in: .global).midX) { midX in
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
            if defaultX > midX {
              scrolling = .scrolling
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
          .onAppear {
            scrolling = .leading
          }
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
          .onAppear {
            scrolling = .trailing
          }
      }
    }
    .coordinateSpace(name: "scroll")
    .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in

      print("VALUE: \(value)")

    }
    .overlay {
      ArrowUIView(leadingBool: leadingBool, trailingBool: trailingBool, leftArrowImage: .arrowFillLeftCircle, rightArrowImage: .arrowFillRightCircle)
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey {

  static var defaultValue = CGFloat.zero

  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}
