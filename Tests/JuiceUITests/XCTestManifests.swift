//
//  XCTestManifests.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/2/19.

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(JuiceUITests.allTests),
    ]
}
#endif
