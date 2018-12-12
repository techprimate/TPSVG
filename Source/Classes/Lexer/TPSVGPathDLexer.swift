//
//  TPSVGPathDLexer.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

// swiftlint:disable identifier_name cyclomatic_complexity function_body_length

/**

 SVG Spec: https://www.w3.org/TR/SVG2/paths.html
 TODO: Add documentation
 */
class TPSVGPathDLexer {

    /**
     TODO: Add documentation
     */
    private let raw: String

    /**
     TODO: Add documentation
     */
    init(raw: String) {
        self.raw = raw
    }

    /**
     TODO: Add documentation
     */
    func parse() -> [TPSVGInstruction] {
        var result = [TPSVGInstruction]()

        var unparsedElements = [(DChars, String)]()
        var data: [Character] = []
        var currentC: DChars?

        for c in raw {
            let cC = String(c).utf8CString[0]
            if let thisCmd = DChars.command(from: cC) {
                if let cmd = currentC {
                    unparsedElements.append((cmd, String(data)))
                    data = []
                }
                currentC = thisCmd
            } else {
                data.append(c)
            }
        }

        if let current = currentC {
            unparsedElements.append((current, String(data)))
        }

        for (cmd, data) in unparsedElements {
            var currCmd = cmd
            var values: [CGFloat] = TPSVGValueLexer.parseValues(from: data)
            repeat {
                var element: TPSVGInstruction?
                switch currCmd {
                case .A:
                    element = TPSVGInstrEllipticalArcCurve(radius: .zero, xAxisRotation: 0,
                                                           largeArcFlag: false, sweepFlag: false, end: .zero)
                case .a:
                    element = TPSVGInstrEllipticalArcCurve(radius: .zero, xAxisRotation: 0,
                                                           largeArcFlag: false, sweepFlag: false,
                                                           end: .zero, relative: true)
                case .C:
                    element = TPSVGInstrCubicCurve(control1: .zero, control2: .zero, end: .zero)
                case .c:
                    element = TPSVGInstrCubicCurve(control1: .zero, control2: .zero, end: .zero, relative: true)
                case .H:
                    element = TPSVGInstrHorizontalLineTo(length: 0)
                case .h:
                    element = TPSVGInstrHorizontalLineTo(length: 0, relative: true)
                case .L:
                    element = TPSVGInstrLineTo(point: .zero)
                case .l:
                    element = TPSVGInstrLineTo(point: .zero, relative: true)
                case .M:
                    element = TPSVGInstrMoveTo(point: .zero)
                case .m:
                    element = TPSVGInstrMoveTo(point: .zero, relative: true)
                case .Q:
                    element = TPSVGInstrQuadraticCurve(end: .zero, control1: .zero)
                case .q:
                    element = TPSVGInstrQuadraticCurve(end: .zero, control1: .zero, relative: true)
                case .S:
                    element = TPSVGInstrSmoothCubicCurve(end: .zero, control2: .zero)
                case .s:
                    element = TPSVGInstrSmoothCubicCurve(end: .zero, control2: .zero, relative: true)
                case .T:
                    element = TPSVGInstrSmoothQuadraticCurve(end: .zero, control2: .zero)
                case .t:
                    element = TPSVGInstrSmoothQuadraticCurve(end: .zero, control2: .zero, relative: true)
                case .V:
                    element = TPSVGInstrVerticalLineTo(length: 0)
                case .v:
                    element = TPSVGInstrVerticalLineTo(length: 0, relative: true)
                case .Z, .z:
                    element = TPSVGInstrClosePath()
                default:
                    break
                }
                if let elem = element {
                    values = changeData(curr: elem, values: values)
                    result.append(elem)
                    if currCmd == DChars.M {
                        currCmd = DChars.L
                    } else if currCmd == DChars.m {
                        currCmd = DChars.l
                    }
                } else {
                    values = []
                }
            } while !values.isEmpty
        }

        return result
    }

    /**
     TODO: Add documentation
     */
    private func changeData(curr: TPSVGInstruction, values: [CGFloat]) -> [CGFloat] {
        var result: ArraySlice<CGFloat>?
        if let moveTo = curr as? TPSVGInstrMoveTo {
            guard values.count >= 2 else {
                return []
            }
            moveTo.point.x = values[0]
            moveTo.point.y = values[1]

            result = values[2...]
        } else if let line = curr as? TPSVGInstrHorizontalLineTo {
            guard values.count >= 1 else {
                return []
            }
            line.length = values[0]

            result = values[1...]
        } else if let line = curr as? TPSVGInstrVerticalLineTo {
            guard values.count >= 1 else {
                return []
            }
            line.length = values[0]

            result = values[1...]
        } else if let line = curr as? TPSVGInstrLineTo {
            guard values.count >= 2 else {
                return []
            }
            line.point.x = values[0]
            line.point.y = values[1]

            result = values[2...]
        } else if let cubicCurve = curr as? TPSVGInstrCubicCurve {
            guard values.count >= 6 else {
                return []
            }
            cubicCurve.control1.x = values[0]
            cubicCurve.control1.y = values[1]

            cubicCurve.control2.x = values[2]
            cubicCurve.control2.y = values[3]

            cubicCurve.end.x = values[4]
            cubicCurve.end.y = values[5]

            result = values[6...]
        } else if let cubicSmoothCurve = curr as? TPSVGInstrSmoothCubicCurve {
            guard values.count >= 4 else {
                return []
            }
            cubicSmoothCurve.control2.x = values[0]
            cubicSmoothCurve.control2.y = values[1]

            cubicSmoothCurve.end.x = values[2]
            cubicSmoothCurve.end.y = values[3]

            result = values[4...]
        } else if let quadCurve = curr as? TPSVGInstrQuadraticCurve {
            guard values.count >= 4 else {
                return []
            }
            quadCurve.control1.x = values[0]
            quadCurve.control1.y = values[1]

            quadCurve.end.x = values[2]
            quadCurve.end.y = values[3]

            result = values[4...]
        } else if let quadSmoothCurve = curr as? TPSVGInstrSmoothQuadraticCurve {
            guard values.count >= 4 else {
                return []
            }
            quadSmoothCurve.control2.x = values[0]
            quadSmoothCurve.control2.y = values[1]

            quadSmoothCurve.end.x = values[2]
            quadSmoothCurve.end.y = values[3]

            result = values[4...]
        } else if let ellArc = curr as? TPSVGInstrEllipticalArcCurve {
            guard values.count >= 7 else {
                return []
            }
            ellArc.radius.dx = values[0]
            ellArc.radius.dy = values[1]
            ellArc.xAxisRotation = values[2]

            ellArc.largeArcFlag = values[3] == 1
            ellArc.sweepFlag = values[4] == 1

            ellArc.end.x = values[5]
            ellArc.end.y = values[6]

            result = values[7...]
        }

        if let slice = result {
            return Array(slice)
        }
        return []
    }
}

/**
 TODO: Add documentation
 */
enum DChars: CChar {

    case A = 65
    case a = 97

    case C = 67
    case c = 99

    case H = 72
    case h = 104

    case L = 76
    case l = 108

    case M = 77
    case m = 109

    case Q = 81
    case q = 113

    case S = 83
    case s = 115

    case T = 84
    case t = 116

    case V = 86
    case v = 118

    case Z = 90
    case z = 122

    case comma = 44
    case sign = 45
    case dot = 46
    case space = 32

    /**
     TODO: Add documentation
     */
    static var commands: [DChars] {
        return [.A, .a, .C, .c, .H, .h, .L, .l, .M, .m, .Q, .q, .S, .s, .T, .t, .V, .v, .Z, .z]
    }

    /**
     TODO: Add documentation
     */
    static func command(from raw: CChar) -> DChars? {
        guard let dchar = DChars(rawValue: raw) else {
            return nil
        }
        switch dchar {
        case .comma, .sign, .space, .dot:
            return nil
        default:
            return dchar
        }
    }
}
