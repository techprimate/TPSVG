//
//  TPSVGPathDLexer.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

// swiftlint:disable identifier_name

class TPSVGPathDLexer {

    private let raw: String

    init(raw: String) {
        self.raw = raw
    }

    // swiftlint:disable cyclomatic_complexity function_body_length
    func parse() -> [TPSVGInstruction] {
        var result = [TPSVGInstruction]()

        var data: [Character] = []

        for c in raw {
            if DChars.commands.map({ $0.rawValue }).contains(String(c).utf8CString[0]), let current = result.last {
                parseData(raw: String(data), curr: current)
                data = []
            }

            switch String(c).utf8CString[0] {
            case DChars.A.rawValue:
                result.append(TPSVGInstrEllipticalArcCurve(end: .zero, radius: .zero, xAxisRotation: 0, largeArcFlag: false, sweepFlag: false))
            case DChars.a.rawValue:
                result.append(TPSVGInstrEllipticalArcCurve(end: .zero, radius: .zero, xAxisRotation: 0,
                                                           largeArcFlag: false, sweepFlag: false, relative: true))
            case DChars.C.rawValue:
                result.append(TPSVGInstrCubicCurve(end: .zero, control1: .zero, control2: .zero))
            case DChars.c.rawValue:
                result.append(TPSVGInstrCubicCurve(end: .zero, control1: .zero, control2: .zero, relative: true))
            case DChars.H.rawValue:
                result.append(TPSVGInstrHorizontalLineTo(length: 0))
            case DChars.h.rawValue:
                result.append(TPSVGInstrHorizontalLineTo(length: 0, relative: true))
            case DChars.L.rawValue:
                result.append(TPSVGInstrLineTo(point: .zero))
            case DChars.l.rawValue:
                result.append(TPSVGInstrLineTo(point: .zero, relative: true))
            case DChars.M.rawValue:
                result.append(TPSVGInstrMoveTo(point: .zero))
            case DChars.m.rawValue:
                result.append(TPSVGInstrMoveTo(point: .zero, relative: true))
            case DChars.Q.rawValue:
                result.append(TPSVGInstrQuadraticCurve(end: .zero, control1: .zero))
            case DChars.q.rawValue:
                result.append(TPSVGInstrQuadraticCurve(end: .zero, control1: .zero, relative: true))
            case DChars.S.rawValue:
                result.append(TPSVGInstrSmoothCubicCurve(end: .zero, control2: .zero))
            case DChars.s.rawValue:
                result.append(TPSVGInstrSmoothCubicCurve(end: .zero, control2: .zero, relative: true))
            case DChars.T.rawValue:
                result.append(TPSVGInstrSmoothQuadraticCurve(end: .zero, control2: .zero))
            case DChars.t.rawValue:
                result.append(TPSVGInstrSmoothQuadraticCurve(end: .zero, control2: .zero, relative: true))
            case DChars.V.rawValue:
                result.append(TPSVGInstrVerticalLineTo(length: 0))
            case DChars.v.rawValue:
                result.append(TPSVGInstrVerticalLineTo(length: 0, relative: true))
            case DChars.Z.rawValue,
                 DChars.z.rawValue:
                result.append(TPSVGInstrClosePath())
            default:
                data.append(c)
            }
        }

        if !data.isEmpty, let curr = result.last {
            parseData(raw: String(data), curr: curr)
        }

        return result
    }

    private func parseData(raw: String, curr: TPSVGInstruction) {
        var values: [CGFloat] = []
        var valueData: [Character] = []
        for c in raw {
            switch String(c).utf8CString[0] {
            case DChars.comma.rawValue,
                 DChars.space.rawValue:
                if let parsed = TPSVGNumberParser.parse(String(valueData)) {
                    values.append(parsed.value)
                }
                valueData = []
            case DChars.sign.rawValue:
                if let parsed = TPSVGNumberParser.parse(String(valueData)) {
                    values.append(parsed.value)
                }
                valueData = [c]
            default:
                valueData.append(c)
            }
        }
        if !valueData.isEmpty {
            if let parsed = TPSVGNumberParser.parse(String(valueData)) {
                values.append(parsed.value)
            }
            valueData = []
        }
        if let moveTo = curr as? TPSVGInstrMoveTo {
            guard values.count == 2 else {
                return
            }
            moveTo.point.x = values[0]
            moveTo.point.y = values[1]
        } else if let cubicCurve = curr as? TPSVGInstrCubicCurve {
            guard values.count == 6 else {
                return
            }
            cubicCurve.end.x = values[0]
            cubicCurve.end.y = values[1]

            cubicCurve.control1.x = values[2]
            cubicCurve.control1.y = values[3]

            cubicCurve.control2.x = values[4]
            cubicCurve.control2.y = values[5]
        } else if let line = curr as? TPSVGInstrHorizontalLineTo {
            guard values.count == 1 else {
                return
            }
            line.length = values[0]
        } else if let line = curr as? TPSVGInstrVerticalLineTo {
            guard values.count == 1 else {
                return
            }
            line.length = values[0]
        } else if let line = curr as? TPSVGInstrLineTo {
            guard values.count == 2 else {
                return
            }
            line.point.x = values[0]
            line.point.y = values[1]
        } else if let ellArc = curr as? TPSVGInstrEllipticalArcCurve {
            guard values.count == 7 else {
                return
            }
            ellArc.radius.dx = values[0]
            ellArc.radius.dy = values[1]
            ellArc.xAxisRotation = values[2]

            ellArc.largeArcFlag = values[3] == 1
            ellArc.sweepFlag = values[4] == 1

            ellArc.end.x = values[5]
            ellArc.end.y = values[6]
        }
    }
}

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
    case space = 32

    static var commands: [DChars] {
        return [.A, .a, .C, .c, .H, .h, .L, .l, .M, .m, .Q, .q, .S, .s, .T, .t, .V, .v, .Z, .z]
    }
}
