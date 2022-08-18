//
//  NiceText.swift
//  
//
//  Created by Alejandro Zielinsky on 2022-06-09.
//

import SwiftUI

public protocol NiceText: View {

    var text: AttributedString { get }
    var style: TypeStyle { get }
    static var defaultStyle: TypeStyle { get }

    init(_ attributedText: AttributedString, style: TypeStyle?)

    init(_ text: String, style: TypeStyle?)

    init(_ text: String, color: Color?, size: CGFloat?, lineLimit: Int?, dynamicMaxSize: CGFloat?)

    init(_ text: String, color: Color?, size: CGFloat?, lineLimit: Int?, dynamicMaxSize: CGFloat?, configure: (inout AttributedString) -> Void)
}

public extension NiceText {

    init(
        _ text: String,
        color: Color? = nil,
        size: CGFloat? = nil,
        lineLimit: Int? = nil,
        dynamicMaxSize: CGFloat? = nil
    ) {
        self.init(
            text,
            style: Self.defaultStyle.with(
                color: color,
                size: size,
                lineLimit: lineLimit,
                dynamicTypeMaxSize: dynamicMaxSize
            )
        )
    }

    init(_ text: String, style: TypeStyle?) {
        self.init(AttributedString(text), style: style)
    }

    init(
        _ text: String,
        color: Color? = nil,
        size: CGFloat? = nil,
        lineLimit: Int? = nil,
        dynamicMaxSize: CGFloat? = nil,
        configure: (inout AttributedString) -> Void
    ) {
        var attributedString = AttributedString(text)
        configure(&attributedString)
        self.init(attributedString, style: Self.defaultStyle.with(
            color: color,
            size: size,
            lineLimit: lineLimit,
            dynamicTypeMaxSize: dynamicMaxSize
        ))
    }
}

