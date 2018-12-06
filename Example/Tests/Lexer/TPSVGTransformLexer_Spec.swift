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
                        let raw = "scale(2, .5)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.scale(x: 2, y: 0.5)
                        ]
                    }

                    it("should parse scale x") {
                        let raw = "scaleX(3.123)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.scaleX(factor: 3.123)
                        ]
                    }

                    it("should parse scale y") {
                        let raw = "scaleY(3.123)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.scaleY(factor: 3.123)
                        ]
                    }

                    it("should parse translate") {
                        let raw = "translate(20, 35)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.scale(x: 20, y: 35)
                        ]
                    }

                    it("should parse translate x") {
                        let raw = "translateX(543)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.translateX(distance: 543)
                        ]
                    }

                    it("should parse translate y") {
                        let raw = "translateY(3.123)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.translateY(distance: 3.123)
                        ]
                    }

                    it("should parse rotate") {
                        let raw = "rotate(25deg)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.rotate(angle: 25)
                        ]
                    }

                    it("should parse skew x") {
                        let raw = "skewX(25deg)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.skewX(angle: 25)
                        ]
                    }

                    it("should parse skew y") {
                        let raw = "skewY(25deg)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.skewY(angle: 25)
                        ]
                    }

                    it("should parse matrix") {
                        let raw = "matrix(0.7071067811865475, 0.7071067811865476, -0.7071067811865476, 0.7071067811865475, -0.7071067811865497, 34.648232278140824)"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.matrix(values: CGAffineTransform(a: 0.7071067811865475, b: 0.7071067811865476, c: -0.7071067811865476, d: 0.7071067811865475, tx: -0.7071067811865497, ty: 34.648232278140824))
                        ]
                    }
                }

                describe("multiple values") {

                    it("should parse multiple") {
                        let raw = "skewY(rotate(45deg) translate(24px, 25px))"
                        expect(TPSVGTransformLexer.parse(raw: raw)) == [
                            TPSVGTransform.rotate(angle: 45),
                            TPSVGTransform.translate(x: 24, y: 25)
                        ]
                    }
                }
            }
        }
    }

}
