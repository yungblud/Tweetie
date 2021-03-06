/*
 * Copyright (c) 2016-2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

// this is a structure to accomodate for Twitter notion of
// a timeline cursor that minimizes re-fetching tweets
struct TimelineCursor {
  let maxId: Int64
  let sinceId: Int64

  init(max: Int64, since: Int64) {
    maxId = max
    sinceId = since
  }

  static var none: TimelineCursor { return TimelineCursor(max: Int64.max, since: 0) }
}

extension TimelineCursor: CustomStringConvertible {
  var description: String { return "[max: \(maxId), since: \(sinceId)]" }
}

extension TimelineCursor: Equatable {
  static func ==(lhs: TimelineCursor, rhs: TimelineCursor) -> Bool {
    return lhs.maxId==rhs.maxId && lhs.sinceId==rhs.sinceId
  }
}
