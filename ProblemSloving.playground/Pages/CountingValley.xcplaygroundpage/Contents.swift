
func countingValleys(steps: Int, path: String) -> Int {
	var numOfValleys = 0
	var stepTracker = 0

	path.forEach { char in
		if char == "U" {
			stepTracker += 1
		} else {
			stepTracker -= 1
		}
		
		if char == "U" && stepTracker == 0 {
			numOfValleys += 1
		}
	}
	return numOfValleys
}

// another solution O(n)
//func countingValleys(steps: Int, path: String) -> Int {
//	return path.reduce(into: (valleys: 0, seaLevel: 0)) {
//		$0.seaLevel += ($1 == "U" ? 1 : -1)
//		$0.valleys += ($1 == "U" && $0.seaLevel == 0) ? 1 : 0
//	}.valleys
//}

countingValleys(steps: 8, path: "UDDDUDUU")
