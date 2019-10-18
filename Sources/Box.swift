//
//  Box.swift
//  SelectPlayer2
//
//  Created by Paul Bates on 10/3/19.
//  Copyright © 2019 Sonos, Inc. All rights reserved.
//

import Foundation

/// Provides an object wrapper around a struct or scalar, as may be required
/// when working with Objective-C based implementation
final public class Box<T> {
    /// Unboxed value
    public let unboxedValue: T
    
    public init(_ value: T) {
        unboxedValue = value
    }
    
    public func __conversion() -> T {
        return unboxedValue
    }
    
    /// Boxes a struct or scalar
    ///
    /// - Parameters
    ///     - value: Value to wrap in a box
    public static func from(value: T) -> Self {
        return Self(value)
    }
}

/// Boxes any struct or scalar
///
/// - Parameters
///     - value: Value to wrap in a box
public func box<T>(_ value: T) -> Box<T> {
    return Box.from(value: value)
}

// MARK: Equatable

extension Box: Equatable where T: Equatable {
    public static func == (lhs: Box<T>, rhs: Box<T>) -> Bool {
        lhs.unboxedValue == rhs.unboxedValue
    }
}

// MARK: Comparable

extension Box: Comparable where T: Comparable {
    public static func < (lhs: Box<T>, rhs: Box<T>) -> Bool {
        return lhs.unboxedValue < rhs.unboxedValue
    }

    public static func <= (lhs: Box<T>, rhs: Box<T>) -> Bool {
        return lhs.unboxedValue <= rhs.unboxedValue
    }

    public static func >= (lhs: Box<T>, rhs: Box<T>) -> Bool {
        return lhs.unboxedValue >= rhs.unboxedValue
    }

    public static func > (lhs: Box<T>, rhs: Box<T>) -> Bool {
        return lhs.unboxedValue > rhs.unboxedValue
    }
}

// MARK: Hashable

extension Box: Hashable where T : Hashable {
    public var hashValue: Int {
        return self.unboxedValue.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        self.unboxedValue.hash(into: &hasher)
    }
}
