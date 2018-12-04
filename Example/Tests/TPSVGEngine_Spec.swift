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
                // TODO: add this test case back in
//                let engine = parse(file: "file-7-text")
//
//                expect(engine.styles).to(contain([
//                    TPSVGStyle(name: ".st0", font: TPSVGFont(family: "AvenirNext-Regular")),
//                    TPSVGStyle(name: ".st1", font: TPSVGFont(size: 50))
//                    ]))
//                expect(engine.elements) == [
//                    TPSVGText(classNames: ["st0", "st1"], transform: "matrix(1 0 0 1 88.0273 250)", text: "TPSVG rocks!")
//                ]
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
        }
    }
}
