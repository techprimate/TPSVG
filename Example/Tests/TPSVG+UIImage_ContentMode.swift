//
//  TPSVG+UIImage_ContentMode.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 03.02.19.
//  Copyright © 2019 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

// swiftlint:disable type_name function_body_length cyclomatic_complexity

class TPSVG_UIImage_ContentMode_Spec: QuickSpec {

    override func spec() {
        describe("TPSVG") {

            describe("UIImage") {

                describe("scale aspect fit") {

                    it("should resize image") {
                        let svgUrl = Bundle.main.url(forResource: "file-16-chevron-left", withExtension: "svg")!
                        let refUrl = Bundle.main.url(forResource: "file-16-chevron-left", withExtension: "png")!
                        do {
                            guard let resizedImage = try TPSVG(data: try Data(contentsOf: svgUrl)).image(size: CGSize(width: 200, height: 100), contentMode: .scaleAspectFit, antialias: false, scale: 1) else {
                                fatalError()
                            }
                            guard let refImage = UIImage(data: try Data(contentsOf: refUrl)) else {
                                fatalError()
                            }
                            expect(resizedImage.size) == refImage.size
                            expect(resizedImage.pixelError(to: refImage)) < 0.1
                        } catch {
                            fail(error.localizedDescription)
                            fatalError()
                        }
                    }
                }
            }
        }
    }
}

