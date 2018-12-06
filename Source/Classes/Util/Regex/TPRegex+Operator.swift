//
//  TPRegex+Operator.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 06.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

infix operator =~

/**
 * Match equatable used for switch-case
 */
internal func ~= (regex: TPRegex, value: String) -> Bool {
    return regex.match(in: value).boolValue
}
