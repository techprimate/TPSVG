//
//  TPRegex.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

struct TPRegex {

    private let pattern: String
    private let regex: NSRegularExpression

    public init(pattern: String) throws {
        self.pattern = pattern

        regex = try NSRegularExpression(pattern: pattern, options: [])
    }

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
