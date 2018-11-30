//
//  TPStack.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//

public struct TPStack<T> {

    fileprivate var array = [T]()

    public init(values: T...) {
        array.append(contentsOf: values)
    }

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    @discardableResult
    public mutating func push(_ element: T) -> TPStack<T> {
        array.append(element)
        return self
    }

    @discardableResult
    public mutating func pop(to count: Int? = nil) -> T? {
        if let count = count {
            var value: T?
            while self.count > count {
                value = array.popLast()
            }
            return value
        }
        return array.popLast()
    }

    public var top: T? {
        return array.last
    }
}

extension TPStack: CustomStringConvertible where T: CustomStringConvertible {

    public var description: String {
        return array.map({ $0.description }).joined(separator: "\n")
    }
}

extension TPStack: CustomDebugStringConvertible where T: CustomDebugStringConvertible {

    public var debugDescription: String {
        return array.map({ $0.debugDescription }).joined(separator: "\n")
    }
}
