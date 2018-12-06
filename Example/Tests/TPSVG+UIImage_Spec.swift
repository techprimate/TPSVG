//
//  TPSVG_UIImage_Spec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

// swiftlint:disable type_name function_body_length cyclomatic_complexity

class TPSVG_UIImage_Spec: QuickSpec {

    override func spec() {
        describe("TPSVG") {

            describe("UIImage") {

                func svgImage(file: String) -> UIImage? {
                    let url = Bundle.main.url(forResource: file, withExtension: "svg")!
                    do {
                        return try TPSVG(data: try Data(contentsOf: url)).image(antialias: false, scale: 1)
                    } catch {
                        fail(error.localizedDescription)
                        fatalError()
                    }
                }

                func referenceImage(file: String) -> UIImage {
                    let url = Bundle.main.url(forResource: file, withExtension: "png")!
                    do {
                        guard let image = UIImage(data: try Data(contentsOf: url)) else {
                            fatalError()
                        }
                        return image
                    } catch {
                        fail(error.localizedDescription)
                        fatalError()
                    }
                }

                func svgPixelError(name: String) -> Double {
                    guard let svg = svgImage(file: name) else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: name)

                    guard svg.size == ref.size else {
                        return 1.0
                    }
                    return svg.pixelError(to: ref)
                }

                it("should render not render empty") {
                    // SVG has no viewbox, therefore size zero and not rendered
                    expect(svgImage(file: "empty")).to(beNil())
                }

                it("should render render file-1") {
                    expect(svgPixelError(name: "file-1-rect")) <= 0.0
                }

                it("should render render file-2") {
                    expect(svgPixelError(name: "file-2-polygon")) <= 0.0001
                }

                it("should render render file-3") {
                    expect(svgPixelError(name: "file-3-polyline")) <= 0.0025
                }

                it("should render render file-4") {
                    expect(svgPixelError(name: "file-4-circle")) <= 0.001
                }

                it("should render render file-5") {
                    expect(svgPixelError(name: "file-5-ellipse")) <= 0.001
                }

                it("should render render file-6") {
                    expect(svgPixelError(name: "file-6-path")) <= 0.0001
                }

                it("should render render file-7") {
//                    expect(svgEqualsRef(name: "file-7-text")) <= 0.0
                }

                it("should render render file-8") {
                    expect(svgPixelError(name: "file-8")) <= 0.0
                }

                it("should render render file-9") {
                    expect(svgPixelError(name: "file-9")) <= 0.0
                }

                it("should render render file-10") {
                    expect(svgPixelError(name: "file-10-tiger")) <= 0.04
                }

                it("should render render file-11") {
                    expect(svgPixelError(name: "file-11-line")) <= 0.001
                }

                it("should render render file-12") {
                    expect(svgPixelError(name: "file-12-ell-arc")) <= 0.005
                }

                it("should render render file-13-icon-01") {
                    expect(svgPixelError(name: "file-13-icon-01")) <= 0.001
                }

                it("should render render file-13-icon-02") {
                    expect(svgPixelError(name: "file-13-icon-02")) <= 0.001
                }

                it("should render render file-13-icon-03") {
                    expect(svgPixelError(name: "file-13-icon-03")) <= 0.001
                }

                it("should render render file-13-icon-04") {
                    expect(svgPixelError(name: "file-13-icon-04")) <= 0.001
                }

                it("should render render file-13-icon-05") {
                    expect(svgPixelError(name: "file-13-icon-05")) <= 0.0002
                }

                it("should render render file-13-icon-06") {
                    expect(svgPixelError(name: "file-13-icon-06")) <= 0.002
                }

                it("should render render file-13-icon-07") {
                    expect(svgPixelError(name: "file-13-icon-07")) <= 0.001
                }

                it("should render render file-13-icon-08") {
                    expect(svgPixelError(name: "file-13-icon-08")) <= 0.001
                }

                it("should render render file-13-icon-09") {
                    expect(svgPixelError(name: "file-13-icon-09")) <= 0.0005
                }

                it("should render render file-14-v-line") {
                    expect(svgPixelError(name: "file-14-v-line")) <= 0.0001
                }

                it("should render render file-15-h-line") {
                    expect(svgPixelError(name: "file-15-h-line")) <= 0.0005
                }

                it("should render inline-01") {
                    expect(svgPixelError(name: "inline-01")) <= 0.0
                }
            }
        }
    }
}
