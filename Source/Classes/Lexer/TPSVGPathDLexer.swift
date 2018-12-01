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

    func parse() -> [TPSVGInstruction] {
        var result = [TPSVGInstruction]()

        let chars = raw.utf8CString
        guard chars.count > 0, chars[0] == DChars.M.rawValue else {
            print("D-Paths should start with a 'M'")
            return []
        }

        var inst: TPSVGInstruction?

        for c in raw.utf8CString {
            switch c {
            case DChars.C.rawValue:
                inst = TPSVGInstrCubicCurve(end: .zero, control1: .zero, control2: .zero)
            case DChars.c.rawValue:
                inst = TPSVGInstrCubicCurve(end: .zero, control1: .zero, control2: .zero, relative: true)
            case DChars.H.rawValue:
                inst = TPSVGInstrLineTo(point: .zero)
            case DChars.h.rawValue:
                inst = TPSVGInstrLineTo(point: .zero, relative: true)
            default:
                break
            }
            print(c)
        }

        return []
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
}
