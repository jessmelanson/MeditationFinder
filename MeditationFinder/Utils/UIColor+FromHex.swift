//
//  UIColor+hex.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/23/21.
//  The base code is from https://www.iosapptemplates.com/blog/swift-programming/convert-hex-colors-to-uicolor-swift-4
//  with a few modifications to remove deprecated functions

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hex: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        hex.remove(at: hex.startIndex)
        let scanner = Scanner(string: hex)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
