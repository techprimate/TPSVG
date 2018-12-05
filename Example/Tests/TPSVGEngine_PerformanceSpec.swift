//
//  TPSVGEngine_PerformanceSpec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import XCTest
@testable import TPSVG

class TPSVGEngine_PerformanceSpec: XCTestCase {

    private func loadSVG(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "svg")!
        do {
            _ = try TPSVG(data: try Data(contentsOf: url))
        } catch {
            fatalError()
        }
    }

    func testFile1() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile2() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile3() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile4() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile5() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile6() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile7() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile8() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile9() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile10() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile11() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile12() {
        self.measure {
            loadSVG(name: "file-10-tiger")
        }
    }

    func testFile13_1() {
        self.measure {
            loadSVG(name: "file-13-icon-01")
        }
    }

    func testFile13_2() {
        self.measure {
            loadSVG(name: "file-13-icon-02")
        }
    }

    func testFile13_3() {
        self.measure {
            loadSVG(name: "file-13-icon-03")
        }
    }

    func testFile13_4() {
        self.measure {
            loadSVG(name: "file-13-icon-04")
        }
    }

    func testFile13_5() {
        self.measure {
            loadSVG(name: "file-13-icon-05")
        }
    }

    func testFile13_6() {
        self.measure {
            loadSVG(name: "file-13-icon-06")
        }
    }

    func testFile13_7() {
        self.measure {
            loadSVG(name: "file-13-icon-07")
        }
    }

    func testFile13_8() {
        self.measure {
            loadSVG(name: "file-13-icon-08")
        }
    }

    func testFile13_9() {
        self.measure {
            loadSVG(name: "file-13-icon-09")
        }
    }

    func testFile14() {
        self.measure {
            loadSVG(name: "file-14-v-line")
        }
    }

    func testFile15() {
        self.measure {
            loadSVG(name: "file-15-h-line")
        }
    }
}
