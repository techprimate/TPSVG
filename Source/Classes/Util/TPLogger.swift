//
//  TPLogger.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 12.12.18.
//

public class TPLogger {

    private static func fname(_ fileName: String) -> String {
        return (fileName as NSString).lastPathComponent
    }

    public class func debug(line: Int = #line, fileName: String = #file, funcName: String = #function, _ msg: Any...) {
        echo("💜 debug: \(fname(fileName)):" + stripFuncParameters(funcName) + ":\(line)", msg)
    }

    public class func warn(line: Int = #line, fileName: String = #file, funcName: String = #function, _ msg: Any...) {
        echo("⚠️ warn: \(fname(fileName)):" + stripFuncParameters(funcName) + ":\(line)", msg)
    }

    public class func info(line: Int = #line, fileName: String = #file, funcName: String = #function, _ msg: Any...) {
        echo("💚 info: \(fname(fileName)):" + stripFuncParameters(funcName) + ":\(line)", msg)
    }

    public class func error(line: Int = #line, fileName: String = #file, funcName: String = #function, _ msg: Any...) {
        echo("❌ ERROR: \(fname(fileName)):" + stripFuncParameters(funcName) + ":\(line)", msg)
    }

    public class func fatal(line: Int = #line, fileName: String = #file, funcName: String = #function, _ msg: Any...) {
        echo("☠️ FATAL: \(fname(fileName)):" + stripFuncParameters(funcName) + ":\(line)", msg)
    }

    private class func echo(_ info: String, _ msg: [Any] = []) {
        var output = ""
        if let msgs = msg as? [String] {
            output = info + " " + msgs.joined(separator: ", ")
        } else {
            let msgs = msg as [AnyObject]
            output = info + " " + msgs.map { return $0.debugDescription }.joined(separator: " ")
        }
        print(output)
    }

    private class func stripFuncParameters(_ funcName: String) -> String {
        if let openingIndex = funcName.index(of: "(") {
            return String(funcName[..<openingIndex])
        } else {
            return funcName
        }
    }
}
