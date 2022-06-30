import CoreFoundation

func flippingBits(n: Int) -> Int {
	return Int(UInt32.max - UInt32(n))
}
