
func marsExploration(s: String) -> Int {
	let chars = ["S", "O", "S"]
	return s.enumerated().reduce(into: 0) { partialResult, element in
		if element.element.description != chars[element.offset % 3] {
			partialResult += 1
		}
	}
}

marsExploration(s: "AOSSSD")
