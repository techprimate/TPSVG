//
//  TPSVGTransformLexer_Spec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

class TPSVGTransformLexer_Spec: QuickSpec {

    override func spec() {
        describe("TPSVGValueLexer_Spec") {
            
            describe("parser") {

                describe("single transform") {

                    it("should parse scale") {
                        expect(TPSVGTransformLexer.parse(raw: "scale(2, .5)")) == [
                            TPSVGTransform.scale(x: 2, y: 0.5)
                        ]
                    }

                    it("should parse scale x") {
                        expect(TPSVGTransformLexer.parse(raw: "scaleX(3.123)")) == [
                            TPSVGTransform.scaleX(factor: 3.123)
                        ]
                    }

                    it("should parse scale y") {
                        expect(TPSVGTransformLexer.parse(raw: "scaleY(3.123)")) == [
                            TPSVGTransform.scaleY(factor: 3.123)
                        ]
                    }

                    it("should parse translate") {
                        expect(TPSVGTransformLexer.parse(raw: "translate(20, 35)")) == [
                            TPSVGTransform.translate(x: 20, y: 35)
                        ]
                    }

                    it("should parse translate with units") {
                        expect(TPSVGTransformLexer.parse(raw: "translate(20px, 35px)")) == [
                            TPSVGTransform.translate(x: 20, y: 35)
                        ]
                    }

                    it("should parse translate x") {
                        expect(TPSVGTransformLexer.parse(raw: "translateX(543)")) == [
                            TPSVGTransform.translateX(distance: 543)
                        ]
                    }

                    it("should parse translate x with unit") {
                        expect(TPSVGTransformLexer.parse(raw: "translateX(543px)")) == [
                            TPSVGTransform.translateX(distance: 543)
                        ]
                    }

                    it("should parse translate y") {
                        expect(TPSVGTransformLexer.parse(raw: "translateY(3.123)")) == [
                            TPSVGTransform.translateY(distance: 3.123)
                        ]
                    }

                    it("should parse translate y with unit") {
                        expect(TPSVGTransformLexer.parse(raw: "translateY(3.123px)")) == [
                            TPSVGTransform.translateY(distance: 3.123)
                        ]
                    }

                    it("should parse rotate") {
                        expect(TPSVGTransformLexer.parse(raw: "rotate(25)")) == [
                            TPSVGTransform.rotate(angle: 25)
                        ]
                    }

                    it("should parse rotate with unit") {
                        expect(TPSVGTransformLexer.parse(raw: "rotate(25deg)")) == [
                            TPSVGTransform.rotate(angle: 25)
                        ]
                    }

                    it("should parse skew x") {
                        expect(TPSVGTransformLexer.parse(raw: "skewX(25)")) == [
                            TPSVGTransform.skewX(angle: 25)
                        ]
                    }

                    it("should parse skew x with unit") {
                        expect(TPSVGTransformLexer.parse(raw: "skewX(25deg)")) == [
                            TPSVGTransform.skewX(angle: 25)
                        ]
                    }

                    it("should parse skew y") {
                        expect(TPSVGTransformLexer.parse(raw: "skewY(25)")) == [
                            TPSVGTransform.skewY(angle: 25)
                        ]
                    }

                    it("should parse skew y with unit") {
                        expect(TPSVGTransformLexer.parse(raw: "skewY(25deg)")) == [
                            TPSVGTransform.skewY(angle: 25)
                        ]
                    }

                    it("should parse matrix") {
                        let raw = "matrix(0.7071067811865475, 0.7071067811865476, -0.7071067811865476, 0.7071067811865475, -0.7071067811865497, 34.648232278140824)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.matrix(values: CGAffineTransform(a: 0.7071067811865475, b: 0.7071067811865476,
                                                                            c: -0.7071067811865476, d: 0.7071067811865475,
                                                                            tx: -0.7071067811865497, ty: 34.648232278140824))
                        ]
                    }
                }

                describe("multiple values") {

                    it("should parse multiple") {
                        let raw = "skewY(25deg) rotate(45deg) translate(24px, 25px)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.skewY(angle: 25),
                            TPSVGTransform.rotate(angle: 45),
                            TPSVGTransform.translate(x: 24, y: 25)
                        ]
                    }
                }
            }
        }
    }

}
