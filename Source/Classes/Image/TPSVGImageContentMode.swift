//
//  TPSVGImageContentMode.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 A flag used to determine how an SVG image is layed out in its bounds.
 */
public enum TPSVGImageContentMode {

    /**
     The option to scale the content to fit the size of itself by changing the aspect ratio of the content if necessary.
     */
    case scaleToFill

    /**
     The option to scale the content to fit the size of the view by maintaining the aspect ratio.
     Any remaining area of the view’s bounds is transparent.
     */
    case scaleAspectFit

    /**
     The option to scale the content to fill the size of the view. Some portion of the content may be clipped to fill the view’s bounds.
     */
    case scaleAspectFill

    /**
     The option to center the content in the view’s bounds, keeping the proportions the same.
     */
    case center

    /**
     The option to center the content aligned at the top in the view’s bounds.
     */
    case top

    /**
     The option to center the content aligned at the bottom in the view’s bounds.
     */
    case bottom

    /**
     The option to align the content on the left of the view.
     */
    case left

    /**
     The option to align the content on the right of the view.
     */
    case right

    /**
     The option to align the content in the top-left corner of the view.
     */
    case topLeft

    /**
     The option to align the content in the top-right corner of the view.
     */
    case topRight

    /**
     The option to align the content in the bottom-left corner of the view.
     */
    case bottomLeft

    /**
     The option to align the content in the bottom-right corner of the view.
     */
    case bottomRight

}
