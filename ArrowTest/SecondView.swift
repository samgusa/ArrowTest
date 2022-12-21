//
//  SecondView.swift
//  ArrowTest
//
//  Created by Sam Greenhill on 10/12/22.
//

import SwiftUI

struct SecondView: View {

  @State private var leadingBool: Bool = false
  @State private var trailingBool: Bool = true
  @State private var testBool: Bool = false
  @State private var offsetTest: CGFloat = 0.0
  @State private var offsetTest2: CGFloat = 0.0
  @State private var scrolling: scrollingEnum = .leading

  var body: some View {
    ScrollViewOffset(onOffsetChange: { (offset) in
      guard testBool == true else { return }
      print("Offset \(offset)")
      //offsetTest = offset
//      if offset < 0 && scrolling != .trailing {
//        scrolling = .scrolling
//      }
      //print("New ScrollView offset: \(offset)")

    }) {
      GeometryReader { geo in

        Rectangle()
          .frame(width: 0, height: 0)
          .onAppear(perform: {

          })
          .onChange(of: geo.frame(in: .global).midX) { newValue in
            
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
    .overlay {
      ArrowUIView(leadingBool: leadingBool, trailingBool: trailingBool, leftArrowImage: .arrowFillLeftCircle, rightArrowImage: .arrowFillRightCircle)
    }
  }
}

struct SecondView_Previews: PreviewProvider {
  static var previews: some View {
    SecondView()
  }
}

struct ScrollViewOffset<Content: View>: View {
  let onOffsetChange: (CGFloat) -> Void
  let content: () -> Content

  init(
    onOffsetChange: @escaping (CGFloat) -> Void,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.onOffsetChange = onOffsetChange
    self.content = content
  }

  var body: some View {
    ScrollView(.horizontal) {
      offsetReader
      content()
        .padding(.top, -8)
    }
    .coordinateSpace(name: "frameLayer")
    .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange)
  }

  var offsetReader: some View {
    GeometryReader { proxy in
      Color.clear
        .preference(
          key: OffsetPreferenceKey.self,
          value: proxy.frame(in: .named("frameLayer")).minX
        )
    }
    .frame(height: 0)
  }
}

private struct OffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}
