//
//  TPSVGPolygon_Spec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//


import Quick
import Nimble
@testable import TPSVG

class TPSVGPolygon_Spec: QuickSpec {

    override func spec() {
        describe("TPSVGPolygon_Spec") {

            describe("initalize") {

                it("should read space separated values") {
                    let attributes = [
                        "points": "0 832.5 63.5 896 511.5 448 63.5 0 0 63.5 384.5 448 0 832.5"
                    ]
                    let polygon = TPSVGPolygon(attributes: attributes)
                    expect(polygon).toNot(beNil())
                    expect(polygon?.points) == [
                        CGPoint(x: 0, y: 832.5),
                        CGPoint(x: 63.5, y: 896),
                        CGPoint(x: 511.5, y: 448),
                        CGPoint(x: 63.5, y: 0),
                        CGPoint(x: 0, y: 63.5),
                        CGPoint(x: 384.5, y: 448),
                        CGPoint(x: 0, y: 832.5)
                    ]
                }

                it("should read comma separated values") {
                    let attributes = [
                        "points": "325,120 175,120 100,250 175,380 325,380 400,250"
                    ]
                    let polygon = TPSVGPolygon(attributes: attributes)
                    expect(polygon).toNot(beNil())
                    expect(polygon?.points) == [
                        CGPoint(x: 325, y: 120),
                        CGPoint(x: 175, y: 120),
                        CGPoint(x: 100, y: 250),
                        CGPoint(x: 175, y: 380),
                        CGPoint(x: 325, y: 380),
                        CGPoint(x: 400, y: 250)
                    ]
                }
            }
        }
    }
}
