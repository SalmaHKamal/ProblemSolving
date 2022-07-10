import Foundation

// 65 => 90 Uppercase characters
// 97 => 122 lowercase English characters

// another sol
//func pangrams(s: String) -> String {
//	s.lowercased()
//		.unicodeScalars
//		.reduce(into: CharacterSet()) {
//			$0.insert($1)
//		}
//		.symmetricDifference(CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz "))
//		.isEmpty ? "pangram" : "not pangram"
//}

func pangrams(s: String) -> String {
	let uppercaseCharAsciiRange = 65...90
	let spaceAscii = 32
	var asciiCodes = Array(uppercaseCharAsciiRange)
	asciiCodes.append(spaceAscii)
	
	s.uppercased().forEach { char in
		let charAscii = Int(char.asciiValue!)
		asciiCodes.removeAll(where: { $0 == charAscii })
	}
	return asciiCodes.isEmpty ? "Pangram" : "Not Pangram"
}

pangrams(s: "We promptly judged antique ivory buckles for the prize")
