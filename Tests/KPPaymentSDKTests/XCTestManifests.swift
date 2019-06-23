//
//  KPPaymentSDKTests.swift
//  KPPaymentSDKTests
//
//  Created by Zaid M. Said on 01/04/2018.
//  Copyright © 2018 Kiple Sdn Bhd. All rights reserved.
//

import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(KPPaymentSDKTests.allTests),
    ]
}
#endif
