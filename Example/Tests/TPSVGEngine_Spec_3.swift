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

            it("can parse file-13-icon-08") {
                let engine = parse(file: "file-13-icon-08")

                expect(engine.styles).to(contain([
                    TPSVGStyle(name: ".a", fill: TPSVGColor(hex: 0x0071bc)),
                    TPSVGStyle(name: ".b", fill: TPSVGColor.white)
                    ]))

                let expectedInstructions: [TPSVGInstruction] =  [
                    TPSVGInstrMoveTo(point: CGPoint(x: 256, y: 116)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -10.77, y: 10.77), relative: true),
                    TPSVGInstrVerticalLineTo(length: 1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -8.71, y: 10.56), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -2.46, y: 0.4), control2: CGPoint(x: -4.9, y: 0.86), end: CGPoint(x: -7.32, y: 1.41), relative: true),

                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -12, y: -6.42), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -0.71, y: -1.68), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: -19.9, y: 8.25), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 0.72, y: 1.72), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.57, dy: 10.57), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -4, y: 13.06), relative: true),

                    TPSVGInstrQuadraticCurve(end: CGPoint(x: -6.18, y: 4.12), control1: CGPoint(x: -3.16, y: 2), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -13.59, y: -1.32), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.31, y: -1.3), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.76, dy: 10.76), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 157, y: 172.24)),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.3, y: 1.31), relative: true),

                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 1.32, y: 13.59), relative: true),
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: -4.12, y: 6.18), control1: CGPoint(x: -2.14, y: 3), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.61, dy: 10.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -13.08, y: 4), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.7, y: -0.72), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.78, dy: 10.78), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: -8.27, y: 19.9), relative: true),

                    TPSVGInstrLineTo(point: CGPoint(x: 1.68, y: 0.69), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.61, dy: 10.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 6.44, y: 12), relative: true),
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: -0.83, y: 3.63), control1: CGPoint(x: -1.43, y: 7.32), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.58, dy: 10.58), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -10.54, y: 8.71), relative: true),
                    TPSVGInstrHorizontalLineTo(length: -1.85, relative: true),

                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 0, y: 21.54), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 10.56, y: 8.71), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 0.4, y: 2.46), control2: CGPoint(x: 0.86, y: 4.9), end: CGPoint(x: 1.41, y: 7.32)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -6.42, y: 12), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.68, y: 0.71), relative: true),

                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 8.25, y: 19.9), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.72, y: -0.72), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 13.08, y: 4), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 1.32, y: 2.11), control2: CGPoint(x: 2.68, y: 4.18), end: CGPoint(x: 4.13, y: 6.21)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -1.33, y: 13.58), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 157, y: 339.78)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 172.24, y: 355)),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.33, y: -1.31)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.58, dy: 10.58), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 13.57, y: -1.34), relative: true),
                    TPSVGInstrSmoothQuadraticCurve(end: CGPoint(x: 6.2, y: 4.14), control2: CGPoint(x: 3, y: 2.16), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 4, y: 13.08), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -0.72, y: 1.71)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 19.9, y: 8.26), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 0.69, y: -1.68)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.61, dy: 10.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 12, y: -6.44), relative: true),
                    TPSVGInstrSmoothQuadraticCurve(end: CGPoint(x: 7.32, y: 1.43), control2: CGPoint(x: 3.63, y: 0.82), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.55, dy: 10.55), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 8.69, y: 10.52), relative: true),
                    TPSVGInstrVerticalLineTo(length: 1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 21.54, y: 0), relative: true),
                    TPSVGInstrVerticalLineTo(length: -1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 8.71, y: -10.56), relative: true),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: 2.46, y: -0.4), control2: CGPoint(x: 4.9, y: -0.86), end: CGPoint(x: 7.32, y: -1.41), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.31, y: -1.33), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.58, dy: 10.58), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -1.34, y: -13.57), relative: true),
                    TPSVGInstrSmoothQuadraticCurve(end: CGPoint(x: 4.14, y: -6.2), control2: CGPoint(x: 2.16, y: -3), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 13.08, y: -4), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.71, y: 0.72)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: 8.26, y: -19.9)),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.68, y: -0.69)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.61, dy: 10.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -6.44, y: -12)),
                    TPSVGInstrSmoothQuadraticCurve(end: CGPoint(x: 1.43, y: -7.32), control2: CGPoint(x: 0.82, y: -3.63), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.55, dy: 10.55), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 10.52, y: -8.69)),
                    TPSVGInstrHorizontalLineTo(length: 1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 0, y: -21.54)),
                    TPSVGInstrHorizontalLineTo(length: -1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -10.56, y: -8.71)),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -0.4, y: -2.46), control2: CGPoint(x: -0.86, y: -4.9), end: CGPoint(x: -1.41, y: -7.32), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 6.42, y: -12)),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.68, y: -0.71)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: -8.25, y: -19.9)),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.72, y: 0.72)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -13.08, y: -4)),
                    TPSVGInstrCubicCurve(control1: CGPoint(x: -1.32, y: -2.11), control2: CGPoint(x: -2.68, y: -4.18), end: CGPoint(x: -4.13, y: -6.21), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.6, dy: 10.6), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 1.33, y: -13.58)),
                    TPSVGInstrLineTo(point: CGPoint(x: 1.32, y: -1.31)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 339.76, y: 157)),
                    TPSVGInstrLineTo(point: CGPoint(x: -1.31, y: 1.33)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -13.59, y: 1.35), relative: true),
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: -6.2, y: -4.15), control1: CGPoint(x: -3, y: -2.17), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.62, dy: 10.62), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -4, y: -13.08), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -0.72, y: -1.7)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.78, dy: 10.78), xAxisRotation: 0, largeArcFlag: true, sweepFlag: false, end: CGPoint(x: -19.9, y: -8.27), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -0.71, y: 1.68)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.61, dy: 10.61), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -12, y: 6.44), relative: true),
                    TPSVGInstrQuadraticCurve(end: CGPoint(x: -7.32, y: -1.43), control1: CGPoint(x: -3.63, y: -0.83), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.57, dy: 10.57), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -8.69, y: -10.54), relative: true),
                    TPSVGInstrVerticalLineTo(length: -1.85, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 10.77, dy: 10.77), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 256, y: 116), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 0, y: 53.85), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 86.12, dy: 86.12), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 85.42, y: 75.38), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 297.54),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 42.16, dy: 42.16), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: -53, y: -30.58), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: -22, y: -38.07)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 85.71, dy: 85.71), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 256, y: 169.85), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: -52, y: 17.58), relative: true),
                    TPSVGInstrMoveTo(point: CGPoint(x: 21.86, y: 37.86), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 42.93, dy: 42.93), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 0, y: 61.4), relative: true),
                    TPSVGInstrLineTo(point: CGPoint(x: 204, y: 324.55)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 85.93, dy: 85.93), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 0, y: -137.12), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 52, y: 47), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 21.54, dy: 21.54), xAxisRotation: 0, largeArcFlag: true, sweepFlag: true, end: CGPoint(x: 234.46, y: 256), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 0.54, dy: 21.54), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 256, y: 234.46), relative: true),
                    TPSVGInstrClosePath(),
                    TPSVGInstrMoveTo(point: CGPoint(x: 41.54, y: 32.31), relative: true),
                    TPSVGInstrHorizontalLineTo(length: 43.88, relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 86.14, dy: 86.14), xAxisRotation: 0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: -118.84, y: 68.65), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 42.38, dy: 42.38), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 256, y: 299.08)),
                    TPSVGInstrLineTo(point: CGPoint(x: 22, y: -38.09), relative: true),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 42.38, dy: 42.38), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 256, y: 299.08)),
                    TPSVGInstrEllipticalArcCurve(radius: CGVector(dx: 43, dy: 43), xAxisRotation: 0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 297.54, y: 266.77)),
                    TPSVGInstrClosePath(),

                    TPSVGInstrClosePath(),
                    TPSVGInstrClosePath(),
                    TPSVGInstrClosePath(),
                    TPSVGInstrClosePath(),
                    TPSVGInstrClosePath(),
                    TPSVGInstrClosePath(),
                    TPSVGInstrClosePath(),
                    TPSVGInstrClosePath()
                ]
                if engine.elements.count == 2, let parsedPath = engine.elements[1] as? TPSVGPath {
                    expect(parsedPath.instructions).to(haveCount(expectedInstructions.count))

                    //                    if parsedPath.instructions.count == expectedInstructions.count {
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
                    expect(parsedPath.instructions[60..<65]) == expectedInstructions[60..<65]
//                    expect(parsedPath.instructions[65..<60]) == expectedInstructions[65..<70]
//                    expect(parsedPath.instructions[70..<65]) == expectedInstructions[70..<75]
//                    expect(parsedPath.instructions[75..<60]) == expectedInstructions[75..<80]
//                    expect(parsedPath.instructions[80..<65]) == expectedInstructions[80..<85]
//                    expect(parsedPath.instructions[85..<60]) == expectedInstructions[85..<90]
//                    expect(parsedPath.instructions[90..<65]) == expectedInstructions[90..<95]
//                    expect(parsedPath.instructions[95..<100]) == expectedInstructions[95..<100]
//                    expect(parsedPath.instructions[100..<105]) == expectedInstructions[100..<105]
//                    expect(parsedPath.instructions[105..<110]) == expectedInstructions[105..<110]
//                    expect(parsedPath.instructions[110..<115]) == expectedInstructions[110..<115]
//                    expect(parsedPath.instructions[115..<120]) == expectedInstructions[115..<120]
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
