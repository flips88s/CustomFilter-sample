//
//  ViewController.swift
//  CustomFilter-sample
//
//  Created by Shota on 2018/09/11.
//  Copyright © 2018年 Shota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = CIImage(image: UIImage(named: "mona-lisa-74050_1920.jpg")!)
        
        CustomFilterRegister.register()
        
        let filter = CIFilter(name: "CustomFilter")!
        filter.setValue(image, forKey: kCIInputImageKey)
        filter.setValue(2, forKey: kCIInputContrastKey)
        
        imageView.image = UIImage(ciImage: filter.outputImage!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

