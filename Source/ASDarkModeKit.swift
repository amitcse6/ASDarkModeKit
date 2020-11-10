//
//  DarkModeLib.swift
//  Other-objc
//
//  Created by AMIT on 11/10/20.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
@objc extension UIColor {
    public static func dynamicColor(dark: UIColor, light: UIColor) -> UIColor {
        return UIColor { traitCollection -> UIColor in
            let isDarkMode = traitCollection.userInterfaceStyle == .dark
            if isDarkMode {
                return dark
            } else  {
                return light
            }
        }
    }
    
    public static func dynamicColor(dark: UIColor, light: UIColor, darkHighContrast: UIColor, lightHighContrast: UIColor) -> UIColor {
        return UIColor { traitCollection -> UIColor in
            let isDarkMode = traitCollection.userInterfaceStyle == .dark
            let isHighContrast = traitCollection.accessibilityContrast == .high
            if isDarkMode && !isHighContrast {
                return dark
            } else if isDarkMode && isHighContrast {
                return darkHighContrast
            } else if !isDarkMode && isHighContrast {
                return lightHighContrast
            } else {
                return light
            }
        }
    }
}

@available(iOS 13.0, *)
@objc extension UIImage {
    public static func dynamicImageModified(dark makeDark: @autoclosure () -> UIImage, light makeLight: @autoclosure () -> UIImage) -> UIImage {
        let image = UITraitCollection(userInterfaceStyle: .light).makeImage(makeLight())
        image.imageAsset?.register(makeDark(), with: UITraitCollection(userInterfaceStyle: .dark))
        return image
    }
    
    public static func dynamicImage(dark makeDark: @autoclosure () -> UIImage, light makeLight: @autoclosure () -> UIImage) -> UIImage {
        let imageAsset = UIImageAsset()
        imageAsset.register(makeDark(), with: UITraitCollection(userInterfaceStyle: .dark))
        imageAsset.register(makeLight(), with: UITraitCollection(userInterfaceStyle: .light))
        return imageAsset.image(with: UITraitCollection(traitsFrom: []))
    }
}

@available(iOS 13.0, *)
@objc extension UITraitCollection {
    func makeImage(_ makeImage: @autoclosure () -> UIImage) -> UIImage {
        var image: UIImage!
        performAsCurrent {
            image = makeImage()
        }
        return image
    }
}
