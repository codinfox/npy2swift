//
//  npy2swift.swift
//  npy2swift
//
//  Created by Zhihao Li on 4/30/16.
//  Copyright © 2016 CMU. All rights reserved.
//

import Foundation

public func npy2array<T>(filename: String, sample: T) -> [T] {
  let data = NSData(contentsOfFile: filename)

  // Get header length
  var headerLength : Int = 0
  data?.getBytes(&headerLength, range: NSRange(location: 8,length: 2))

  // Read header string
  let header = String(data: (data?.subdataWithRange(NSRange(location: 10, length: headerLength)))!, encoding: NSUTF8StringEncoding)

  // Parse shape
  let shapeStart = (header?.characters.indexOf(Character("("))?.advancedBy(1))!
  let shapeEnd = (header?.characters.indexOf(Character(")")))!
  var shape = header![shapeStart ..< shapeEnd].characters.split(Character(",")).map(String.init)
  for i in shape.indices {
    shape[i] = shape[i].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
  }

  // Number of elements in array
  let count = shape.reduce(1, combine: {$0 * Int($1)!})

  // Actually read data to array
  var result = Array<T>(count: count, repeatedValue: sample)
  data?.getBytes(&result, range: NSRange(location: 10 + headerLength, length: count * sizeof(T)))

  return result
}