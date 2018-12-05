//
//  TPSVG_UIImage_Cropping_Spec.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

// swiftlint:disable type_name function_body_length cyclomatic_complexity

class TPSVG_UIImage_Cropping_Spec: QuickSpec {

    override func spec() {
        describe("TPSVG") {

            describe("UIImage") {

                describe("resizing and cropping") {

                    it("should resize image") {
                        let svgUrl = Bundle.main.url(forResource: "file-13-icon-08", withExtension: "svg")!
                        let refUrl = Bundle.main.url(forResource: "file-13-icon-08_resized", withExtension: "png")!
                        do {
                            guard let resizedImage = try TPSVG(data: try Data(contentsOf: svgUrl)).image(size: CGSize(width: 100, height: 100), antialias: false) else {
                                fatalError()
                            }
                            guard let refImage = UIImage(data: try Data(contentsOf: refUrl)) else {
                                fatalError()
                            }
                            expect(resizedImage.size) == refImage.size
                            expect(resizedImage.pixelError(to: refImage)) < 0.1

                            try resizedImage.pngData()?.write(to: URL(fileURLWithPath: "/Users/Philip/Desktop/file-13-path.png"))
                            try refImage.pngData()?.write(to: URL(fileURLWithPath: "/Users/Philip/Desktop/file-13-path_resized.png"))
                        } catch {
                            fail(error.localizedDescription)
                            fatalError()
                        }
                    }

                    it("should crop image") {
                        let svgUrl = Bundle.main.url(forResource: "file-4-circle", withExtension: "svg")!
                        let refUrl = Bundle.main.url(forResource: "file-4-circle_cropped", withExtension: "png")!
                        do {
                            guard let resizedImage = try TPSVG(data: try Data(contentsOf: svgUrl)).image(crop: true, antialias: false) else {
                                fatalError()
                            }
                            guard let refImage = UIImage(data: try Data(contentsOf: refUrl)) else {
                                fatalError()
                            }
                            expect(resizedImage.size) == refImage.size
                            expect(resizedImage.pixelError(to: refImage)) == 0

                            try resizedImage.pngData()?.write(to: URL(fileURLWithPath: "/Users/Philip/Desktop/file-4-circle.png"))
                            try refImage.pngData()?.write(to: URL(fileURLWithPath: "/Users/Philip/Desktop/file-4-circle_cropped.png"))
                        } catch {
                            fail(error.localizedDescription)
                            fatalError()
                        }
                    }

                    it("should crop and resize image") {
                        let svgUrl = Bundle.main.url(forResource: "file-6-path", withExtension: "svg")!
                        let refUrl = Bundle.main.url(forResource: "file-6-path_resized_cropped", withExtension: "png")!
                        do {
                            guard let resizedImage = try TPSVG(data: try Data(contentsOf: svgUrl)).image(size: CGSize(width: 250, height: 209), crop: true, antialias: false) else {
                                fatalError()
                            }
                            guard let refImage = UIImage(data: try Data(contentsOf: refUrl)) else {
                                fatalError()
                            }
                            expect(refImage.size) == resizedImage.size
                            expect(resizedImage.pixelError(to: refImage)) < 0.01

                            try resizedImage.pngData()?.write(to: URL(fileURLWithPath: "/Users/Philip/Desktop/file-6-path.png"))
                            try refImage.pngData()?.write(to: URL(fileURLWithPath: "/Users/Philip/Desktop/file-6-path_resized_cropped.png"))
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
