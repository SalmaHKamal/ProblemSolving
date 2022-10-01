import Foundation

func sockMerchant(n: Int, ar: [Int]) -> Int {
	var dict = [String: Int]()
	var result = 0
	
	for sockColor in ar {
		let oldValue = dict["\(sockColor)"] as? Int ?? 0
		if oldValue < 1  {
			let newValue = oldValue + 1
			dict.updateValue(newValue, forKey: "\(sockColor)")
		} else {
			dict.removeValue(forKey: "\(sockColor)")
			result += 1
		}
	}
	
	return result
}


sockMerchant(n: 9, ar: [10, 20, 20, 10, 10, 30, 50, 10, 20])
