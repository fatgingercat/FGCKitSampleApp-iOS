//
//  Extensions.swift
//  FGCKitSampleApp
//
//  Created by Daniel Bachar on 08/07/2018.
//  Copyright © 2018 FatGingerCat LT. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func imageFromUrl (_ urlString:String) {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) in
            if error != nil { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let d = data else { return }
                let image = UIImage(data: d)
                self?.image = image
            }
            
        }).resume()
    }
}

extension UIImage {
    static func resize(image: UIImage, scale: CGFloat) -> UIImage? {
        //New size according to scale
        let size = image.size.applying(CGAffineTransform(scaleX: scale, y: scale))
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        // Actually do the resizing to the rect using the ImageContext stuff
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)//0.0 -> Automatically use scale factor of main screen
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
