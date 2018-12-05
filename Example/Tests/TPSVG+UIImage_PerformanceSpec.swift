//
//  TPSVG+UIImage_PerformanceSpec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import XCTest
@testable import TPSVG

class TPSVG_UIImage_PerformanceSpec: XCTestCase {

    var svg: TPSVG!

    override func setUp() {
        let url = Bundle.main.url(forResource: "file-10-tiger", withExtension: "svg")!
        do {
            svg = try TPSVG(data: try Data(contentsOf: url))
        } catch {
            fatalError()
        }
    }

    func testImagePerformance() {
        self.measure {
            let _ = svg.image()
        }
    }

    func testImageResizingPerformance() {
        self.measure {
            let _ = svg.image(size: CGSize(width: 50, height: 50))
        }
    }

    func testImageCropPerformance() {
        self.measure {
            let _ = svg.image(crop: true)
        }
    }
}
