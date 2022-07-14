func twoArrays(k: Int, A: [Int], B: [Int]) -> String {
	let sortedArrayA = A.sorted()
	let sortedArrayB = B.sorted().reversed()
	
	for index in 0..<A.count {
		if sortedArrayA[index] + Array(sortedArrayB)[index] < k {
			return "NO"
		}
	}
	
	return "YES"
}
