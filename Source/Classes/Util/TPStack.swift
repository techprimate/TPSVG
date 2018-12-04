//
//  TPStack.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//

/**
 TODO: Add documentation
 */
public struct TPStack<T> {

    /**
     TODO: Add documentation
     */
    fileprivate var array = [T]()

    /**
     TODO: Add documentation
     */
    public init(values: T...) {
        array.append(contentsOf: values)
    }

    /**
     TODO: Add documentation
     */
    public var isEmpty: Bool {
        return array.isEmpty
    }

    /**
     TODO: Add documentation
     */
    public var count: Int {
        return array.count
    }

    /**
     TODO: Add documentation
     */
    @discardableResult
    public mutating func push(_ element: T) -> TPStack<T> {
        array.append(element)
        return self
    }

    /**
     TODO: Add documentation
     */
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

    /**
     TODO: Add documentation
     */
    public var top: T? {
        return array.last
    }
}

/**
 TODO: Add documentation
 */
extension TPStack: CustomStringConvertible where T: CustomStringConvertible {

    /**
     TODO: Add documentation
     */
    public var description: String {
        return array.map({ $0.description }).joined(separator: "\n")
    }
}

/**
 TODO: Add documentation
 */
extension TPStack: CustomDebugStringConvertible where T: CustomDebugStringConvertible {

    /**
     TODO: Add documentation
     */
    public var debugDescription: String {
        return array.map({ $0.debugDescription }).joined(separator: "\n")
    }
}
