

class Node {
    constructor(value) {
        this.value = value
        this.next = null
    }
}

class LinkedList {
    constructor(value) {
        const node = new Node(value)
        this.head = node
        this.tail = node
        this.length = 1
    }
}

const myList = new LinkedList(2)

console.log(myList);