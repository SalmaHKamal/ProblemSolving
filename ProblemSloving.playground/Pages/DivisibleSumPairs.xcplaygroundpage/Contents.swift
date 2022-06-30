import Cocoa

func isValidArrayLength(_ length: Int) -> Bool {
	return length >= 2 && length <= 100
}

func isValidDivisor(_ number: Int) -> Bool {
	return number >= 1 && number <= 100
}

func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
var result = 0

if isValidArrayLength(n) && isValidDivisor(k) {
	for outerIndex in 0..<n {
		for innerIndex in (outerIndex + 1)..<n {
			if (ar[outerIndex] + ar[innerIndex]) % k == 0 {
					result += 1
			}
		}
	}
}
return result
}
