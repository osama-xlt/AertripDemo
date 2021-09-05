//
//  ImageExtension.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 04/09/21.
//

import UIKit

extension UIImage {
    func createSelectionIndicator(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: size.height - 5, width: size.width, height: 5))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
