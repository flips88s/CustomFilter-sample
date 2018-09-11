//
//  CustomFilter.swift
//  CustomFilter-sample
//
//  Created by Shota on 2018/09/11.
//  Copyright © 2018年 Shota. All rights reserved.
//

import Foundation
import CoreImage

class CustomFilter: CIFilter {
    @objc dynamic var inputImage: CIImage?
    @objc dynamic var inputSaturation: CGFloat = 1
    @objc dynamic var inputBrightness: CGFloat = 0
    @objc dynamic var inputContrast: CGFloat = 1
    
    override func setDefaults() {
        inputSaturation = 1
        inputBrightness = 0
        inputContrast = 1
    }
    
    override var outputImage: CIImage? {
        guard let image = inputImage else {
            return nil
        }
        return image.applyingFilter("CIPhotoEffectProcess")
            .applyingFilter("CIColorControls", parameters: [
                kCIInputSaturationKey: inputSaturation,
                kCIInputBrightnessKey: inputBrightness,
                kCIInputContrastKey: inputContrast
                ])
    }
}

class CustomFilterRegister: CIFilterConstructor {
    
    static func register() {
        CIFilter.registerName(
            "CustomFilter", constructor: CustomFilterRegister(),
            classAttributes: [
                kCIAttributeFilterCategories: ["CICategoryCustomFilter"]
            ])
    }
    
    func filter(withName name: String) -> CIFilter? {
        switch name {
        case "CustomFilter":
            return CustomFilter()
        default:
            return nil
        }
    }
}
