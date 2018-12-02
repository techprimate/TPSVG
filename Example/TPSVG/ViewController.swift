//
//  ViewController.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 18.11.2018.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import UIKit
import TPSVG

class ViewController: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            if let path = Bundle.main.path(forResource: "file-12-ell-arc", ofType: "png") {
                leftImageView.image = UIImage(contentsOfFile: path)
            }
            if let url = Bundle.main.url(forResource: "file-12-ell-arc", withExtension: "svg") {
                rightImageView.image = try TPSVG(contentsOf: url).image()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
