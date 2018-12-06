//
//  TPSVGTransformLexer.swift
//  TPKulaLib
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGTransformLexer {

    // plus
    //     U+002B PLUS SIGN
    static let plus = "+"

    // plus
    //     U+002D HYPHEN MINUS
    static let minus = "-"

    // signs
    //     Either a U+002B PLUS SIGN, or U+002D HYPHEN MINUS
    static var sign: String = {
        return "[" + plus + minus + "]"
    }()

    // digits
    //     DIGIT from U+0030 to U+0039
    static let digit = "[0-9]"

    // exponential
    //     Either a U+0045 CAPTIAL LETTER E, or U+0065 SMALL LETTER E
    static let exponential = "[Ee]"

    // number
    //     sign? ( digit* . digit* | digit* | . digit*) exponential
    // https://www.w3.org/TR/css-syntax-3/#unicode-range-token-diagram
    static var number: String = {
        return sign + "?(?:" + digit + "*\\." + digit + "*" + "|" + digit + "*|\\." + digit + ")" + "(?:" + exponential + sign + digit + "*" + ")?"
    }()

    // left parenthesis )
    //     U+0028 LEFT PARENTHESIS
    static let lePa = "\\("

    // right parenthesis )
    //     U+0029 RIGHT PARENTHESIS
    static let riPa = "\\)"

    // comma ,
    //     U+002C COMMA
    static let comma = "\\,"

    // wsp
    //     Either a U+000A LINE FEED, U+000D CARRIAGE RETURN, U+0009 CHARACTER TABULATION, or U+0020 SPACE.
    static let wsp = "[\\f\\r\\t\\s]"

    // comma-wsp
    //     (wsp+ comma? wsp*) | (comma wsp*)
    static var commaWsp: String = {
        return "(?:" + wsp + "+" + comma + "?" + wsp + "*|" + comma + wsp + "*)"
    }()

    /**
     https://www.w3.org/TR/css-transforms-1/#svg-syntax
     */
    internal static func parse(raw: String) -> [TPSVGTransform] {
        guard !raw.isEmpty else {
            return []
        }

        // translate
        //     "translate" wsp* "(" wsp* number ( comma-wsp? number )? wsp* ")"
        //     Optional number unit 'px'
        let translate = "translate" + wsp + "*" + lePa + wsp + "*" + number + "(?:px)?(?:" + commaWsp + "?" + number + "(?:px)?)?" + wsp + "*" + riPa

        // translateX
        //     "translateX" wsp* "(" wsp* number wsp* ")"
        //     Optional number unit 'px'
        let translateX = "translateX" + wsp + "*" + lePa + wsp + "*" + number + "(?:px)?" + wsp + "*" + riPa

        // translateY
        //     "translateY" wsp* "(" wsp* number wsp* ")"
        //     Optional number unit 'px'
        let translateY = "translateY" + wsp + "*" + lePa + wsp + "*" + number + "(?:px)?" + wsp + "*" + riPa

        // scale
        //     "scale" wsp* "(" wsp* number ( comma-wsp? number )? wsp* ")"
        let scale = "scale" + wsp + "*" + lePa + wsp + "*" + number + "(?:" + commaWsp + "?" + number + ")?" + wsp + "*" + riPa

        // scaleX
        //     "scaleX" wsp* "(" wsp* number wsp* ")"
        let scaleX = "scaleX" + wsp + "*" + lePa + wsp + "*" + number + wsp + "*" + riPa

        // scaleY
        //     "scaleX" wsp* "(" wsp* number wsp* ")"
        let scaleY = "scaleY" + wsp + "*" + lePa + wsp + "*" + number + wsp + "*" + riPa

        // rotate
        //     "rotate" wsp* "(" wsp* number ( comma-wsp? number comma-wsp? number )? wsp* ")"
        //     Optional number unit 'deg'
        let rotate = "rotate" + wsp + "*" + lePa + wsp + "*" + number + "(?:deg)?(?:" + commaWsp + "?" + number + "(?:deg)?" + commaWsp + "?" + number + "(?:deg)?)?" + wsp + "*" + riPa

        // skewX
        //     "skewX" wsp* "(" wsp* number wsp* ")"
        //     Optional number unit 'deg'
        let skewX = "skewX" + wsp + "*" + lePa + wsp + "*" + number + "(?:deg)?" + wsp + "*" + riPa

        // skewY
        //     "skewY" wsp* "(" wsp* number wsp* ")"
        //     Optional number unit 'deg'
        let skewY = "skewY" + wsp + "*" + lePa + wsp + "*" + number + "(?:deg)?" + wsp + "*" + riPa

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
        let transform = "("
            + matrix + "|"
            + translate + "|"
            + translateX + "|"
            + translateY + "|"
            + scale + "|"
            + scaleX + "|"
            + scaleY + "|"
            + rotate + "|"
            + skewX + "|"
            + skewY
            + ")"

        // transforms
        //      transform
        //         | transform comma-wsp transform
        let transforms = "(?:" + transform + "|" + transform + "(" + commaWsp + transform + ")*)"

        // transform-list
        //       wsp* transforms? wsp*
        let transformList = wsp + "*" + transforms + "?" + wsp + "*"

        return try! TPRegex(pattern: transformList).match(in: raw).captures.compactMap(parse(method:))
    }

    // swiftlint:disable cyclomatic_complexity
    private static func parse(method: String) -> TPSVGTransform? {
        let translate = try! TPRegex(pattern: "translate" + wsp + "*" + lePa + wsp + "*(" + number + ")(?:px)?(?:" + commaWsp + "?(" + number + ")(?:px)?)?" + wsp + "*" + riPa)
        let translateX = try! TPRegex(pattern: "translateX" + wsp + "*" + lePa + wsp + "*(" + number + ")(?:px)?" + wsp + "*" + riPa)
        let translateY = try! TPRegex(pattern: "translateY" + wsp + "*" + lePa + wsp + "*(" + number + ")(?:px)?" + wsp + "*" + riPa)
        let scale = try! TPRegex(pattern: "scale" + wsp + "*" + lePa + wsp + "*(" + number + ")" + "(?:" + commaWsp + "?(" + number + "))?" + wsp + "*" + riPa)
        let scaleX = try! TPRegex(pattern: "scaleX" + wsp + "*" + lePa + wsp + "*(" + number + ")" + wsp + "*" + riPa)
        let scaleY = try! TPRegex(pattern: "scaleY" + wsp + "*" + lePa + wsp + "*(" + number + ")" + wsp + "*" + riPa)
        let rotate = try! TPRegex(pattern: "rotate" + wsp + "*" + lePa + wsp + "*(" + number + ")(?:deg)?" + "(?:" + commaWsp + "?(" + number + ")(?:deg)?" + commaWsp + "?(" + number + ")(?:deg)?)?" + wsp + "*" + riPa)
        let skewX = try! TPRegex(pattern: "skewX" + wsp + "*" + lePa + wsp + "*(" + number + ")(?:deg)?" + wsp + "*" + riPa)
        let skewY = try! TPRegex(pattern: "skewY" + wsp + "*" + lePa + wsp + "*(" + number + ")(?:deg)?" + wsp + "*" + riPa)
        let matrix = try! TPRegex(pattern: "matrix" + wsp + "*" + lePa + wsp + "*"
            + "(" + number + ")" + commaWsp + "?"
            + "(" + number + ")" + commaWsp + "?"
            + "(" + number + ")" + commaWsp + "?"
            + "(" + number + ")" + commaWsp + "?"
            + "(" + number + ")" + commaWsp + "?"
            + "(" + number + ")" + commaWsp + "?" + wsp + "*" + riPa)


        switch method {
        case translate:
            let captures = translate.match(in: method).captures
            guard let x = captures[safe: 0] else {
                return nil
            }
            return TPSVGTransform.translate(x: parse(number: x), y: parse(number: captures[safe: 1] ?? "0"))
        case translateX:
            let captures = translateX.match(in: method).captures
            guard let angle = captures[safe: 0] else {
                return nil
            }
            return TPSVGTransform.translateX(distance: parse(number: angle))
        case translateY:
            let captures = translateY.match(in: method).captures
            guard let angle = captures[safe: 0] else {
                return nil
            }
            return TPSVGTransform.translateY(distance: parse(number: angle))
        case scale:
            let captures = scale.match(in: method).captures
            guard let x = captures[safe: 0], let y = captures[safe: 1] else {
                return nil
            }
            return TPSVGTransform.scale(x: parse(number: x), y: parse(number: y))
        case scaleX:
            let captures = scaleX.match(in: method).captures
            guard let angle = captures[safe: 0] else {
                return nil
            }
            return TPSVGTransform.scaleX(factor: parse(number: angle))
        case scaleY:
            let captures = scaleY.match(in: method).captures
            guard let angle = captures[safe: 0] else {
                return nil
            }
            return TPSVGTransform.scaleY(factor: parse(number: angle))
        case rotate:
            let captures = rotate.match(in: method).captures
            guard let angle = captures[safe: 0] else {
                return nil
            }
            return TPSVGTransform.rotate(angle: parse(number: angle))
        case skewX:
            let captures = skewX.match(in: method).captures
            guard let angle = captures[safe: 0] else {
                return nil
            }
            return TPSVGTransform.skewX(angle: parse(number: angle))
        case skewY:
            let captures = skewY.match(in: method).captures
            guard let angle = captures[safe: 0] else {
                return nil
            }
            return TPSVGTransform.skewY(angle: parse(number: angle))
        case matrix:
            let captures = matrix.match(in: method).captures
            guard let valA = captures[safe: 0],
                let valB = captures[safe: 1],
                let valC = captures[safe: 2],
                let valD = captures[safe: 3],
                let tx = captures[safe: 4],
                let ty = captures[safe: 5] else {
                    return nil
            }
            return TPSVGTransform.matrix(a: parse(number: valA),
                                         b: parse(number: valB),
                                         c: parse(number: valC),
                                         d: parse(number: valD),
                                         e: parse(number: tx),
                                         f: parse(number: ty))
        default:
            return nil
        }
    }

    private static var numberRegex: TPRegex = {
        return try! TPRegex(pattern: "(^[+-]?)([0-9]*\\.?[0-9]*)?((?:[Ee][+-][0-9]*)?)")
    }()

    private static func parse(number raw: String) -> CGFloat {
        let values = numberRegex.match(in: raw).captures
        guard values.count == 3 else {
            return 0
        }
        return CGFloat((Double(values[0] + "1") ?? 1) * (Double(values[1]) ?? 0) * pow(10, Double(values[2]) ?? 0))
    }
}
