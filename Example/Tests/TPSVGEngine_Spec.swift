//
//  TPSVGEngine_Spec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

// swiftlint:disable type_name function_body_length type_body_length file_length

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
                    TPSVGPath(classNames: ["st0"], commands: [])
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
                    TPSVGPath(classNames: ["st0"], commands: [])
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
                expect(engine.styles).to(contain(expectedStyles))
                let expectedPaths = [
                    TPSVGPath(classNames: ["a"], commands: []),
                    TPSVGPath(classNames: ["a"], commands: []),
                    TPSVGPath(classNames: ["a"], commands: []),

                    TPSVGPath(classNames: ["a"], commands: []),
                    TPSVGPath(classNames: ["a"], commands: []),
                    TPSVGPath(classNames: ["a"], commands: []),
                    TPSVGPath(classNames: ["a"], commands: []),

                    TPSVGPath(classNames: ["a"], commands: []),
                    TPSVGPath(classNames: ["a"], commands: []),
                    TPSVGPath(classNames: ["a"], commands: []),
                    TPSVGPath(classNames: ["a"], commands: []),

                    TPSVGPath(classNames: ["a"], commands: []),
                    TPSVGPath(classNames: ["b"], commands: []),
                    TPSVGPath(classNames: ["c"], commands: []),
                    TPSVGPath(classNames: ["d"], commands: []),
                    TPSVGPath(classNames: ["e"], commands: []),
                    TPSVGPath(classNames: ["f"], commands: []),
                    TPSVGPath(classNames: ["g"], commands: []),
                    TPSVGPath(classNames: ["h"], commands: []),
                    TPSVGPath(classNames: ["i"], commands: []),
                    TPSVGPath(classNames: ["j"], commands: []),
                    TPSVGPath(classNames: ["k"], commands: []),
                    TPSVGPath(classNames: ["l"], commands: []),
                    TPSVGPath(classNames: ["m"], commands: []),
                    TPSVGPath(classNames: ["n"], commands: []),
                    TPSVGPath(classNames: ["o"], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["q"], commands: []),
                    TPSVGPath(classNames: ["r"], commands: []),
                    TPSVGPath(classNames: ["s"], commands: []),
                    TPSVGPath(classNames: ["t"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["v"], commands: []),
                    TPSVGPath(classNames: ["w"], commands: []),

                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),

                    TPSVGPath(classNames: ["x"], commands: []),
                    TPSVGPath(classNames: ["x"], commands: []),

                    TPSVGPath(classNames: ["u"], commands: []),

                    TPSVGPath(classNames: ["x"], commands: []),
                    TPSVGPath(classNames: ["x"], commands: []),

                    TPSVGPath(classNames: ["y"], commands: []),

                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),

                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),
                    TPSVGPath(classNames: ["u"], commands: []),

                    TPSVGPath(classNames: ["z"], commands: []),
                    TPSVGPath(classNames: ["z"], commands: []),

                    TPSVGPath(classNames: ["d"], commands: []),

                    TPSVGPath(classNames: ["aa"], commands: []),
                    TPSVGPath(classNames: ["ab"], commands: []),
                    TPSVGPath(classNames: ["ac"], commands: []),
                    TPSVGPath(classNames: ["ad"], commands: []),

                    TPSVGPath(classNames: ["o"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["ae"], commands: []),
                    TPSVGPath(classNames: ["af"], commands: []),
                    TPSVGPath(classNames: ["o"], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: ["d"], commands: []),
                    TPSVGPath(classNames: ["o"], commands: []),

                    TPSVGPath(classNames: ["ag"], commands: []),
                    TPSVGPath(classNames: ["ah"], commands: []),
                    TPSVGPath(classNames: ["ai"], commands: []),

                    TPSVGPath(classNames: ["o"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: ["ae"], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["aj"], commands: []),
                    TPSVGPath(classNames: ["ak"], commands: []),
                    TPSVGPath(classNames: ["al"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["o"], commands: []),

                    TPSVGPath(classNames: ["am"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["d"], commands: []),
                    TPSVGPath(classNames: ["d"], commands: []),
                    TPSVGPath(classNames: ["d"], commands: []),
                    TPSVGPath(classNames: ["d"], commands: []),
                    TPSVGPath(classNames: ["d"], commands: []),
                    TPSVGPath(classNames: ["d"], commands: []),

                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["an"], commands: []),
                    TPSVGPath(classNames: ["an"], commands: []),
                    TPSVGPath(classNames: ["an"], commands: []),
                    TPSVGPath(classNames: ["an"], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: ["ao"], commands: []),
                    TPSVGPath(classNames: ["ae"], commands: []),
                    TPSVGPath(classNames: ["af"], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["ap"], commands: []),
                    TPSVGPath(classNames: ["aq"], commands: []),
                    TPSVGPath(classNames: ["am"], commands: []),
                    TPSVGPath(classNames: ["o"], commands: []),
                    TPSVGPath(classNames: ["am"], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["o"], commands: []),
                    TPSVGPath(classNames: ["o"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["am"], commands: []),
                    TPSVGPath(classNames: ["am"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),

                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),

                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),

                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),

                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),

                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),

                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),
                    TPSVGPath(classNames: ["ar"], commands: []),

                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),
                    TPSVGPath(classNames: [], commands: []),

                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: ["p"], commands: []),
                    TPSVGPath(classNames: ["p"], commands: []),

                    TPSVGPath(classNames: ["as"], commands: []),
                    TPSVGPath(classNames: ["as"], commands: []),
                    TPSVGPath(classNames: ["as"], commands: []),
                    TPSVGPath(classNames: ["as"], commands: [])
                ]
                if let group = engine.elements.first as? TPSVGGroup {
                    expect(group.elements).to(haveCount(expectedPaths.count))

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
                expect(engine.elements) == [
                    TPSVGGroup(elements: expectedPaths)
                ]
            }
        }
    }
}
