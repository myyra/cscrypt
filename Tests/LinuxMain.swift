import XCTest

import CScryptTests

var tests = [XCTestCaseEntry]()
tests += CScryptTests.allTests()
XCTMain(tests)
