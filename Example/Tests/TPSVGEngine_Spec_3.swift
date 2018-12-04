//
//  TPSVGEngine_Spec_3.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 03.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

class TPSVGEngine_Spec_3: QuickSpec {

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

            it("can parse file-13-icon-02") {
                let engine = parse(file: "file-13-icon-02")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0xf15a24)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] = [
                    TPSVGInstrMoveTo(point: CGPoint(x: 188.39, y: 116)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.59, dy: 19.59), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 186, y: 155)),
                    TPSVGInstrLineTo(point: CGPoint(x: 13.62, y: 25), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.39, dy: 19.39), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 1.57, y: 20.13), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -19.73, y: 36.4), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.36, dy: 19.36), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -14, y: 8.22), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 152.07),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.56, dy: 19.56), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -35.1, y: 6.65), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0, y: 0.17), control2: CGPoint(x: -0.13, y: 0.35), end: CGPoint(x: -0.17, y: 0.52), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 11.19, dy: 11.19), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0.35, y: 9.1), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.52, dy: 19.52), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 34.92, y: 6.13), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 15.37, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.36, dy: 19.36), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 14, y: 8.22), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 201, y: 311.82)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.85, dy: 19.85), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -3.49, y: 11.38), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.5, dy: 19.5), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 2.1, y: 8.57), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 185.77, y: 357)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.86, dy: 19.86), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 19.91, y: 10.5), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 13.44, y: -24.85), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.4, dy: 19.4), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 14, y: -8.22), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 46.1, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.38, dy: 19.38), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 14.15, y: 8.22), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 307.83, y: 368)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 11.27, dy: 11.27), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 19.56, y: -11.2), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -14.5, y: -25.38), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.12, dy: 19.12), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -1.74, y: -19.6), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 19.73, y: -36.4), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.44, dy: 19.44), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 14, y: -8.22), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 15.36, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.49, dy: 19.49), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 35.28, y: -8.05), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 11.25, dy: 11.25), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: -6.65), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.53, dy: 19.53), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -35.28, y: -7.7), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 344.85),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.44, dy: 19.44), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -14, y: -8.22), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -19.56, y: -36.4), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.55, dy: 19.55), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 1.4, y: -20), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 326.51, y: 155)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.37, dy: 19.37), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 15.54, y: -11), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 42.61, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 11.2, dy: 11.2), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 0, y: -22.4), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 338),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.53, dy: 19.53), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 306.78, y: 144)),
                    TPSVGInstrLineTo(point: CGPoint(x: -13.62, y: 25.38), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.44, dy: 19.44), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -14, y: 8.22), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 232.92),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.38, dy: 19.38), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -13.8, y: -8.22), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 205.68, y: 144.7)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.56, dy: 19.56), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 188.39, y: 116)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 44.7, y: 84), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 46.1, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.34, dy: 19.34), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 290, y: 207.7)),
                    TPSVGInstrLineTo(point: CGPoint(x: 21.3, y: 39.38), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 20.08, dy: 20.08), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: 17.84), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 290, y: 304.3)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.34, dy: 19.34), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -10.83, y: 7.7), relative: true),
                    TPSVGInstrHorizontalLineTo(length: -46.1, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.32, dy: 19.32), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -10.82, y: -7.7), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 201, y: 264.92)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 20, dy: 20), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: -17.84), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 21.31, y: -39.38), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.32, dy: 19.32), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 233.09, y: 200)),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    for i in 0..<parsedPath.instructions.count {
                        expect(parsedPath.instructions[i]) == expectedInstructions[i]
                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["a"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["b"], instructions: expectedInstructions)
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

                    for i in 0..<parsedPath.instructions.count {
                        expect(parsedPath.instructions[i]) == expectedInstructions[i]
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

                let expectedInstructions: [TPSVGInstruction] = [
                    TPSVGInstrMoveTo(point: CGPoint(x: 188.39, y: 116)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.59, dy: 19.59), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 186, y: 155)),
                    TPSVGInstrLineTo(point: CGPoint(x: 13.62, y: 25), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.39, dy: 19.39), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 1.57, y: 20.13), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -19.73, y: 36.4), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.36, dy: 19.36), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -14, y: 8.22), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 152.07),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.56, dy: 19.56), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -35.1, y: 6.65), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0, y: 0.17), control2: CGPoint(x: -0.13, y: 0.35), end: CGPoint(x: -0.17, y: 0.52), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 11.19, dy: 11.19), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0.35, y: 9.1), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.52, dy: 19.52), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 34.92, y: 6.13), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 15.37, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.36, dy: 19.36), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 14, y: 8.22), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 201, y: 311.82)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.85, dy: 19.85), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -3.49, y: 11.38), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.5, dy: 19.5), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 2.1, y: 8.57), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 185.77, y: 357)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.86, dy: 19.86), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 19.91, y: 10.5), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 13.44, y: -24.85), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.4, dy: 19.4), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 14, y: -8.22), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 46.1, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.38, dy: 19.38), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 14.15, y: 8.22), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 307.83, y: 368)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 11.27, dy: 11.27), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 19.56, y: -11.2), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -14.5, y: -25.38), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.12, dy: 19.12), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -1.74, y: -19.6), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 19.73, y: -36.4), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.44, dy: 19.44), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 14, y: -8.22), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 15.36, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.49, dy: 19.49), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 35.28, y: -8.05), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 11.25, dy: 11.25), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: -6.65), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.53, dy: 19.53), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -35.28, y: -7.7), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 344.85),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.44, dy: 19.44), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -14, y: -8.22), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -19.56, y: -36.4), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.55, dy: 19.55), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 1.4, y: -20), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 326.51, y: 155)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.37, dy: 19.37), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 15.54, y: -11), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 42.61, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 11.2, dy: 11.2), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 0, y: -22.4), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 338),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.53, dy: 19.53), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 306.78, y: 144)),
                    TPSVGInstrLineTo(point: CGPoint(x: -13.62, y: 25.38), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.44, dy: 19.44), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -14, y: 8.22), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 232.92),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.38, dy: 19.38), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -13.8, y: -8.22), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 205.68, y: 144.7)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.56, dy: 19.56), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 188.39, y: 116)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 44.7, y: 84), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 46.1, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.34, dy: 19.34), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 290, y: 207.7)),
                    TPSVGInstrLineTo(point: CGPoint(x: 21.3, y: 39.38), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 20.08, dy: 20.08), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: 17.84), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 290, y: 304.3)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.34, dy: 19.34), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -10.83, y: 7.7), relative: true),
                    TPSVGInstrHorizontalLineTo(length: -46.1, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.32, dy: 19.32), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -10.82, y: -7.7), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 201, y: 264.92)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 20, dy: 20), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: -17.84), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 21.31, y: -39.38), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 19.32, dy: 19.32), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 233.09, y: 200)),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    if parsedPath.instructions.count == expectedInstructions.count {
                        for i in 0..<parsedPath.instructions.count {
                            expect(parsedPath.instructions[i]) == expectedInstructions[i]
                        }
                    }
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

                let expectedInstructions: [TPSVGInstruction] = [
                    TPSVGInstrMoveTo(point: CGPoint(x: 283.73, y: 116)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 42.25, dy: 42.25), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -36.83, y: 21.33), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0, y: 1.45), control2: CGPoint(x: -1.66, y: 2.95), end: CGPoint(x: -3.1, y: 5.78), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -41.16, y: -15.67), control2: CGPoint(x: -79.54, y: -4.17), end: CGPoint(x: -113.6, y: 34.22), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 21.3, y: 18.23), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 41.16, y: -48.34), control2: CGPoint(x: 78.37, y: -32.45), end: CGPoint(x: 109.6, y: -11.12), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 15.53, y: -23.11), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -1.44, y: -2.83), control2: CGPoint(x: -4.27, y: -3.89), end: CGPoint(x: -7.1, y: -5.33), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 1.45, y: -1.44), control2: CGPoint(x: 1.22, y: -3), end: CGPoint(x: 2.67, y: -4.44), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 1.44, y: -4.28), control2: CGPoint(x: 5.88, y: -7.12), end: CGPoint(x: 11.53, y: -7.12), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 2.83, y: 0), control2: CGPoint(x: 4.27, y: -0.11), end: CGPoint(x: 7.1, y: 1.34), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 7.1, y: 4.28), control2: CGPoint(x: 8.6, y: 12.89), end: CGPoint(x: 5.77, y: 20), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -4.27, y: 7.11), control2: CGPoint(x: -45.43, y: 57.05), end: CGPoint(x: -92.3, y: 111.11), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 14.2, y: -25.61), control2: CGPoint(x: 28.13, y: -51.56), end: CGPoint(x: 39.5, y: -72.89), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 216.62, dy: 216.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -24, y: -14.22), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 181.51, y: 259.44), control2: CGPoint(x: 120.27, y: 373.33), end: CGPoint(x: 116, y: 380.44)),
                    TPSVGInstrLineTo(point: CGPoint(x: 139.07, y: 396)),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 28.4, y: -34.11), control2: CGPoint(x: 173, y: -201.78), end: CGPoint(x: 181.49, y: -216), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 11.38, y: -19.89), control2: CGPoint(x: 4.33, y: -46.83), end: CGPoint(x: -15.53, y: -58.22), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 40, dy: 40), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 283.73, y: 116)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 35.5, y: 86.67), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 300.6, y: 225.33)),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 19.85, y: 17.06), control2: CGPoint(x: 32.94, y: 33.06), end: CGPoint(x: 31.5, y: 44.45), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0, y: 7.11), control2: CGPoint(x: -4.27, y: 12.55), end: CGPoint(x: -14.2, y: 18.22), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -32.67, y: 19.89), control2: CGPoint(x: -28.67, y: 44.28), end: CGPoint(x: -24.4, y: 54.22), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 9.92, y: 27), control2: CGPoint(x: 48.25, y: 45.34), end: CGPoint(x: 85.19, y: 45.34), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 7.1, y: 0), control2: CGPoint(x: 11.65, y: 0.16), end: CGPoint(x: 17.31, y: -2.67), relative: true),
                    TPSVGInstrVerticalLineTo(length: 356.44),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -34.06, y: 5.67), control2: CGPoint(x: -71.11, y: -11.55), end: CGPoint(x: -76.77, y: -25.77), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -2.83, y: -7.11), control2: CGPoint(x: 1.5, y: -12.89), end: CGPoint(x: 12.87, y: -20), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 17, y: -9.95), control2: CGPoint(x: 27, y: -23.89), end: CGPoint(x: 28.4, y: -39.56), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 361.94, y: 244.11), control2: CGPoint(x: 339.09, y: 218.33), end: CGPoint(x: 319.23, y: 202.67)),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    if parsedPath.instructions.count == expectedInstructions.count {
                        for i in 0..<parsedPath.instructions.count {
                            expect(parsedPath.instructions[i]) == expectedInstructions[i]
                        }
                    }
                }
                expect(engine.elements) == [
                    TPSVGRect(classNames: ["a"], origin: .zero, size: CGSize(width: 512, height: 512)),
                    TPSVGPath(classNames: ["b"], instructions: expectedInstructions)
                ]
            }

            it("can parse file-13-icon-04") {
                let engine = parse(file: "file-13-icon-04")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0x009245)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] = [
                    TPSVGInstrMoveTo(point: CGPoint(x: 136, y: 116)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 20.08, dy: 20.08), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -20, y: 19.94), relative: true),
                    TPSVGInstrVerticalLineTo(length: 376),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 20.08, dy: 20.08), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 136, y: 396)),
                    TPSVGInstrLineTo(point: CGPoint(x: 162.56, y: 0), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 369),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.64, dy: 6.64), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 4.79, y: -11.27), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 332.38, y: 342)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.68, dy: 6.68), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -7.09, y: -1.64), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 26.69, dy: 26.69), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -35.42, y: -20.6), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -2.92, y: -18.36), control2: CGPoint(x: 12.26, y: -33.51), end: CGPoint(x: 30.68, y: -30.65), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 26.55, dy: 26.55), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 20.77, y: 35.31), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.63, dy: 6.63), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 1.56, y: 7), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.91, y: 2), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 4.81, y: 4.94), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 14.31, y: 14.75), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 20.62, y: 21.24), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.68, dy: 6.68), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 396, y: 369.7)),
                    TPSVGInstrVerticalLineTo(length: 136),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 20.08, dy: 20.08), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 376, y: 116)),
                    TPSVGInstrHorizontalLineTo(length: 289.22),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.69, dy: 6.69), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -4.73, y: 2), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -61.75, y: 61.79), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.63, dy: 6.63), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -1.55, y: 7), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 26.53, dy: 26.53), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 200.47, y: 222)),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -18.43, y: 2.89), control2: CGPoint(x: -33.61, y: -12.21), end: CGPoint(x: -30.74, y: -30.55), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 26.71, dy: 26.71), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 35.44, y: -20.68), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.7, dy: 6.7), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 7, y: -1.54), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0.61, y: -0.6), control2: CGPoint(x: 2.89, y: -2.9), end: CGPoint(x: 6.83, y: -6.85), relative: true),
                    TPSVGInstrSmoothCubicCurve(end: CGPoint(x: 14.32, y: -14.36), control2: CGPoint(x: 9.14, y: -9.17), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 20.62, y: -20.68), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.63, dy: 6.63), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: -9.4), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.71, dy: 6.71), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -4.7, y: -1.93), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 0, y: 13.29), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 97.12, relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -9.33, y: 9.36), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 209.5, y: 153)),
                    TPSVGInstrLineTo(point: CGPoint(x: -4.8, y: 4.8), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -5, y: -1.13), control2: CGPoint(x: -10.1, y: -2.27), end: CGPoint(x: -15.56, y: -1.35), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 39.9, dy: 39.9), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -32.6, y: 32.92), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -4.19, y: 26.75), control2: CGPoint(x: 19.14, y: 50), end: CGPoint(x: 46, y: 45.75), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 39.88, dy: 39.88), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 33, y: -32.46), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0.92, y: -5.45), control2: CGPoint(x: -0.22, y: -10.52), end: CGPoint(x: -1.37, y: -15.52), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 292, y: 129.29)),
                    TPSVGInstrLineTo(point: CGPoint(x: 84, y: 0), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.56, dy: 6.56), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 6.67, y: 6.64), relative: true),
                    TPSVGInstrVerticalLineTo(length: 217.3, relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -9.15, y: -9.42), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -5.17, y: -5.34), control2: CGPoint(x: -10.37, y: -10.69), end: CGPoint(x: -14.31, y: -14.75), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -4.81, y: -5), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -0.08, y: -0.08), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 1.15, y: -5), control2: CGPoint(x: 2.3, y: -10.1), end: CGPoint(x: 1.37, y: -15.56), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 39.9, dy: 39.9), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 322.61, y: 276)),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -26.87, y: -4.17), control2: CGPoint(x: -50.18, y: 19.1), end: CGPoint(x: -45.92, y: 45.87), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 39.88, dy: 39.88), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 32.6, y: 32.81), relative: true),
                    TPSVGInstrVerticalLineTo(length: 0, relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 5.43, y: 0.9), control2: CGPoint(x: 10.49, y: -0.24), end: CGPoint(x: 15.49, y: -1.37), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 28.52, y: 29.37), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -9.87, y: 0), control2: CGPoint(x: -24.07, y: 0), end: CGPoint(x: -54.72, y: 0), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 136),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.55, dy: 6.55), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -6.67, y: -6.65), relative: true),
                    TPSVGInstrVerticalLineTo(length: 135.94),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.55, dy: 6.55), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 136, y: 129.29)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 180.19, y: 26.59), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 40.06, dy: 40.06), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -40, y: 39.88), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0, y: 3.13), control2: CGPoint(x: 0.89, y: 6), end: CGPoint(x: 1.58, y: 9), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -72.66, y: 72.36), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -3, y: -0.69), control2: CGPoint(x: -5.85, y: -1.57), end: CGPoint(x: -9, y: -1.57), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 39.88, dy: 39.88), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 40, y: 39.88), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0, y: -3.14), control2: CGPoint(x: -0.89, y: -6), end: CGPoint(x: -1.58, y: -9), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 72.66, y: -72.36), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 3, y: 0.69), control2: CGPoint(x: 5.85, y: 1.56), end: CGPoint(x: 9, y: 1.56), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 39.88, dy: 39.88), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 0, y: -79.76), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 0, y: 13.29), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 26.59, dy: 26.59), xAxisRotation: 0, largeArcFlag: true, sweepFlag: true, end: CGPoint(x: 0, y: 53.18), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 27.07, dy: 27.07), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -9.13, y: -1.58), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.71, dy: 6.71), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -6.95, y: 1.56), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -77.38, y: 77.06), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.63, dy: 6.63), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -1.56, y: 7), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 26.68, dy: 26.68), xAxisRotation: 0, largeArcFlag: true, sweepFlag: true, end: CGPoint(x: -16, y: -16), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.69, dy: 6.69), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 7, y: -1.54), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 77.38, y: -77.07), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 6.61, dy: 6.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 1.57, y: -7), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 26.59, dy: 26.59), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 25.1, y: -35.65), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: -120.12, y: 13.3), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 13.29, dy: 13.29), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 13.34, y: 13.29), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 13.32, dy: 13.32), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 196.09, y: 182.47)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 120.12, y: 0), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 13.29, dy: 13.29), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 13.35, y: 13.29), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 13.31, dy: 13.31), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 316.21, y: 182.47)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 196.09, y: 302.1)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 13.3, dy: 13.3), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 13.34, y: 13.3), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 13.32, dy: 13.32), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 196.09, y: 302.1)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 120.12, y: 0), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 13.3, dy: 13.3), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 13.35, y: 13.3), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 13.32, dy: 13.32), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 316.21, y: 302.1)),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    if parsedPath.instructions.count == expectedInstructions.count {
                        for i in 0..<parsedPath.instructions.count {
                            expect(parsedPath.instructions[i]) == expectedInstructions[i]
                        }
                    }
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

                let expectedInstructions: [TPSVGInstruction] = [
                    TPSVGInstrMoveTo(point: CGPoint(x: 148.31, y: 137.88)),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -18.3, y: 0), control2: CGPoint(x: -32.31, y: 14), end: CGPoint(x: -32.31, y: 32.21), relative: true),
                    TPSVGInstrVerticalLineTo(length: 341.91),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0, y: 18.25), control2: CGPoint(x: 14, y: 32.21), end: CGPoint(x: 32.31, y: 32.21), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 363.69),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 18.3, y: 0), control2: CGPoint(x: 32.31, y: -14), end: CGPoint(x: 32.31, y: -32.21), relative: true),
                    TPSVGInstrVerticalLineTo(length: 170.09),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0, y: -18.25), control2: CGPoint(x: -14, y: -32.21), end: CGPoint(x: -32.31, y: -32.21), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: -10.77, y: 53.69), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 374.46),
                    TPSVGInstrVerticalLineTo(length: 341.91),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0, y: 6.46), control2: CGPoint(x: -4.29, y: 10.74), end: CGPoint(x: -10.77, y: 10.74), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 148.31),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -6.48, y: 0), control2: CGPoint(x: -10.77, y: -4.28), end: CGPoint(x: -10.77, y: -10.74), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 129.23, y: 21.48), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 223.69, y: 331.17)),
                    TPSVGInstrHorizontalLineTo(length: 21.54, relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 43.08, y: -118.12), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: -72.69, y: 14.43), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -38.37, y: 44.63), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 38.37, y: 44.63), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 16.15, y: -14.09), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 184, y: 272.11)),
                    TPSVGInstrLineTo(point: CGPoint(x: 26.25, y: -30.54), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 123.84, y: 0), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -16.15, y: 14.09), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 328, y: 272.11)),
                    TPSVGInstrLineTo(point: CGPoint(x: -26.25, y: 30.54), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 16.15, y: 14.09), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 38.37, y: -44.63), relative: true),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    if parsedPath.instructions.count == expectedInstructions.count {
                        for i in 0..<parsedPath.instructions.count {
                            expect(parsedPath.instructions[i]) == expectedInstructions[i]
                        }
                    }
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

                let expectedInstructions: [TPSVGInstruction] = [
                    TPSVGInstrMoveTo(point: CGPoint(x: 256, y: 126.94)),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -14.39, y: 0), control2: CGPoint(x: -27.51, y: 4.28), end: CGPoint(x: -37.35, y: 11.76), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 41.44, dy: 41.44), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -14.47, y: 20.5), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 148.36),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 32.45, dy: 32.45), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -32.3, y: 32.27), relative: true),
                    TPSVGInstrVerticalLineTo(length: 73.27, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 8.53, dy: 8.53), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: 2), relative: true),
                    TPSVGInstrVerticalLineTo(length: 86, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 32.45, dy: 32.45), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 32.3, y: 32.26), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 363.7),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 32.46, dy: 32.46), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 396, y: 352.8)),
                    TPSVGInstrVerticalLineTo(length: 191.47),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 32.46, dy: 32.46), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -32.3, y: -32.27), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 307.84),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 41.42, dy: 41.42), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -14.46, y: -20.5), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 283.53, y: 131.22), control2: CGPoint(x: 270.41, y: 126.94), end: CGPoint(x: 256, y: 126.94)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 0, y: 21.51), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 10.13, y: 0), control2: CGPoint(x: 18.67, y: 3.19), end: CGPoint(x: 24.22, y: 7.39), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 26.59, dy: 26.59), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 284, y: 159.2)),
                    TPSVGInstrHorizontalLineTo(length: 228.1),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 27.07, dy: 27.07), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 3.7, y: -3.36), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 237.35, y: 151.64), control2: CGPoint(x: 245.89, y: 148.45), end: CGPoint(x: 256, y: 148.45)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 148.36, y: 180.71)),
                    TPSVGInstrHorizontalLineTo(length: 363.7),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.57, dy: 10.57), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 10.76, y: 10.76), relative: true),
                    TPSVGInstrVerticalLineTo(length: 75.29, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.56, dy: 10.56), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -10.76, y: 10.75), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 277.56),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -10.76, y: -10.75), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 245.26),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -10.76, y: 10.75), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 148.36),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.57, dy: 10.57), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -10.77, y: -10.75), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 7.59, dy: 7.59), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: -2), relative: true),
                    TPSVGInstrVerticalLineTo(length: 191.47),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.58, dy: 10.58), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 148.36, y: 180.71)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 234.5, y: 299)),
                    TPSVGInstrHorizontalLineTo(length: 43.06, relative: true),
                    TPSVGInstrVerticalLineTo(length: 10.76, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -10.76, y: 10.75), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 245.26),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -10.76, y: -10.75), relative: true),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    if parsedPath.instructions.count == expectedInstructions.count {
                        for i in 0..<parsedPath.instructions.count {
                            expect(parsedPath.instructions[i]) == expectedInstructions[i]
                        }
                    }
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

                let expectedInstructions: [TPSVGInstruction] = [
                    TPSVGInstrMoveTo(point: CGPoint(x: 242, y: 116)),
                    TPSVGInstrVerticalLineTo(length: 16.62, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 42.11, dy: 42.11), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -22.31, y: 60.82), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 185.12, y: 284.0)),
                    TPSVGInstrHorizontalLineTo(length: 144),
                    TPSVGInstrVerticalLineTo(length: 28, relative: true),
                    TPSVGInstrHorizontalLineTo(length: 30.19, relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 158, y: 354)),
                    TPSVGInstrVerticalLineTo(length: 42, relative: true),
                    TPSVGInstrHorizontalLineTo(length: 14, relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 35.88, y: -84), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 242),
                    TPSVGInstrVerticalLineTo(length: 14, relative: true),
                    TPSVGInstrHorizontalLineTo(length: 28, relative: true),
                    TPSVGInstrVerticalLineTo(length: 312),
                    TPSVGInstrHorizontalLineTo(length: 34.12, relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 340, y: 396)),
                    TPSVGInstrHorizontalLineTo(length: 14, relative: true),
                    TPSVGInstrVerticalLineTo(length: 354),
                    TPSVGInstrLineTo(point: CGPoint(x: -16.19, y: -42), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 368),
                    TPSVGInstrVerticalLineTo(length: 284),
                    TPSVGInstrHorizontalLineTo(length: 326.88),
                    TPSVGInstrLineTo(point: CGPoint(x: -34.57, y: -90.56), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 42.11, dy: 42.11), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 270, y: 132.62)),
                    TPSVGInstrVerticalLineTo(length: 116),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 14, y: 42), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 14, dy: 14), xAxisRotation: 0, largeArcFlag: true, sweepFlag: true, end: CGPoint(x: -14, y: 14), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 14, dy: 14), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 256, y: 158)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: -5.69, y: 55.56), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 37, dy: 37), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 11.38, y: 0), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 291.88, y: 284)),
                    TPSVGInstrHorizontalLineTo(length: 270),
                    TPSVGInstrVerticalLineTo(length: 270),
                    TPSVGInstrHorizontalLineTo(length: 242),
                    TPSVGInstrVerticalLineTo(length: 14, relative: true),
                    TPSVGInstrHorizontalLineTo(length: 220.12),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    if parsedPath.instructions.count == expectedInstructions.count {
                        for i in 0..<parsedPath.instructions.count {
                            expect(parsedPath.instructions[i]) == expectedInstructions[i]
                        }
                    }
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
                    // 0 - 4
                    TPSVGInstrMoveTo(point: CGPoint(x: 256, y: 116)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -10.77, y: 10.77), relative: true),
                    TPSVGInstrVerticalLineTo(length: 1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -8.71, y: 10.56), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -2.46, y: 0.4), control2: CGPoint(x: -4.9, y: 0.86), end: CGPoint(x: -7.32, y: 1.41), relative: true),

                    // 5 - 9
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -12, y: -6.42), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -0.71, y: -1.68), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: -19.9, y: 8.25), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 0.72, y: 1.72), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.57, dy: 10.57), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -4, y: 13.06), relative: true),

                    // 10 - 14
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: -6.18, y: 4.12), control1: CGPoint(x: -3.16, y: 2), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -13.59, y: -1.32), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.31, y: -1.3), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.76, dy: 10.76), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 157, y: 172.24)),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.3, y: 1.31), relative: true),

                    // 15 - 19
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 1.32, y: 13.59), relative: true),
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: -4.12, y: 6.18), control1: CGPoint(x: -2.14, y: 3), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.61, dy: 10.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -13.08, y: 4), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.7, y: -0.72), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.78, dy: 10.78), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: -8.27, y: 19.9), relative: true),

                    // 20 - 24
                    TPSVGInstrLineTo(point: CGPoint(x: 1.68, y: 0.69), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.61, dy: 10.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 6.44, y: 12), relative: true),
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: -1.43, y: 7.32), control1: CGPoint(x: -0.83, y: 3.63), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.58, dy: 10.58), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -10.54, y: 8.71), relative: true),
                    TPSVGInstrHorizontalLineTo(length: -1.85, relative: true),

                    // 25 - 29
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 0, y: 21.54), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 10.56, y: 8.71), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0.4, y: 2.46), control2: CGPoint(x: 0.86, y: 4.9), end: CGPoint(x: 1.41, y: 7.32), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -6.42, y: 12), relative: true),

                    // 30 - 34
                    TPSVGInstrLineTo(point: CGPoint(x: -1.68, y: 0.71), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 8.25, y: 19.9), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.72, y: -0.72), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 13.08, y: 4), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 1.32, y: 2.11), control2: CGPoint(x: 2.68, y: 4.18), end: CGPoint(x: 4.13, y: 6.21), relative: true),

                    // 35 - 39
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -1.33, y: 13.58), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 157, y: 339.78)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 172.24, y: 355)),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.33, y: -1.31), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.58, dy: 10.58), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 13.57, y: -1.34), relative: true),

                    // 40 - 44
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: 6.2, y: 4.14), control1: CGPoint(x: 3, y: 2.16), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 4, y: 13.08), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -0.72, y: 1.71), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 19.9, y: 8.26), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 0.69, y: -1.68), relative: true),

                    // 45 - 49
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.61, dy: 10.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 12, y: -6.44), relative: true),
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: 7.32, y: 1.43), control1: CGPoint(x: 3.63, y: 0.82), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.55, dy: 10.55), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 8.69, y: 10.52), relative: true),
                    TPSVGInstrVerticalLineTo(length: 1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 21.54, y: 0), relative: true),

                    // 50 - 54
                    TPSVGInstrVerticalLineTo(length: -1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 8.71, y: -10.56), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 2.46, y: -0.4), control2: CGPoint(x: 4.9, y: -0.86), end: CGPoint(x: 7.32, y: -1.41), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 12.0, y: 6.42), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 0.71, y: 1.68), relative: true),

                    // 55 - 59
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 19.9, y: -8.25), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -0.72, y: -1.72), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 4, y: -13.08), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 2.11, y: -1.32), control2: CGPoint(x: 4.18, y: -2.68), end: CGPoint(x: 6.21, y: -4.13), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 13.58, y: 1.33), relative: true),

                    // 60 - 64
                    TPSVGInstrLineTo(point: CGPoint(x: 1.31, y: 1.32), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 355, y: 339.76)),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.31, y: -1.33), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.58, dy: 10.58), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -1.34, y: -13.57), relative: true),
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: 4.14, y: -6.2), control1: CGPoint(x: 2.16, y: -3), relative: true),

                    // 65 - 69
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 13.08, y: -4), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.71, y: 0.72), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 8.26, y: -19.9), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.68, y: -0.69), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.61, dy: 10.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -6.44, y: -12), relative: true),

                    // 70 - 74
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: 1.43, y: -7.32), control1: CGPoint(x: 0.82, y: -3.63), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.55, dy: 10.55), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 10.52, y: -8.69), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: -21.54), relative: true),
                    TPSVGInstrHorizontalLineTo(length: -1.85, relative: true),

                    // 75 - 79
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -10.56, y: -8.71), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -0.4, y: -2.46), control2: CGPoint(x: -0.86, y: -4.9), end: CGPoint(x: -1.41, y: -7.32), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 6.42, y: -12), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.68, y: -0.71), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: -8.25, y: -19.9), relative: true),

                    // 80 - 84
                    TPSVGInstrLineTo(point: CGPoint(x: -1.72, y: 0.72), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -13.08, y: -4), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -1.32, y: -2.11), control2: CGPoint(x: -2.68, y: -4.18), end: CGPoint(x: -4.13, y: -6.21), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 1.33, y: -13.58), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.32, y: -1.31), relative: true),

                    // 85 - 89
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 339.76, y: 157)),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.31, y: 1.33), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -13.59, y: 1.35), relative: true),
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: -6.2, y: -4.15), control1: CGPoint(x: -3, y: -2.17), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -4, y: -13.08), relative: true),

                    // 90 - 94
                    TPSVGInstrLineTo(point: CGPoint(x: 0.72, y: -1.7), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.78, dy: 10.78), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: -19.9, y: -8.27), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -0.71, y: 1.68), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.61, dy: 10.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -12, y: 6.44), relative: true),
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: -7.32, y: -1.43), control1: CGPoint(x: -3.63, y: -0.83), relative: true),

                    // 95 - 99
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.57, dy: 10.57), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -8.69, y: -10.54), relative: true),
                    TPSVGInstrVerticalLineTo(length: -1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 256, y: 116)),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 0, y: 53.85), relative: true),

                    // 100 - 104
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 86.12, dy: 86.12), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 85.42, y: 75.38), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 297.54),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 42.16, dy: 42.16), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -53, y: -30.58), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -22, y: -38.07), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 85.71, dy: 85.71), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 256, y: 169.85)),

                    // 105 - 109
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: -52, y: 17.58), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 21.86, y: 37.86), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 42.93, dy: 42.93), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: 61.4), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 204, y: 324.55)),

                    // 110 - 114
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 85.93, dy: 85.93), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 0, y: -137.12), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 52, y: 47), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 21.54, dy: 21.54), xAxisRotation: 0, largeArcFlag: true, sweepFlag: true, end: CGPoint(x: 234.46, y: 256)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 21.54, dy: 21.54), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 256, y: 234.46)),

                    // 115 - 119
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 41.54, y: 32.31), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 43.88, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 86.14, dy: 86.14), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -118.84, y: 68.65), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 22, y: -38.09), relative: true),

                    // 120 - 122
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 42.38, dy: 42.38), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 256, y: 299.08)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 43, dy: 43), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 297.54, y: 266.77)),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    if parsedPath.instructions.count == expectedInstructions.count {
                        for i in 0..<parsedPath.instructions.count {
                            expect(parsedPath.instructions[i]) == expectedInstructions[i]
                        }
                    }
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
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 73, dy: 73), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -95.92, y: 69.37), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 71.86, dy: 71.86), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 4.92, y: 26.23), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 124.68, y: 345.42)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 29.64, dy: 29.64), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 41.92, y: 41.92), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 296.73, y: 257.2)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 72.22, dy: 72.22), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 323, y: 262.1)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 73, dy: 73), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 69.33, y: -95.93), relative: true),
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
