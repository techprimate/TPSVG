//
//  TPRegexMatchResult.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

struct TPRegexMatchResult {

    public let regex: NSRegularExpression
    public let searchString: String
    public let items: [NSTextCheckingResult]

    public let captures: [String]

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

    public var boolValue: Bool {
        return items.count > 0
    }

    subscript (i: Int) -> NSTextCheckingResult {
        return items[i]
    }

    subscript (i: Int) -> String {
        return captures[i]
    }
}
