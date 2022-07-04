import Foundation

public struct LinkedList<Value> {
	public var head: Node<Value>?
	public var tail: Node<Value>?
	public init() {}
	public var isEmpty: Bool {
		return head == nil
	}
}
extension LinkedList: CustomStringConvertible {
	public var description: String {
		guard let head = head else {
			return "Empty list"
		}
		return String(describing: head)
	}
}

// MARK: - Operations
extension LinkedList {
	/// Adds a value at the front of the list [O(1)]
	public mutating func push(_ value: Value) {
		head = Node(value: value, next: head)
		if tail == nil {
			tail = head
		}
	}
	
	/// Adds a value at the end of the list [O(1)]
	public mutating func append(_ value: Value) {
		// 1
		guard !isEmpty else {
			push(value)
			return
		}
		// 2
		tail!.next = Node(value: value)
		// 3
		tail = tail!.next
	}
	
	/// [O(n)]
	public func node(at index: Int) -> Node<Value>? {
	  // 1
	  var currentNode = head
	  var currentIndex = 0
	// 2
	  while currentNode != nil && currentIndex < index {
		currentNode = currentNode!.next
		currentIndex += 1
	  }
	  return currentNode
	}
	
	/// Adds a value after a particular node of the lis [O(1)]
	//1
	@discardableResult
	public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
		// 2
		guard tail !== node else {
			append(value)
			return tail!
		}
		// 3
		node.next = Node(value: value, next: node.next)
		return node.next!
	}
	
	/// Removing a value at the front of the list
	@discardableResult
	public mutating func pop() -> Value? {
		defer {
			head = head?.next
			if isEmpty {
				tail = nil
			}
		}
		return head?.value
	}
	
	@discardableResult
	public mutating func removeLast() -> Value? {
		// 1
		guard let head = head else {
			return nil
		}
		// 2
		guard head.next != nil else {
			return pop()
		}
		// 3
		var prev = head
		var current = head
		while let next = current.next {
			prev = current
			current = next
		}
		// 4
		prev.next = nil
		tail = prev
		return current.value
	}
	
	@discardableResult
	public mutating func remove(after node: Node<Value>) -> Value? {
		defer {
			if node.next === tail {
				tail = node
			}
			node.next = node.next?.next
		}
		return node.next?.value
	}
}

extension LinkedList: Collection {
	// 1
	public var startIndex: Index {
	  return Index(node: head)
	}
	// 2
	public var endIndex: Index {
	  return Index(node: tail?.next)
	}
	// 3
	public func index(after i: Index) -> Index {
	  return Index(node: i.node?.next)
	}
	// 4
	public subscript(position: Index) -> Value {
	  return position.node!.value
	}
	
	public struct Index: Comparable {
		public var node: Node<Value>?
		
		static public func ==(lhs: Index, rhs: Index) -> Bool {
			switch (lhs.node, rhs.node) {
			case let (left?, right?):
				return left.next === right.next
			case (nil, nil):
				return true
			default:
				return false
			} }
		static public func <(lhs: Index, rhs: Index) -> Bool {
			guard lhs != rhs else {
				return false
			}
			let nodes = sequence(first: lhs.node) { $0?.next }
			return nodes.contains { $0 === rhs.node }
		}
	}
}
