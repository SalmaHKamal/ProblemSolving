import Foundation

func migratoryBirds(arr: [Int]) -> Int {
	var dict = [String: Int]()
	arr.forEach { element in
		if let oldValue = dict["\(element)"] {
			dict.updateValue(oldValue + 1 , forKey: "\(element)")
		} else {
			dict.updateValue(1, forKey: "\(element)")
		}
	}

	let maxOccurances = dict.values.max()
	let birdIds = dict.filter({ $1 == maxOccurances })
	let minBirdId = birdIds.keys.compactMap({ Int($0) }).min()
	return minBirdId!
}

migratoryBirds(arr: [1, 2, 2, 3])
