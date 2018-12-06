//
//  TPSVGTransformLexer.swift
//  TPKulaLib
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGTransformLexer {

//    private static var transformList: String = {
//
//    }()

    /**
     https://www.w3.org/TR/css-transforms-1/#svg-syntax
     */
    internal static func parse(raw: String) -> [TPSVGTransform] {
        guard !raw.isEmpty else {
            return []
        }

        // plus
        //     U+002B PLUS SIGN
        let plus = "+"

        // plus
        //     U+002D HYPHEN MINUS
        let minus = "-"

        // signs
        //     Either a U+002B PLUS SIGN, or U+002D HYPHEN MINUS
        let sign = "[" + plus + minus + "]"

        // digits
        //     DIGIT from U+0030 to U+0039
        let digit = "[0-9]"

        // exponential
        //     Either a U+0045 CAPTIAL LETTER E, or U+0065 SMALL LETTER E
        let exponential = "[Ee]"

        // number
        //     sign? ( digit* . digit* | digit* | . digit*) exponential
        // https://www.w3.org/TR/css-syntax-3/#unicode-range-token-diagram
        let number = sign + "?(?:" + digit + "*\\." + digit + "*" + "|" + digit + "*|\\." + digit + ")" + "(?:" + exponential + sign + digit + "*" + ")"

        // left parenthesis )
        //     U+0028 LEFT PARENTHESIS
        let lePa = "\\("

        // right parenthesis )
        //     U+0029 RIGHT PARENTHESIS
        let riPa = "\\)"

        // comma ,
        //     U+002C COMMA
        let comma = "\\,"

        // wsp
        //     Either a U+000A LINE FEED, U+000D CARRIAGE RETURN, U+0009 CHARACTER TABULATION, or U+0020 SPACE.
        let wsp = "[\\f\\r\\t\\s]"

        // comma-wsp
        //     (wsp+ comma? wsp*) | (comma wsp*)
        let commaWsp = "(?:" + wsp + "+" + comma + "?" + wsp + "*|" + comma + wsp + "*)"

        // translate
        //     "translate" wsp* "(" wsp* number ( comma-wsp? number )? wsp* ")"
        let translate = "translate" + wsp + "*" + lePa + wsp + "*" + number + "(?:" + commaWsp + "?" + number + ")?" + wsp + "*" + riPa

        // scale
        //     "scale" wsp* "(" wsp* number ( comma-wsp? number )? wsp* ")"
        let scale = "scale" + wsp + "*" + lePa + wsp + "*" + number + "(?:" + commaWsp + "?" + number + ")?" + wsp + "*" + riPa

        // rotate
        //     "rotate" wsp* "(" wsp* number ( comma-wsp? number comma-wsp? number )? wsp* ")"
        let rotate = "rotate" + wsp + "*" + lePa + wsp + "*" + number + "(?:" + commaWsp + "?" + number + commaWsp + "?" + number + ")?" + wsp + "*" + riPa

        // skewX
        //     "skewX" wsp* "(" wsp* number wsp* ")"
        let skewX = "skewX" + wsp + "*" + lePa + wsp + "*" + number + wsp + "*" + riPa

        // skewY
        //     "skewY" wsp* "(" wsp* number wsp* ")"
        let skewY = "skewY" + wsp + "*" + lePa + wsp + "*" + number + wsp + "*" + riPa

        // matrix
        //     "matrix" wsp* "(" wsp*
        //         number comma-wsp?
        //         number comma-wsp?
        //         number comma-wsp?
        //         number comma-wsp?
        //         number comma-wsp?
        //         number wsp* ")"
        let matrix = "matrix" + wsp + "*" + lePa + wsp + "*"
            + number + commaWsp + "?"
            + number + commaWsp + "?"
            + number + commaWsp + "?"
            + number + commaWsp + "?"
            + number + commaWsp + "?"
            + number + commaWsp + "?" + wsp + "*" + riPa

        // transform
        //     matrix
        //         | translate
        //         | scale
        //         | rotate
        //         | skewX
        //         | skewY
        let transform = "(" + matrix + "|" + translate + "|" + scale + "|" + rotate + "|" + skewX + "|" + skewY + ")"

        // transforms
        //      transform
        //         | transform comma-wsp transform
        let transforms = "(?:" + transform + "|" + transform + "(" + commaWsp + transform + ")*)"

        // transform-list
        //       wsp* transforms? wsp*
        return wsp + "*" + transforms + "?" + wsp + "*"
        
        return try! TPRegex(pattern: transformList).match(in: raw).captures.compactMap(parse(method:))
    }

    private static func parse(method: String) -> TPSVGTransform? {
        return nil
    }
}
