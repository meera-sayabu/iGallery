//
//  UIScreen+Extension.swift
//  UtilityKit
//
//  Created by MeeraSayabu N on 07/01/24.
//

import Foundation
import UIKit

/// An extension providing additional properties related to the screen dimensions.
public extension UIScreen {
    
    /// The width of the main screen.
    static let screenWidth = UIScreen.main.bounds.size.width
    
    /// The height of the main screen.
    static let screenHeight = UIScreen.main.bounds.size.height
    
    /// The size of the main screen.
    static let screenSize = UIScreen.main.bounds.size
}

