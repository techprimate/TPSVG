//
//  TPRegexMatchResult.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
struct TPRegexMatchResult {

    /**
     TODO: documentation
     */
    public let regex: NSRegularExpression

    /**
     TODO: documentation
     */
    public let searchString: String

    /**
     TODO: documentation
     */
    public let items: [NSTextCheckingResult]

    /**
     TODO: documentation
     */
    public let captures: [String]

    /**
     TODO: documentation
     */
    public init(regex: NSRegularExpression, searchString: String, items: [NSTextCheckingResult]) {
        self.regex = regex
        self.searchString = searchString
        self.items = items

        captures = items.flatMap { result in
            (1..<result.numberOfRanges).map { i in
                let range = result.range(at: i)
                return (searchString as NSString).substring(with: range)
            }
        }
    }
}
