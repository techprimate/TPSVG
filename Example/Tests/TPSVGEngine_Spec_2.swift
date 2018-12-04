//
//  TPSVGEngine_Spec_2.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 03.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

class TPSVGEngine_Spec_2: QuickSpec {

    override func spec() {
        describe("TPSVGEngine") {

            func parse(file: String) -> TPSVGEngine {
                let url = Bundle.main.url(forResource: file, withExtension: "svg")!
                var data: Data!
                do {
                    data = try Data(contentsOf: url)
                } catch {
                    fail(error.localizedDescription)
                    fatalError()
                }

                let engine = TPSVGEngine()
                engine.parse(data)
                return engine
            }

            it("can parse file-10-tiger") {
                let engine = parse(file: "file-10-tiger")

                let expectedStyles = [
                    TPSVGStyle(name: ".a", fill: UIColor.white, stroke: TPSVGStroke(color: UIColor.black, width: 0.17)),
                    TPSVGStyle(name: ".aa", fill: UIColor(hex: 0xea8e51)),
                    TPSVGStyle(name: ".ab", fill: UIColor(hex: 0xefaa7c)),
                    TPSVGStyle(name: ".ac", fill: UIColor(hex: 0xf4c6a8)),
                    TPSVGStyle(name: ".ad", fill: UIColor(hex: 0xf9e2d3)),
                    TPSVGStyle(name: ".ae", fill: UIColor(hex: 0x99cc32)),
                    TPSVGStyle(name: ".af", fill: UIColor(hex: 0x659900)),
                    TPSVGStyle(name: ".ag", fill: UIColor(hex: 0xeb955c)),
                    TPSVGStyle(name: ".ah", fill: UIColor(hex: 0xf2b892)),
                    TPSVGStyle(name: ".ai", fill: UIColor(hex: 0xf8dcc8)),
                    TPSVGStyle(name: ".aj", fill: UIColor(hex: 0x323232)),
                    TPSVGStyle(name: ".ak", fill: UIColor(hex: "#666")),
                    TPSVGStyle(name: ".al", fill: UIColor(hex: "#999")),
                    TPSVGStyle(name: ".am", fill: UIColor(hex: 0x992600)),
                    TPSVGStyle(name: ".an", fill: UIColor.clear, stroke: TPSVGStroke(color: UIColor(hex: 0x4c0000), width: 2.0)),
                    TPSVGStyle(name: ".ao", fill: UIColor(hex: 0x4c0000)),
                    TPSVGStyle(name: ".ap", fill: UIColor(hex: 0xe59999)),
                    TPSVGStyle(name: ".aq", fill: UIColor(hex: 0xb26565)),
                    TPSVGStyle(name: ".ar", fill: UIColor.white, stroke: TPSVGStroke(color: UIColor.black, width: 0.1)),
                    TPSVGStyle(name: ".as", fill: UIColor.clear, stroke: TPSVGStroke(color: UIColor.black)),
                    TPSVGStyle(name: ".b", fill: UIColor.white, stroke: TPSVGStroke(color: UIColor.black)),
                    TPSVGStyle(name: ".c", fill: UIColor(hex: 0xcc7226), stroke: TPSVGStroke(color: UIColor.black)),
                    TPSVGStyle(name: ".d", fill: UIColor(hex: 0xcc7226)),
                    TPSVGStyle(name: ".e", fill: UIColor(hex: 0xe87f3a)),
                    TPSVGStyle(name: ".f", fill: UIColor(hex: 0xea8c4d)),
                    TPSVGStyle(name: ".g", fill: UIColor(hex: 0xec9961)),
                    TPSVGStyle(name: ".h", fill: UIColor(hex: 0xeea575)),
                    TPSVGStyle(name: ".i", fill: UIColor(hex: 0xf1b288)),
                    TPSVGStyle(name: ".j", fill: UIColor(hex: 0xf3bf9c)),
                    TPSVGStyle(name: ".k", fill: UIColor(hex: 0xf5ccb0)),
                    TPSVGStyle(name: ".l", fill: UIColor(hex: 0xf8d8c4)),
                    TPSVGStyle(name: ".m", fill: UIColor(hex: 0xfae5d7)),
                    TPSVGStyle(name: ".n", fill: UIColor(hex: 0xfcf2eb)),
                    TPSVGStyle(name: ".o", fill: UIColor.white),
                    TPSVGStyle(name: ".p", fill: UIColor(hex: "#ccc")),
                    TPSVGStyle(name: ".q", fill: UIColor(hex: 0xe5668c)),
                    TPSVGStyle(name: ".r", fill: UIColor(hex: 0xb23259)),
                    TPSVGStyle(name: ".s", fill: UIColor(hex: 0xa5264c)),
                    TPSVGStyle(name: ".t", fill: UIColor(hex: 0xff727f), stroke: TPSVGStroke(color: UIColor.black)),
                    TPSVGStyle(name: ".u", fill: UIColor(hex: "#ffc"), stroke: TPSVGStroke(color: UIColor.black, width: 0.5)),
                    TPSVGStyle(name: ".v", fill: UIColor(hex: 0xcc3f4c)),
                    TPSVGStyle(name: ".w", fill: UIColor.clear, stroke: TPSVGStroke(color: UIColor(hex: 0x0a51926), width: 2)),
                    TPSVGStyle(name: ".x", fill: UIColor.clear, stroke: TPSVGStroke(color: UIColor(hex: 0xa5264c), width: 2)),
                    TPSVGStyle(name: ".y", fill: UIColor(hex: 0xb2b2b2)),
                    TPSVGStyle(name: ".z", fill: UIColor(hex: 0xe5e5b2))
                ]
                expect(engine.styles).to(haveCount(expectedStyles.count))
                expect(engine.styles).to(contain(expectedStyles))
                // Elements not tested --> Pixel testing
            }

            it("can parse file-12") {
                let engine = parse(file: "file-12-ell-arc")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: .clear, stroke: TPSVGStroke(color: .black, width: 8, miterLimit: 10))
                    ]))
                expect(engine.elements) == [
                    TPSVGPath(classNames: ["st0"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 100, y: 200)),
                        TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 70, dy: 50),
                                                     xAxisRotation: 10,
                                                     largeArcFlag: false,
                                                     sweepFlag: false,
                                                     end: CGPoint(x: 200, y: 250))
                        ]),
                    TPSVGPath(classNames: ["st0"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 50, y: 250)),
                        TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 70, dy: 50),
                                                     xAxisRotation: 10,
                                                     largeArcFlag: true,
                                                     sweepFlag: false,
                                                     end: CGPoint(x: 150, y: 300))
                        ]),
                    TPSVGPath(classNames: ["st0"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 150, y: 150)),
                        TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 70, dy: 50),
                                                     xAxisRotation: 10,
                                                     largeArcFlag: false,
                                                     sweepFlag: true,
                                                     end: CGPoint(x: 250, y: 200))
                        ]),
                    TPSVGPath(classNames: ["st0"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 200, y: 100)),
                        TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 70, dy: 50),
                                                     xAxisRotation: 10,
                                                     largeArcFlag: true,
                                                     sweepFlag: true,
                                                     end: CGPoint(x: 300, y: 150))
                        ])
                ]
            }
        }
    }
}
