/* This program uses recursion
   to reverse a string.

   Sean McLeod
   2021/05/05
*/

extension String {
    /* this extension allows to get the nth character
    of a string, similar to Java's charAt*/
    var length: Int {
        return count
    }
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

func reverse(stringToReverse: String, stringLength: Int) -> String {
    // This function reverses a string
    if stringLength == 0 {
        return stringToReverse[0]
    } else {
        let singleChar = stringToReverse[stringLength]
        // return characters one by one
        return singleChar + reverse(stringToReverse: stringToReverse, stringLength: stringLength-1)
    }
}


let reversedString:String

// input
print("Enter a string to reverse: ")
let stringToReverse = readLine()

// pass & accept parameters
reversedString = reverse(stringToReverse: stringToReverse!, stringLength: stringToReverse!.count-1)
// output
print("\nreversed string: \(reversedString)")
