
func countingSort(arr: [Int]) -> [Int] {
	return arr.reduce(into: Array(repeating: 0, count: 100)) {
		$0[$1] += 1
	}
}

// my solution

//func countingSort(arr: [Int]) -> [Int] {
//	var frequencyArray = Array(repeating: 0, count: 100)
//	arr.forEach {
//		frequencyArray[$0] += 1
//	}
//	return frequencyArray
//}

let array = [1, 1, 3, 2, 1]
countingSort(arr: array)

