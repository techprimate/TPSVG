//
//  TPSVGInstrClosePath.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 Path instruction indicating the current path should be closed.

 Used for creating complex paths.

 # SVG Specification

 Excerpt from [SVG 2.0 Specs](https://www.w3.org/TR/SVG2/paths.html#PathDataClosePathCommand):

 The 'closepath' (Z or z) ends the current subpath by connecting it back to its initial point.
 An automatic straight line is drawn from the current point to the initial point of the current subpath.
 This path segment may be of zero length.
 If a 'closepath' is followed immediately by a 'moveto', then the 'moveto' identifies the start point of the next subpath.
 If a 'closepath' is followed immediately by any other command, then the next subpath starts at the same initial point as the current subpath.

 When a subpath ends in a 'closepath', it differs in behavior from what happens when "manually" closing a subpath via a 'lineto' command in
 how ‘stroke-linejoin’ and ‘stroke-linecap’ are implemented.
 With 'closepath', the end of the final segment of the subpath is "joined" with the start of the initial segment of the subpath using the current
 value of ‘stroke-linejoin’. If you instead "manually" close the subpath via a "lineto" command, the start of the first segment and the end of the
 last segment are not joined but instead are each capped using the current value of ‘stroke-linecap’. At the end of the command, the new current
 point is set to the initial point of the current subpath.
 */
class TPSVGInstrClosePath: TPSVGInstruction {

    // MARK: - CustomStringConvertible

    // :nodoc:
    override var description: String {
        return String(describing: type(of: self)) + " {}"
    }

    // MARK: - CustomDebugStringConvertible

    // :nodoc:
    override var debugDescription: String {
        return String(describing: type(of: self)) + " {}"
    }

    // MARK: - Drawing

    /**
     Modifies a given path using the logic of this instruction.

     Calling this method will close the given `path`.
     To draw additional path information, a new path object needs to be created.

     - Parameter path: Active path, which should be modified
     - Parameter prev: Previous instruction if exists, might be null.
     - Parameter prevStartPoint: Start point of previous instruction, used to calculate control points with relative values
     */
    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        path.closeSubpath()
    }

    // MARK: - Equatable

    /**
     Checks if two instances of `TPSVGInstrClosePath` are equal.

     This method will always return **true**, as the instances never differ.
     */
    public static func == (lhs: TPSVGInstrClosePath, rhs: TPSVGInstrClosePath) -> Bool {
        return true
    }
}
