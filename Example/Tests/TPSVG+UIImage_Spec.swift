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
                        return try TPSVG(data: try Data(contentsOf: url)).image(antialias: false)
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

                func svgEqualsRef(name: String) -> Bool {
                    guard let svg = svgImage(file: name) else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: name)

                    guard svg.size == ref.size else {
                        return false
                    }
                    return svg.pixelsEqual(to: ref)
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
                    expect(svgEqualsRef(name: "file-1-rect")).to(beTrue())
                }

                it("should render render file-2") {
                    expect(svgEqualsRef(name: "file-2-polygon")).to(beTrue())
                }

                it("should render render file-3") {
                    expect(svgEqualsRef(name: "file-3-polyline")).to(beTrue())
                }

                it("should render render file-4") {
                    expect(svgEqualsRef(name: "file-4-circle")).to(beTrue())
                }

                it("should render render file-5") {
                    expect(svgEqualsRef(name: "file-5-ellipse")).to(beTrue())
                }

                it("should render render file-6") {
                    expect(svgEqualsRef(name: "file-6-path")).to(beTrue())
                }

                it("should render render file-7") {
//                    expect(svgEqualsRef(name: "file-7-text")).to(beTrue())
                }

                it("should render render file-8") {
                    expect(svgEqualsRef(name: "file-8")).to(beTrue())
                }

                it("should render render file-9") {
                    expect(svgEqualsRef(name: "file-9")).to(beTrue())
                }

                it("should render render file-10") {
                    expect(svgPixelError(name: "file-10-tiger")) < 0.01
                }

                it("should render render file-11") {
                    expect(svgEqualsRef(name: "file-11-line")).to(beTrue())
                }

                it("should render render file-12") {
                    expect(svgEqualsRef(name: "file-12-ell-arc")).to(beTrue())
                }

                it("should render render file-13-icon-01") {
                    expect(svgEqualsRef(name: "file-13-icon-01")).to(beTrue())
                }

                it("should render render file-13-icon-02") {
                    expect(svgEqualsRef(name: "file-13-icon-02")).to(beTrue())
                }

                it("should render render file-13-icon-03") {
                    expect(svgEqualsRef(name: "file-13-icon-03")).to(beTrue())
                }

                it("should render render file-13-icon-04") {
                    expect(svgEqualsRef(name: "file-13-icon-04")).to(beTrue())
                }

                it("should render render file-13-icon-05") {
                    expect(svgEqualsRef(name: "file-13-icon-05")).to(beTrue())
                }

                it("should render render file-13-icon-06") {
                    expect(svgEqualsRef(name: "file-13-icon-06")).to(beTrue())
                }

                it("should render render file-13-icon-07") {
                    expect(svgEqualsRef(name: "file-13-icon-07")).to(beTrue())
                }

                it("should render render file-13-icon-08") {
                    expect(svgEqualsRef(name: "file-13-icon-08")).to(beTrue())
                }

                it("should render render file-13-icon-09") {
                    expect(svgEqualsRef(name: "file-13-icon-09")).to(beTrue())
                }

                it("should render render file-14-v-line") {
                    expect(svgEqualsRef(name: "file-14-v-line")).to(beTrue())
                }

                it("should render render file-15-h-line") {
                    expect(svgEqualsRef(name: "file-15-h-line")).to(beTrue())
                }

                it("should render inline-01") {
                    expect(svgEqualsRef(name: "inline-01")).to(beTrue())
                }
            }
        }
    }
}
