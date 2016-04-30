//
//  npy2swiftTests.swift
//  npy2swiftTests
//
//  Created by Zhihao Li on 4/30/16.
//  Copyright © 2016 CMU. All rights reserved.
//

import XCTest
@testable import npy2swift

class npy2swiftTests: XCTestCase {
  // Load the test .npy file. The provided test contains 96*3*3*3 elements, all of which are 29
  func testExample() {
    let result : [Float] = npy2array("test.npy", sample: Float(0))
    for r in result {
      XCTAssertEqual(r, 29)
    }
    XCTAssertEqual(result.count, 96*3*3*3)
  }
}
