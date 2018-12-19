//
//  SVGSpecElement.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//

/**
 TODO: Add documentation
 */
enum SVGSpecElement: String {

    internal typealias RawValue = String

    /**
     TODO: Add documentation
     */
    case svg = "svg"

    /**
     TODO: Add documentation
     */
    case style = "style"

    /**
     TODO: Add documentation
     */
    case rect = "rect"

    /**
     TODO: Add documentation
     */
    case circle = "circle"

    /**
     TODO: Add documentation
     */
    case ellipse = "ellipse"

    /**
     TODO: Add documentation
     */
    case audio = "audio"

    /**
     TODO: Add documentation
     */
    case canvas = "canvas"

    /**
     TODO: Add documentation
     */
    case foreign = "foreignObject"

    /**
     TODO: Add documentation
     */
    case group = "g"

    /**
     TODO: Add documentation
     */
    case iframe = "iframe"

    /**
     TODO: Add documentation
     */
    case line = "line"

    /**
     A path represents the outline of a shape which can be filled or stroked.
     A path can also be used as a clipping path, to describe animation, or position text.
     A path can be used for more than one of these functions at the same time.

     SVG Spec:
     https://www.w3.org/TR/SVG2/paths.html#PathDataQuadraticBezierCommands
     */
    case path = "path"

    /**
     TODO: Add documentation
     */
    case polygon = "polygon"

    /**
     TODO: Add documentation
     */
    case polyline = "polyline"

    /**
     TODO: Add documentation
     */
    case text = "text"

    /**
     TODO: Add documentation
     */
    case textPath = "textPath"

    /**
     TODO: Add documentation
     */
    case tspan = "tspan"

    /**
     TODO: Add documentation
     */
    case video = "video"

}
