//
//  TPSVGEngine_Spec_4.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 04.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

class TPSVGEngine_Spec_4: QuickSpec {

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

            describe("inline-style") {

                it("can parse inline-10") {
                    let engine = parse(file: "inline-01")

                    expect(engine.styles).to(contain([]))
                    expect(engine.elements) == [
                        TPSVGGroup(elements: [
                            TPSVGPath(classNames: [], inline: TPSVGStyle(name: "a", fill: TPSVGColor.black), instructions: [
                                TPSVGInstrMoveTo(point: CGPoint(x: 0, y: 7.5)),
                                TPSVGInstrLineTo(point: CGPoint(x: 0, y: 12.5)),
                                TPSVGInstrLineTo(point: CGPoint(x: 50, y: 12.5)),
                                TPSVGInstrLineTo(point: CGPoint(x: 50, y: 7.5)),
                                TPSVGInstrClosePath(),

                                TPSVGInstrMoveTo(point: CGPoint(x: 0, y: 22.5)),
                                TPSVGInstrLineTo(point: CGPoint(x: 0, y: 27.5)),
                                TPSVGInstrLineTo(point: CGPoint(x: 50, y: 27.5)),
                                TPSVGInstrLineTo(point: CGPoint(x: 50, y: 22.5)),
                                TPSVGInstrClosePath(),

                                TPSVGInstrMoveTo(point: CGPoint(x: 0, y: 37.5)),
                                TPSVGInstrLineTo(point: CGPoint(x: 0, y: 42.5)),
                                TPSVGInstrLineTo(point: CGPoint(x: 50, y: 42.5)),
                                TPSVGInstrLineTo(point: CGPoint(x: 50, y: 37.5)),
                                TPSVGInstrClosePath(),
                                ]),
                            ])
                    ]
                }
            }
        }
    }
}
