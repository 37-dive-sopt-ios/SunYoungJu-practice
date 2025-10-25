//
//  UIFont+.swift
//  SOPT37_Seminar
//
//  Created by sun on 10/11/25.
//

import UIKit

enum PretendardWeight: String {
    case black = "Black"
    case extraBold = "ExtraBold"
    case bold = "Bold"
    case semiBold = "SemiBold"
    case medium = "Medium"
    case regular = "Regular"
    case light = "Light"
    case extraLight = "ExtraLight"
    case thin = "Thin"
}

extension UIFont {
    static func pretendard(_ weight: PretendardWeight = .regular, size fontSize: CGFloat) -> UIFont {
        let name = "Pretendard-\(weight.rawValue)"
        return UIFont(name: name, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
}
