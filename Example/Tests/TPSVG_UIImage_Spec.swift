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
                        return try TPSVG(data: try Data(contentsOf: url)).image()
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

                it("should render not render empty") {
                    // SVG has no viewbox, therefore size zero and not rendered
                    expect(svgImage(file: "empty")).to(beNil())
                }

                it("should render render file-1") {
                    guard let svg = svgImage(file: "file-1-rect") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-1-rect")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-2") {
                    guard let svg = svgImage(file: "file-2-polygon") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-2-polygon")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-3") {
                    guard let svg = svgImage(file: "file-3-polyline") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-3-polyline")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-4") {
                    guard let svg = svgImage(file: "file-4-circle") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-4-circle")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-5") {
                    guard let svg = svgImage(file: "file-5-ellipse") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-5-ellipse")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-6") {
                    guard let svg = svgImage(file: "file-6-path") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-6-path")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-7") {
                    guard let svg = svgImage(file: "file-7-text") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-7-text")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-8") {
                    guard let svg = svgImage(file: "file-8") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-8")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-9") {
                    guard let svg = svgImage(file: "file-9") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-9")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-10") {
                    guard let svg = svgImage(file: "file-10-tiger") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-10-tiger")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-11") {
                    guard let svg = svgImage(file: "file-11-line") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-11-line")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-12") {
                    guard let svg = svgImage(file: "file-12-ell-arc") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-12-ell-arc")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-13-icon-01") {
                    guard let svg = svgImage(file: "file-13-icon-01") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-13-icon-01")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-13-icon-02") {
                    guard let svg = svgImage(file: "file-13-icon-02") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-13-icon-02")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-13-icon-03") {
                    guard let svg = svgImage(file: "file-13-icon-03") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-13-icon-03")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-13-icon-04") {
                    guard let svg = svgImage(file: "file-13-icon-04") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-13-icon-04")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-13-icon-05") {
                    guard let svg = svgImage(file: "file-13-icon-05") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-13-icon-05")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-13-icon-06") {
                    guard let svg = svgImage(file: "file-13-icon-06") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-13-icon-06")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-13-icon-07") {
                    guard let svg = svgImage(file: "file-13-icon-07") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-13-icon-07")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-13-icon-08") {
                    guard let svg = svgImage(file: "file-13-icon-08") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-13-icon-08")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }

                it("should render render file-13-icon-09") {
                    guard let svg = svgImage(file: "file-13-icon-09") else {
                        fail("Image should not be null!")
                        fatalError()
                    }
                    let ref = referenceImage(file: "file-13-icon-09")

                    expect(svg.size) == ref.size
                    expect(svg.pixelsEqual(to: ref)).to(beTrue())
                }
            }
        }
    }
}
