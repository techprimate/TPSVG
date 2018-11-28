//
//  UIImage+Pixel_Spec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 28.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

// swiftlint:disable type_name

class UIImage_Pixel_Spec: QuickSpec {

    override func spec() {
        describe("UIImage") {

            describe("Pixel") {

                let imageData = "iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAIAAAACDbGyAAAACXBIWXMAAAsTAAALEwEAmpwYAAAGGmlUWHRYTUw6Y29tLmFkb2Jl"
                    + "LnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4"
                    + "bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDUgNzkuMTYzNDk5LCAyMDE4LzA4"
                    + "LzEzLTE2OjQwOjIyICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRm"
                    + "LXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29t"
                    + "L3RpZmYvMS4wLyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwu"
                    + "b3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIg"
                    + "eG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUu"
                    + "Y29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiIHRpZmY6T3JpZW50YXRpb249IjEiIHhtcDpDcmVhdGVEYXRlPSIyMDE4"
                    + "LTExLTI4VDIxOjAwOjMzKzAxOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAxOC0xMS0yOFQyMjowNDozNiswMTowMCIgeG1wOk1ldGFk"
                    + "YXRhRGF0ZT0iMjAxOC0xMS0yOFQyMjowNDozNiswMTowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1v"
                    + "ZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo2"
                    + "MjM3ODBlNy0yMjM3LTRjNTEtOWM1Mi0zNWIxOGJlMzU3OGMiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hv"
                    + "cDo4NmJhNjdiNy0xMzY1LTY0NGYtYWQ4NC05ZjcyODhjYmYyNmEiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDow"
                    + "YzMwN2FmOS05YzI2LTQxYTctYTY1Ny05OWE1ZTc0NTM5MDYiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RF"
                    + "dnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDowYzMwN2FmOS05YzI2LTQxYTctYTY1Ny05OWE1ZTc0"
                    + "NTM5MDYiIHN0RXZ0OndoZW49IjIwMTgtMTEtMjhUMjE6NTk6MTMrMDE6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBo"
                    + "b3Rvc2hvcCBDQyAyMDE5IChNYWNpbnRvc2gpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZl"
                    + "ZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo2MjM3ODBlNy0yMjM3LTRjNTEtOWM1Mi0zNWIxOGJlMzU3OGMiIHN0RXZ0Ondo"
                    + "ZW49IjIwMTgtMTEtMjhUMjI6MDQ6MzYrMDE6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE5"
                    + "IChNYWNpbnRvc2gpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5PiA8L3JkZjpEZXNjcmlw"
                    + "dGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Phis0lYAAAAeSURBVAjXY/jPwMDw/z+CZACR"
                    + "QAwiETQE4pBH1g8Avtck3CGcXwAAAAAASUVORK5CYII="

                let data = Data(base64Encoded: imageData)!
                let image = UIImage(data: data)!

                it("can get single pixel color of image") {
                    let point = CGPoint(x: 0, y: 0)
                    expect(image.pixel(at: point)) == image.cgImage!.pixel(at: point)
                }

                it("should read multiple pixels of image") {
                    let points = (0..<Int(image.size.width)).map({ x in
                        return (0..<Int(image.size.height)).map({ y in
                            return CGPoint(x: x, y: y)
                        })
                    }).reduce([], { (result, points) -> [CGPoint] in
                        return result + points
                    })
                    expect(image.pixels(at: points)) == image.cgImage!.pixels(at: points)
                }
            }
        }
    }
}
