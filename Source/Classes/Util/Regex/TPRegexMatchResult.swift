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
    internal let regex: NSRegularExpression

    /**
     TODO: documentation
     */
    internal let searchString: String

    /**
     TODO: documentation
     */
    internal let items: [NSTextCheckingResult]

    /**
     TODO: documentation
     */
    internal let captures: [String]

    /**
     TODO: documentation
     */
    internal init(regex: NSRegularExpression, searchString: String, items: [NSTextCheckingResult]) {
        self.regex = regex
        self.searchString = searchString
        self.items = items

        captures = items
            .reduce([], { (prev, result) in
                return prev + (1..<result.numberOfRanges).map({ result.range(at: $0) })
            })
            .compactMap({ range -> String? in
                if range.lowerBound >= 0 && range.lowerBound <= searchString.count
                    && range.upperBound >= 0 && range.upperBound <= searchString.count {
                    return (searchString as NSString).substring(with: range)
                }
                return nil
            })
    }

    internal var boolValue: Bool {
        return !captures.isEmpty
    }
}
