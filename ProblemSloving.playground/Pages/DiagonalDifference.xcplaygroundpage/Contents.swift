

// This Solution is better .. as we looped over the array once
func diagonalDifference(arr: [[Int]]) -> Int {
	let result = arr.enumerated().reduce([0,0]) {
		[$0[0] + $1.element[$1.offset], $0[1] + $1.element[arr.count - 1 - $1.offset]]
	}
	
	return abs(result[0] - result[1])
}

// mine
//func diagonalDifference(arr: [[Int]]) -> Int {
//	// Write your code here
//	var leftDiagonal = 0
//	var rightDiagonal = 0
//
//	for index in 0..<arr.count {
//		leftDiagonal += arr[index][index]
//	}
//
//	for index in 0..<arr.count {
//		rightDiagonal += arr[index][(arr.count - 1) - index]
//	}
//	return abs(leftDiagonal - rightDiagonal)
//}

diagonalDifference(arr: [[1,2,3], [4,5,6], [9,8,9]])
