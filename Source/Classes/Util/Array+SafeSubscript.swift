//
//  Array+SafeSubscript.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 06.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

extension Array {

    subscript(safe index: Int) -> Element? {
        if index < 0 || index >= self.count {
            return nil
        }
        return self[index]
    }
}
