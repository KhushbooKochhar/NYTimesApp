//
//  NYTimesAppTests.swift
//  NYTimesAppTests
//
//  Created by Khushboo Kochar on 12/03/19.
//  Copyright © 2019 Khushboo Kochar. All rights reserved.
//

import XCTest
@testable import NYTimesApp





class NYTimesAppTests: XCTestCase {


    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         super.tearDown()
    }

    
    func testAsynchronousURLConnection() {
        let URL = NSURL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=W82VRNnMzr6RB3ZAtFp956d0vrj4mIuc")!
        let expectati = expectation(description: "GET \(URL)")
        
        let session = URLSession.shared
        let task = session.dataTask(with: URL as URL) { data, response, error in
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let HTTPResponse = response as? HTTPURLResponse,
                let responseURL = HTTPResponse.url
            {
                XCTAssertEqual(responseURL.absoluteString, URL.absoluteString, "HTTP response URL should be equal to original URL")
                XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
                
            } else {
                XCTFail("Response was not NSHTTPURLResponse")
            }
            
            expectati.fulfill()
        }
        
        task.resume()
        
        waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            task.cancel()
        }
    }

    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        
    }

}


