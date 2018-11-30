//
//  TPCSSEngine.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPCSSEngine {

    public var text: String = ""

    init() {}

    func parse() -> [TPSVGStyle] {
        let trimmed = text.replacingOccurrences(of: "^\\n|\\s|\\s+|\\s$", with: "", options: .regularExpression)
        var regex: NSRegularExpression!
        do {
            regex = try NSRegularExpression(pattern: "((?:[^\\{]*)\\{(?:[^\\}]*)\\})", options: .caseInsensitive)
        } catch {
            fatalError(error.localizedDescription)
        }
        regex.enumerateMatches(in: trimmed, options: [], range: NSRange(location: 0, length: trimmed.count)) { (result, _ , _) in
            print("-> ", result as Any)
            if let range = result?.range {
                print("-->", (trimmed as NSString).substring(with: range))
            }
        }
        return []
    }
}
