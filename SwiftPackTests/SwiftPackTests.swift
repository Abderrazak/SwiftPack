//
//  SwiftPack_Tests.swift
//  SwiftPack Tests
//
//  Created by brian on 9/7/14.
//  Copyright (c) 2014 RantLab. All rights reserved.
//

import Cocoa
import XCTest
import SwiftPack

let simpleHex = "82 A3 66 6F 6F A3 62 61 72 A3 62 61 7A 01"
let msgPackCaseHex = "C2 C3 C0 00 CC 00 CD 00 00 CE 00 00 00 00 CF 00 00 00 00 00 00 00 00 D0 00 D1 00 00 D2 00 00 00 00 D3 00 00 00 00 00 00 00 00 FF D0 FF D1 FF FF D2 FF FF FF FF D3 FF FF FF FF FF FF FF FF 7F CC 7F CD 00 FF CE 00 00 FF FF CF 00 00 00 00 FF FF FF FF E0 D0 E0 D1 FF 80 D2 FF FF 80 00 D3 FF FF FF FF 80 00 00 00 CB 00 00 00 00 00 00 00 00 CB 80 00 00 00 00 00 00 00 CB 3F F0 00 00 00 00 00 00 CB BF F0 00 00 00 00 00 00 A1 61 DA 00 01 61 DB 00 00 00 01 61 A0 DA 00 00 DB 00 00 00 00 91 00 DC 00 01 00 DD 00 00 00 01 00 90 DC 00 00 DD 00 00 00 00 80 DE 00 00 DF 00 00 00 00 81 A1 61 61 DE 00 01 A1 61 61 DF 00 00 00 01 A1 61 61 91 90 91 91 A1 61"

class SwiftPack_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let simple = Unpacker.hexStringToByteArray(simpleHex)
        let msgPackCase =  Unpacker.hexStringToByteArray(msgPackCaseHex)
        
        
            println("Simple MsgPack")
            var result:AnyObject =  Unpacker.unPackByteArray(simple)
            println(result)
            
            //var bytes = pack(result)
            
            //print(bytes)
            println("MsgPack test case")
            result = Unpacker.unPackByteArray(msgPackCase)
            println(result)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPacker() {
        var data:Dictionary<String,Any>=[:]
        data["c"] = 3
        var packed = Packer.pack(data);
        
        var correct: [UInt8] = [0x81, 0xA1, 0x63, 0xD0, 0x03];
        if (packed.count == 5)
        {
            for var i = 0; i < packed.count; i++
            {
                if (correct[i] != packed[i])
                {
                    XCTAssertTrue(false, "Unexpected result")
                }
            }
        }
    }
}
