//
//  TPSVGEngine_Spec.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 02.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

class TPSVGEngine_Spec: QuickSpec {

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

            it("can parse empty data") {
                let engine = parse(file: "empty")

                expect(engine.styles) == []
                expect(engine.elements) == []
            }

            it("can parse file-1") {
                let engine = parse(file: "file-1-rect")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: UIColor.red)
                    ]))
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["st0"], origin: CGPoint(x: 100, y: 100), size: CGSize(width: 300, height: 300))
                ]
            }

            it("can parse file-2") {
                let engine = parse(file: "file-2-polygon")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: UIColor.red)
                    ]))
                expect(engine.elements) == [
                    TPSVGPolygon(classNames: ["st0"], points: [
                        CGPoint(x: 325, y: 120), CGPoint(x: 175, y: 120), CGPoint(x: 100, y: 250),
                        CGPoint(x: 175, y: 380), CGPoint(x: 325, y: 380), CGPoint(x: 400, y: 250)
                        ])
                ]
            }

            it("can parse file-3") {
                let engine = parse(file: "file-3-polyline")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: UIColor.clear, stroke: TPSVGStroke(color: UIColor.black, width: 10, miterLimit: 10))
                    ]))
                expect(engine.elements) == [
                    TPSVGPolyline(classNames: ["st0"], points: [
                        CGPoint(x: 53, y: 217), CGPoint(x: 175, y: 164),
                        CGPoint(x: 279, y: 350), CGPoint(x: 433, y: 240)
                        ])
                ]
            }

            it("can parse file-4") {
                let engine = parse(file: "file-4-circle")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: UIColor.green)
                    ]))
                expect(engine.elements) == [
                    TPSVGCircle(classNames: ["st0"], center: CGPoint(x: 250, y: 250), radius: 150)
                ]
            }

            it("can parse file-5") {
                let engine = parse(file: "file-5-ellipse")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: UIColor.green)
                    ]))
                expect(engine.elements) == [
                    TPSVGEllipse(classNames: ["st0"], center: CGPoint(x: 250, y: 250), radius: CGVector(dx: 225, dy: 150))
                ]
            }

            it("can parse file-6") {
                let engine = parse(file: "file-6-path")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: UIColor.green)
                    ]))
                expect(engine.elements) == [
                    TPSVGPath(classNames: ["st0"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 90, y: 260)),
                        TPSVGInstrCubicCurve(control1: CGPoint(x: 0, y: -30),
                                             control2: CGPoint(x: 40, y: -90),
                                             end: CGPoint(x: 80, y: -90),
                                             relative: true),
                        TPSVGInstrCubicCurve(control1: CGPoint(x: 60, y: 0),
                                             control2: CGPoint(x: 90, y: 176),
                                             end: CGPoint(x: 150, y: 180),
                                             relative: true),
                        TPSVGInstrCubicCurve(control1: CGPoint(x: 38, y: 2.3),
                                             control2: CGPoint(x: 110, y: -62),
                                             end: CGPoint(x: 110, y: -100),
                                             relative: true)
                        ])
                ]
            }

            it("can parse file-7") {
                let engine = parse(file: "file-7-text")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", font: TPSVGFont(family: "AvenirNext-Regular")),
                    TPSVGStyle(name: ".st1", font: TPSVGFont(size: 50))
                    ]))
                expect(engine.elements) == [
                    TPSVGText(classNames: ["st0", "st1"], transform: "matrix(1 0 0 1 88.0273 250)", text: "TPSVG rocks!")
                ]
            }

            it("can parse file-8") {
                let engine = parse(file: "file-8")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: UIColor.green)
                    ]))
                expect(engine.elements) == [
                    TPSVGPath(classNames: ["st0"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 250, y: 38)),
                        TPSVGInstrLineTo(point: CGPoint(x: 38, y: 250)),
                        TPSVGInstrLineTo(point: CGPoint(x: 212, y: 212), relative: true),
                        TPSVGInstrLineTo(point: CGPoint(x: 213, y: -212), relative: true),
                        TPSVGInstrLineTo(point: CGPoint(x: 250, y: 38)),
                        TPSVGInstrClosePath(),

                        TPSVGInstrMoveTo(point: CGPoint(x: 250, y: 320)),
                        TPSVGInstrLineTo(point: CGPoint(x: -70, y: -70), relative: true),
                        TPSVGInstrLineTo(point: CGPoint(x: 70, y: -70), relative: true),
                        TPSVGInstrLineTo(point: CGPoint(x: 70, y: 70), relative: true),
                        TPSVGInstrLineTo(point: CGPoint(x: 250, y: 320)),
                        TPSVGInstrClosePath()
                        ])
                ]
            }

            it("can parse file-9") {
                let engine = parse(file: "file-9")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: UIColor.green),
                    TPSVGStyle(name: ".st1", fill: UIColor.cyan)
                    ]))
                expect(engine.elements) == [
                    TPSVGGroup(elements: [
                        TPSVGPolygon(classNames: ["st0"], points: [
                            CGPoint(x: 284, y: 155), CGPoint(x: 284, y: 64), CGPoint(x: 71, y: 64),
                            CGPoint(x: 71, y: 231), CGPoint(x: 214.5, y: 231), CGPoint(x: 214.5, y: 155)
                            ]),
                        TPSVGPolygon(classNames: ["st1"], points: [
                            CGPoint(x: 284, y: 155), CGPoint(x: 284, y: 231), CGPoint(x: 214.5, y: 231),
                            CGPoint(x: 214.5, y: 292.1), CGPoint(x: 429.3, y: 292.1), CGPoint(x: 429.3, y: 155)
                            ])
                        ])
                ]
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
                let expectedPaths = [
                    TPSVGPath(classNames: ["a"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 109, y: 403.83)),
                        TPSVGInstrSmoothCubicCurve(end: CGPoint(x: -1.29, y: 3.31), control2: CGPoint(x: 0.18, y: 3.34), relative: true),
                        TPSVGInstrSmoothCubicCurve(end: CGPoint(x: -66.74, y: -81), control2: CGPoint(x: -30.49, y: -84.92), relative: true),
                        TPSVGInstrCubicCurve(control1: CGPoint(x: 40.94, y: 326.18), control2: CGPoint(x: 72.33, y: 313.2), end: CGPoint(x: 109, y: 403.83)),
                        TPSVGInstrClosePath()
                        ]),
                    TPSVGPath(classNames: ["a"], instructions: []),
                    TPSVGPath(classNames: ["a"], instructions: []),

                    TPSVGPath(classNames: ["a"], instructions: []),
                    TPSVGPath(classNames: ["a"], instructions: []),
                    TPSVGPath(classNames: ["a"], instructions: []),
                    TPSVGPath(classNames: ["a"], instructions: []),

                    TPSVGPath(classNames: ["a"], instructions: []),
                    TPSVGPath(classNames: ["a"], instructions: []),
                    TPSVGPath(classNames: ["a"], instructions: []),
                    TPSVGPath(classNames: ["a"], instructions: []),

                    TPSVGPath(classNames: ["a"], instructions: []),
                    TPSVGPath(classNames: ["b"], instructions: []),
                    TPSVGPath(classNames: ["c"], instructions: []),
                    TPSVGPath(classNames: ["d"], instructions: []),
                    TPSVGPath(classNames: ["e"], instructions: []),
                    TPSVGPath(classNames: ["f"], instructions: []),
                    TPSVGPath(classNames: ["g"], instructions: []),
                    TPSVGPath(classNames: ["h"], instructions: []),
                    TPSVGPath(classNames: ["i"], instructions: []),
                    TPSVGPath(classNames: ["j"], instructions: []),
                    TPSVGPath(classNames: ["k"], instructions: []),
                    TPSVGPath(classNames: ["l"], instructions: []),
                    TPSVGPath(classNames: ["m"], instructions: []),
                    TPSVGPath(classNames: ["n"], instructions: []),
                    TPSVGPath(classNames: ["o"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["q"], instructions: []),
                    TPSVGPath(classNames: ["r"], instructions: []),
                    TPSVGPath(classNames: ["s"], instructions: []),
                    TPSVGPath(classNames: ["t"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["v"], instructions: []),
                    TPSVGPath(classNames: ["w"], instructions: []),

                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),

                    TPSVGPath(classNames: ["x"], instructions: []),
                    TPSVGPath(classNames: ["x"], instructions: []),

                    TPSVGPath(classNames: ["u"], instructions: []),

                    TPSVGPath(classNames: ["x"], instructions: []),
                    TPSVGPath(classNames: ["x"], instructions: []),

                    TPSVGPath(classNames: ["y"], instructions: []),

                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),
                    TPSVGPath(classNames: ["u"], instructions: []),

                    TPSVGPath(classNames: ["z"], instructions: []),
                    TPSVGPath(classNames: ["z"], instructions: []),

                    TPSVGPath(classNames: ["d"], instructions: []),

                    TPSVGPath(classNames: ["aa"], instructions: []),
                    TPSVGPath(classNames: ["ab"], instructions: []),
                    TPSVGPath(classNames: ["ac"], instructions: []),
                    TPSVGPath(classNames: ["ad"], instructions: []),

                    TPSVGPath(classNames: ["o"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["ae"], instructions: []),
                    TPSVGPath(classNames: ["af"], instructions: []),
                    TPSVGPath(classNames: ["o"], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: ["d"], instructions: []),
                    TPSVGPath(classNames: ["o"], instructions: []),

                    TPSVGPath(classNames: ["ag"], instructions: []),
                    TPSVGPath(classNames: ["ah"], instructions: []),
                    TPSVGPath(classNames: ["ai"], instructions: []),

                    TPSVGPath(classNames: ["o"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: ["ae"], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["aj"], instructions: []),
                    TPSVGPath(classNames: ["ak"], instructions: []),
                    TPSVGPath(classNames: ["al"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["o"], instructions: []),

                    TPSVGPath(classNames: ["am"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["d"], instructions: []),
                    TPSVGPath(classNames: ["d"], instructions: []),
                    TPSVGPath(classNames: ["d"], instructions: []),
                    TPSVGPath(classNames: ["d"], instructions: []),
                    TPSVGPath(classNames: ["d"], instructions: []),
                    TPSVGPath(classNames: ["d"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["an"], instructions: []),
                    TPSVGPath(classNames: ["an"], instructions: []),
                    TPSVGPath(classNames: ["an"], instructions: []),
                    TPSVGPath(classNames: ["an"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: ["ao"], instructions: []),
                    TPSVGPath(classNames: ["ae"], instructions: []),
                    TPSVGPath(classNames: ["af"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["ap"], instructions: []),
                    TPSVGPath(classNames: ["aq"], instructions: []),
                    TPSVGPath(classNames: ["am"], instructions: []),
                    TPSVGPath(classNames: ["o"], instructions: []),
                    TPSVGPath(classNames: ["am"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["o"], instructions: []),
                    TPSVGPath(classNames: ["o"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["am"], instructions: []),
                    TPSVGPath(classNames: ["am"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),

                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),

                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),

                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),

                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),

                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),

                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),
                    TPSVGPath(classNames: ["ar"], instructions: []),

                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),
                    TPSVGPath(classNames: [], instructions: []),

                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: ["p"], instructions: []),
                    TPSVGPath(classNames: ["p"], instructions: []),

                    TPSVGPath(classNames: ["as"], instructions: []),
                    TPSVGPath(classNames: ["as"], instructions: []),
                    TPSVGPath(classNames: ["as"], instructions: []),
                    TPSVGPath(classNames: ["as"], instructions: [])
                ]
                expect(engine.elements) == [
                    TPSVGGroup(elements: expectedPaths)
                ]
                if let group = engine.elements.first as? TPSVGGroup {
                    expect(group.elements).to(haveCount(expectedPaths.count))

                    if group.elements.count == expectedPaths.count {
                        expect(Array(group.elements[0..<10])) == Array(expectedPaths[0..<10])
                        expect(Array(group.elements[10..<20])) == Array(expectedPaths[10..<20])
                        expect(Array(group.elements[20..<30])) == Array(expectedPaths[20..<30])
                        expect(Array(group.elements[30..<40])) == Array(expectedPaths[30..<40])
                        expect(Array(group.elements[40..<50])) == Array(expectedPaths[40..<50])
                        expect(Array(group.elements[50..<60])) == Array(expectedPaths[50..<60])
                        expect(Array(group.elements[60..<70])) == Array(expectedPaths[60..<70])
                        expect(Array(group.elements[70..<80])) == Array(expectedPaths[70..<80])
                        expect(Array(group.elements[80..<90])) == Array(expectedPaths[80..<90])
                        expect(Array(group.elements[90..<100])) == Array(expectedPaths[90..<100])

                        expect(Array(group.elements[100..<110])) == Array(expectedPaths[100..<110])
                        expect(Array(group.elements[110..<120])) == Array(expectedPaths[110..<120])
                        expect(Array(group.elements[120..<130])) == Array(expectedPaths[120..<130])
                        expect(Array(group.elements[130..<140])) == Array(expectedPaths[130..<140])
                        expect(Array(group.elements[140..<150])) == Array(expectedPaths[140..<150])
                        expect(Array(group.elements[150..<160])) == Array(expectedPaths[150..<160])
                        expect(Array(group.elements[160..<170])) == Array(expectedPaths[160..<170])
                        expect(Array(group.elements[170..<180])) == Array(expectedPaths[170..<180])
                        expect(Array(group.elements[180..<190])) == Array(expectedPaths[180..<190])
                        expect(Array(group.elements[190..<200])) == Array(expectedPaths[190..<200])

                        expect(Array(group.elements[200..<210])) == Array(expectedPaths[200..<210])
                        expect(Array(group.elements[210..<220])) == Array(expectedPaths[210..<220])
                        expect(Array(group.elements[220..<230])) == Array(expectedPaths[220..<230])
                        expect(Array(group.elements[230..<240])) == Array(expectedPaths[230..<240])
                    }
                }
            }

            it("can parse file-12") {
                let engine = parse(file: "file-12-ell-arc")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: .clear, stroke: TPSVGStroke(color: .black, width: 8, miterLimit: 10))
                    ]))
                expect(engine.elements) == [
                    TPSVGPath(classNames: ["st0"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 100, y: 200)),
                        TPSVGInstrEllipticalArcCurve(end: CGPoint(x: 200, y: 250),
                                                     radius: CGVector(dx: 70, dy: 50),
                                                     xAxisRotation: 10,
                                                     largeArcFlag: false,
                                                     sweepFlag: false)
                        ]),
                    TPSVGPath(classNames: ["st0"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 50, y: 250)),
                        TPSVGInstrEllipticalArcCurve(end: CGPoint(x: 150, y: 300),
                                                     radius: CGVector(dx: 70, dy: 50),
                                                     xAxisRotation: 10,
                                                     largeArcFlag: true,
                                                     sweepFlag: false)
                        ]),
                    TPSVGPath(classNames: ["st0"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 150, y: 150)),
                        TPSVGInstrEllipticalArcCurve(end: CGPoint(x: 250, y: 200),
                                                     radius: CGVector(dx: 70, dy: 50),
                                                     xAxisRotation: 10,
                                                     largeArcFlag: false,
                                                     sweepFlag: true)
                        ]),
                    TPSVGPath(classNames: ["st0"], instructions: [
                        TPSVGInstrMoveTo(point: CGPoint(x: 200, y: 100)),
                        TPSVGInstrEllipticalArcCurve(end: CGPoint(x: 300, y: 150),
                                                     radius: CGVector(dx: 70, dy: 50),
                                                     xAxisRotation: 10,
                                                     largeArcFlag: true,
                                                     sweepFlag: true)
                        ])
                ]
            }

            it("can parse file-13-icon-01") {
                let engine = parse(file: "file-13-icon-01")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".st0", fill: TPSVGColor(hex: 0xed1c24)),
                    TPSVGStyle(name: ".st1", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] =  [
                    TPSVGInstrMoveTo(point: CGPoint(x: 178.67, y: 116)),
                    TPSVGInstrLineTo(point: CGPoint(x: -7.41, y: 7.75), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -47.51, y: 47.51), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -7.75, y: 7.41), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 77.5, y: 77.5), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -53.91, y: 53.91), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -0.68, y: 3.37), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -11.79, y: 59.3), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -3.37, y: 15.84), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 15.84, y: -3.37), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 59.3, y: -11.8), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 3.37, y: -0.67), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 53.91, y: -53.91), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 333.33, y: 396)),
                    TPSVGInstrLineTo(point: CGPoint(x: 7.41, y: -7.75), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 47.51, y: -47.51), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 7.75, y: -7.41), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -77.16, y: -77.16), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 53.24, y: -53.24), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 17.3058, y: -17.3058), control2: CGPoint(x: 17.3058, y: -45.3642), end: CGPoint(x: 0, y: -62.67), relative: true),

                    TPSVGInstrSmoothCubicCurve(end: CGPoint(x: -62.67, y: 0),
                                               control2: CGPoint(x: -45.3642, y: -17.3058),
                                               relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -53.24, y: 53.24), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 178.67, y: 116)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 178.67, y: 146.66)),
                    TPSVGInstrLineTo(point: CGPoint(x: 20.89, y: 21.23), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -15.83, y: 15.84), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 15.5, y: 15.5), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 15.83, y: -15.84), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 240.67, y: 209)),
                    TPSVGInstrLineTo(point: CGPoint(x: -32, y: 32), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -62.34, y: -62.34), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 178.67, y: 146.66)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 340.74, y: 148)),

                    TPSVGInstrCubicCurve(control1: CGPoint(x: 5.6, y: 0),
                                         control2: CGPoint(x: 11.29, y: 2.53),
                                         end: CGPoint(x: 16.17, y: 7.41),
                                         relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 9.73, y: 9.73),
                                         control2: CGPoint(x: 9.73, y: 22.28),
                                         end: CGPoint(x: 0, y: 32),
                                         relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -7.07, y: 7.08), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -32, y: -32), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 7.07, y: -7.08), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 329.79, y: 150.54),
                                         control2: CGPoint(x: 335.14, y: 148),
                                         end: CGPoint(x: 340.74, y: 148)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 302.67, y: 177.65)),
                    TPSVGInstrLineTo(point: CGPoint(x: 32, y: 32), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -130.4, y: 130.4), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -7.1311, y: -13.697),
                                         control2: CGPoint(x: -18.303, y: -24.8689),
                                         end: CGPoint(x: -32, y: -32),
                                         relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 302.67, y: 177.65)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 303.67, y: 271.32)),
                    TPSVGInstrLineTo(point: CGPoint(x: 25.61, y: 25.61), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 313.1, y: 313.1)),
                    TPSVGInstrLineTo(point: CGPoint(x: 15.5, y: 15.5), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 16.17, y: -16.17), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 365.34, y: 333)),
                    TPSVGInstrLineTo(point: CGPoint(x: 333, y: 365.34)),
                    TPSVGInstrLineTo(point: CGPoint(x: -61.66, y: -61.66), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 303.67, y: 271.32)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 158.45, y: 325.24)),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 12.9288, y: 5.4313),
                                         control2: CGPoint(x: 23.2142, y: 15.7131),
                                         end: CGPoint(x: 28.65, y: 28.64),
                                         relative: true),

                    TPSVGInstrLineTo(point: CGPoint(x: 151.38, y: 361)),
                    TPSVGInstrLineTo(point: CGPoint(x: 158.45, y: 325.24)),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    if parsedPath.instructions.count == expectedInstructions.count {
                        expect(parsedPath.instructions[0..<10]) == expectedInstructions[0..<10]
                        expect(parsedPath.instructions[10..<15]) == expectedInstructions[10..<15]
                        expect(parsedPath.instructions[15..<20]) == expectedInstructions[15..<20]
                        expect(parsedPath.instructions[20..<25]) == expectedInstructions[20..<25]
                        expect(parsedPath.instructions[25..<30]) == expectedInstructions[25..<30]
                        expect(parsedPath.instructions[30..<35]) == expectedInstructions[30..<35]
                        expect(parsedPath.instructions[35..<40]) == expectedInstructions[35..<40]
                        expect(parsedPath.instructions[40..<45]) == expectedInstructions[40..<45]
                        expect(parsedPath.instructions[45..<50]) == expectedInstructions[45..<50]
                        expect(parsedPath.instructions[50..<55]) == expectedInstructions[50..<55]
                        expect(parsedPath.instructions[55..<60]) == expectedInstructions[55..<60]
                        expect(parsedPath.instructions[60..<63]) == expectedInstructions[60..<63]
                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["st0"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["st1"], instructions: expectedInstructions)
                ]
            }

            it("can parse file-13-icon-02") {
                let engine = parse(file: "file-13-icon-02")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0xf15a24)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] =  [
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    //                    if parsedPath.instructions.count == expectedInstructions.count {
                    //                        expect(parsedPath.instructions[0..<10]) == expectedInstructions[0..<10]
                    //                        expect(parsedPath.instructions[10..<15]) == expectedInstructions[10..<15]
                    //                        expect(parsedPath.instructions[15..<20]) == expectedInstructions[15..<20]
                    //                        expect(parsedPath.instructions[20..<25]) == expectedInstructions[20..<25]
                    //                        expect(parsedPath.instructions[25..<30]) == expectedInstructions[25..<30]
                    //                        expect(parsedPath.instructions[30..<35]) == expectedInstructions[30..<35]
                    //                        expect(parsedPath.instructions[35..<40]) == expectedInstructions[35..<40]
                    //                        expect(parsedPath.instructions[40..<45]) == expectedInstructions[40..<45]
                    //                        expect(parsedPath.instructions[45..<50]) == expectedInstructions[45..<50]
                    //                        expect(parsedPath.instructions[50..<55]) == expectedInstructions[50..<55]
                    //                        expect(parsedPath.instructions[55..<60]) == expectedInstructions[55..<60]
                    //                        expect(parsedPath.instructions[60..<63]) == expectedInstructions[60..<63]
                    //                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["a"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["b"], instructions: expectedInstructions)
                ]
            }

            it("can parse file-13-icon-03") {
                let engine = parse(file: "file-13-icon-03")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0xf7931e)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] =  [
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    //                    if parsedPath.instructions.count == expectedInstructions.count {
                    //                        expect(parsedPath.instructions[0..<10]) == expectedInstructions[0..<10]
                    //                        expect(parsedPath.instructions[10..<15]) == expectedInstructions[10..<15]
                    //                        expect(parsedPath.instructions[15..<20]) == expectedInstructions[15..<20]
                    //                        expect(parsedPath.instructions[20..<25]) == expectedInstructions[20..<25]
                    //                        expect(parsedPath.instructions[25..<30]) == expectedInstructions[25..<30]
                    //                        expect(parsedPath.instructions[30..<35]) == expectedInstructions[30..<35]
                    //                        expect(parsedPath.instructions[35..<40]) == expectedInstructions[35..<40]
                    //                        expect(parsedPath.instructions[40..<45]) == expectedInstructions[40..<45]
                    //                        expect(parsedPath.instructions[45..<50]) == expectedInstructions[45..<50]
                    //                        expect(parsedPath.instructions[50..<55]) == expectedInstructions[50..<55]
                    //                        expect(parsedPath.instructions[55..<60]) == expectedInstructions[55..<60]
                    //                        expect(parsedPath.instructions[60..<63]) == expectedInstructions[60..<63]
                    //                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["a"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["b"], instructions: expectedInstructions)
                ]
            }

            it("can parse file-13-icon-04") {
                let engine = parse(file: "file-13-icon-04")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0xf7931e)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] =  [
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    //                    if parsedPath.instructions.count == expectedInstructions.count {
                    //                        expect(parsedPath.instructions[0..<10]) == expectedInstructions[0..<10]
                    //                        expect(parsedPath.instructions[10..<15]) == expectedInstructions[10..<15]
                    //                        expect(parsedPath.instructions[15..<20]) == expectedInstructions[15..<20]
                    //                        expect(parsedPath.instructions[20..<25]) == expectedInstructions[20..<25]
                    //                        expect(parsedPath.instructions[25..<30]) == expectedInstructions[25..<30]
                    //                        expect(parsedPath.instructions[30..<35]) == expectedInstructions[30..<35]
                    //                        expect(parsedPath.instructions[35..<40]) == expectedInstructions[35..<40]
                    //                        expect(parsedPath.instructions[40..<45]) == expectedInstructions[40..<45]
                    //                        expect(parsedPath.instructions[45..<50]) == expectedInstructions[45..<50]
                    //                        expect(parsedPath.instructions[50..<55]) == expectedInstructions[50..<55]
                    //                        expect(parsedPath.instructions[55..<60]) == expectedInstructions[55..<60]
                    //                        expect(parsedPath.instructions[60..<63]) == expectedInstructions[60..<63]
                    //                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["a"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["b"], instructions: expectedInstructions)
                ]
            }

            it("can parse file-13-icon-05") {
                let engine = parse(file: "file-13-icon-05")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0x00a99d)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] =  [
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    //                    if parsedPath.instructions.count == expectedInstructions.count {
                    //                        expect(parsedPath.instructions[0..<10]) == expectedInstructions[0..<10]
                    //                        expect(parsedPath.instructions[10..<15]) == expectedInstructions[10..<15]
                    //                        expect(parsedPath.instructions[15..<20]) == expectedInstructions[15..<20]
                    //                        expect(parsedPath.instructions[20..<25]) == expectedInstructions[20..<25]
                    //                        expect(parsedPath.instructions[25..<30]) == expectedInstructions[25..<30]
                    //                        expect(parsedPath.instructions[30..<35]) == expectedInstructions[30..<35]
                    //                        expect(parsedPath.instructions[35..<40]) == expectedInstructions[35..<40]
                    //                        expect(parsedPath.instructions[40..<45]) == expectedInstructions[40..<45]
                    //                        expect(parsedPath.instructions[45..<50]) == expectedInstructions[45..<50]
                    //                        expect(parsedPath.instructions[50..<55]) == expectedInstructions[50..<55]
                    //                        expect(parsedPath.instructions[55..<60]) == expectedInstructions[55..<60]
                    //                        expect(parsedPath.instructions[60..<63]) == expectedInstructions[60..<63]
                    //                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["a"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["b"], instructions: expectedInstructions)
                ]
            }

            it("can parse file-13-icon-06") {
                let engine = parse(file: "file-13-icon-06")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0x29abe2)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] =  [
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    //                    if parsedPath.instructions.count == expectedInstructions.count {
                    //                        expect(parsedPath.instructions[0..<10]) == expectedInstructions[0..<10]
                    //                        expect(parsedPath.instructions[10..<15]) == expectedInstructions[10..<15]
                    //                        expect(parsedPath.instructions[15..<20]) == expectedInstructions[15..<20]
                    //                        expect(parsedPath.instructions[20..<25]) == expectedInstructions[20..<25]
                    //                        expect(parsedPath.instructions[25..<30]) == expectedInstructions[25..<30]
                    //                        expect(parsedPath.instructions[30..<35]) == expectedInstructions[30..<35]
                    //                        expect(parsedPath.instructions[35..<40]) == expectedInstructions[35..<40]
                    //                        expect(parsedPath.instructions[40..<45]) == expectedInstructions[40..<45]
                    //                        expect(parsedPath.instructions[45..<50]) == expectedInstructions[45..<50]
                    //                        expect(parsedPath.instructions[50..<55]) == expectedInstructions[50..<55]
                    //                        expect(parsedPath.instructions[55..<60]) == expectedInstructions[55..<60]
                    //                        expect(parsedPath.instructions[60..<63]) == expectedInstructions[60..<63]
                    //                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["a"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["b"], instructions: expectedInstructions)
                ]
            }

            it("can parse file-13-icon-07") {
                let engine = parse(file: "file-13-icon-07")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0xd4145a)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] =  [
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    //                    if parsedPath.instructions.count == expectedInstructions.count {
                    //                        expect(parsedPath.instructions[0..<10]) == expectedInstructions[0..<10]
                    //                        expect(parsedPath.instructions[10..<15]) == expectedInstructions[10..<15]
                    //                        expect(parsedPath.instructions[15..<20]) == expectedInstructions[15..<20]
                    //                        expect(parsedPath.instructions[20..<25]) == expectedInstructions[20..<25]
                    //                        expect(parsedPath.instructions[25..<30]) == expectedInstructions[25..<30]
                    //                        expect(parsedPath.instructions[30..<35]) == expectedInstructions[30..<35]
                    //                        expect(parsedPath.instructions[35..<40]) == expectedInstructions[35..<40]
                    //                        expect(parsedPath.instructions[40..<45]) == expectedInstructions[40..<45]
                    //                        expect(parsedPath.instructions[45..<50]) == expectedInstructions[45..<50]
                    //                        expect(parsedPath.instructions[50..<55]) == expectedInstructions[50..<55]
                    //                        expect(parsedPath.instructions[55..<60]) == expectedInstructions[55..<60]
                    //                        expect(parsedPath.instructions[60..<63]) == expectedInstructions[60..<63]
                    //                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["a"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["b"], instructions: expectedInstructions)
                ]
            }

            it("can parse file-13-icon-08") {
                let engine = parse(file: "file-13-icon-08")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0x0071bc)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] =  [
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    //                    if parsedPath.instructions.count == expectedInstructions.count {
                    //                        expect(parsedPath.instructions[0..<10]) == expectedInstructions[0..<10]
                    //                        expect(parsedPath.instructions[10..<15]) == expectedInstructions[10..<15]
                    //                        expect(parsedPath.instructions[15..<20]) == expectedInstructions[15..<20]
                    //                        expect(parsedPath.instructions[20..<25]) == expectedInstructions[20..<25]
                    //                        expect(parsedPath.instructions[25..<30]) == expectedInstructions[25..<30]
                    //                        expect(parsedPath.instructions[30..<35]) == expectedInstructions[30..<35]
                    //                        expect(parsedPath.instructions[35..<40]) == expectedInstructions[35..<40]
                    //                        expect(parsedPath.instructions[40..<45]) == expectedInstructions[40..<45]
                    //                        expect(parsedPath.instructions[45..<50]) == expectedInstructions[45..<50]
                    //                        expect(parsedPath.instructions[50..<55]) == expectedInstructions[50..<55]
                    //                        expect(parsedPath.instructions[55..<60]) == expectedInstructions[55..<60]
                    //                        expect(parsedPath.instructions[60..<63]) == expectedInstructions[60..<63]
                    //                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["a"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["b"], instructions: expectedInstructions)
                ]
            }

            it("can parse file-13-icon-09") {
                let engine = parse(file: "file-13-icon-09")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0x2e3192)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] = [
                    TPSVGInstrMoveTo(point: CGPoint(x: 392.29, y: 166.17)),
                    TPSVGInstrLineTo(point: CGPoint(x: -3.09, y: -9.37), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -49.46, y: 49.44), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -24.27, y: -9.7), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -9.7, y: -24.3), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 49.43, y: -49.46), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -9.37, y: -3.1), relative: true),
                    TPSVGInstrEllipticalArcCurve(end: CGPoint(x: -95.92, y: 69.37), radius: CGVector(dx: 73, dy: 73), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, relative: true),
                    TPSVGInstrEllipticalArcCurve(end: CGPoint(x: 4.92, y: 26.23), radius: CGVector(dx: 71.86, dy: 71.86), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 124.68, y: 345.42)),
                    TPSVGInstrEllipticalArcCurve(end: CGPoint(x: 41.92, y: 41.92), radius: CGVector(dx: 29.64, dy: 29.64), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 296.73, y: 257.2)),
                    TPSVGInstrEllipticalArcCurve(end: CGPoint(x: 323, y: 262.1), radius: CGVector(dx: 72.22, dy: 72.22), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false),
                    TPSVGInstrEllipticalArcCurve(end: CGPoint(x: 69.33, y: -95.93), radius: CGVector(dx: 73, dy: 73), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, relative: true),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    if parsedPath.instructions.count == expectedInstructions.count {
                        expect(parsedPath.instructions[0..<3]) == expectedInstructions[0..<3]
                        expect(parsedPath.instructions[3..<6]) == expectedInstructions[3..<6]
                        expect(parsedPath.instructions[6..<9]) == expectedInstructions[6..<9]
                        expect(parsedPath.instructions[9..<12]) == expectedInstructions[9..<12]
                        expect(parsedPath.instructions[12..<15]) == expectedInstructions[12..<15]
                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["a"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["b"], instructions: expectedInstructions)
                ]
            }
        }
    }
}
