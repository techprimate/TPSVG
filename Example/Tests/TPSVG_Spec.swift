import Quick
import Nimble
@testable import TPSVG

class TPSVGSpec: QuickSpec {

    override func spec() {
        describe("TPSVG") {

            it("can be initalized with a string") {
                expect("raw") == "raw"
            }
        }
    }
}
