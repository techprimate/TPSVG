import Quick
import Nimble
@testable import TPSVG

class SVGSpec: QuickSpec {

    override func spec() {
        describe("these will pass") {

            it("can do maths") {
                expect(23) == 23
            }

            it("can read") {
                expect("🐮") == "🐮"
            }
        }
    }
}
