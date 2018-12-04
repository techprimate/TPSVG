//
//  TPRegex.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
struct TPRegex {

    /**
     TODO: documentation
     */
    private let pattern: String

    /**
     TODO: documentation
     */
    private let regex: NSRegularExpression

    /**
     TODO: documentation
     */
    public init(pattern: String) throws {
        self.pattern = pattern

        regex = try NSRegularExpression(pattern: pattern, options: [])
    }

    /**
     TODO: documentation
     */
    public func match(in value: String) -> TPRegexMatchResult {
        var matches: [NSTextCheckingResult] = []
        let range = NSRange(location: 0, length: value.count)

        regex.enumerateMatches(in: value, options: [], range: range) { (result, _, _) in
            if let result = result {
                matches.append(result)
            }
        }

        return TPRegexMatchResult(regex: regex, searchString: value, items: matches)
    }
}
