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

// swiftlint:disable type_name function_body_length

class TPSVGEngine_Spec: QuickSpec {

    override func spec() {
        describe("TPSVGEngine") {

            it("can parse empty data") {
                let url = Bundle.main.url(forResource: "empty", withExtension: "svg")!
                var data: Data!
                do {
                    data = try Data(contentsOf: url)
                } catch {
                    fail(error.localizedDescription)
                }

                let engine = TPSVGEngine()
                engine.parse(data)

                expect(engine.styles) == []
                expect(engine.paths) == []
            }

            it("can parse )
        }
    }
}
