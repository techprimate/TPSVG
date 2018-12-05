//
//  TPStack.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//

/**
 TODO: Add documentation
 */
struct TPStack<T> {

    /**
     TODO: Add documentation
     */
    fileprivate var array = [T]()

    /**
     TODO: Add documentation
     */
    internal init(values: T...) {
        array.append(contentsOf: values)
    }

    /**
     TODO: Add documentation
     */
    internal var isEmpty: Bool {
        return array.isEmpty
    }

    /**
     TODO: Add documentation
     */
    internal var count: Int {
        return array.count
    }

    /**
     TODO: Add documentation
     */
    @discardableResult
    internal mutating func push(_ element: T) -> TPStack<T> {
        array.append(element)
        return self
    }

    /**
     TODO: Add documentation
     */
    @discardableResult
    internal mutating func pop(to count: Int? = nil) -> T? {
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
    internal var top: T? {
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
    var description: String {
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
    var debugDescription: String {
        return array.map({ $0.debugDescription }).joined(separator: "\n")
    }
}
