//you have a binary heap. insert something into it.
//write an extract function.


//your nodes are in an array
function BH() {
  this.nodes = [];
}


//parent method takes an index and returns floor of index - 1 / 2.
BH.prototype.parent = function(index) {
  return Math.floor((index - 1) /2 );
}

//takes an index and applies it to the parent method, then assign to a variable parent.
//holds a temp value
//if the parent is 0, return
//if the node at index is less than or equal to the parent, return.
//otherwise- temp is assigned to the parent
//the parent becodes the index
//the index becomes the temp
//then recursively call the upheap method.

// BH.prototype = function(index) {
//   var parent = this.parent(index);
//   var temp;

//   if parent == 0 {
//     return;
//   }
//   if this.node[index] <= this.node[parent] {
//     return;
//   }
//   temp = this.node[parent];
//   this.node[parent] = this.node[index]
//   this.node[index] = temp;
//   this.upheap(parent);
// }

BH.prototype.upHeap = function(index) {
  const parent = this.parent(index);
  let temp;
  if (parent == 0) {
    return;
  }
  if (this.nodes[index] <= this.nodes[parent]) {
    return;
  }
  temp = this.node[parent];
  this.nodes[parent] = this.nodes[index];
  this.nodes[index] = temp;
  this.upHeap(parent);
}

//insert takes a value and pushes it to the node array
//then calls the upheap method to re-arrange the heap.

// BH.protoype.insert = function(value) {
//   this.nodes.push(value);
//   this.upHeap(this.nodes.length - 1);
//   return value;
// }

BH.prototype.insert = function(value) {
  this.nodes.push(value);
  this.upHeap(this.node.length - 1);
  return value;
}

//helper functions for the extract.
BH.prototype.left = function(index) {
  return ((2 * index) + 1);
}
BH.prototype.right = function(index) {
  return ((2 * index) + 2 )
}

BH.prototype.downHeap = function(index) {
  const left = this.left(index);
  const right = this.right(index);
  const leftValue = this.nodes[left] || -Infinity;
  const rightValue = this.nodes[right] || -Infinity;
  const value = this.nodes[index];
  let temp;

  if (leftValue == -Infinity && rightValue == -Infinity) {
    return;
  }
  if (value >= leftValue && value <= rightValue) {
    return;
  }
  if (leftValue < rightValue && value < leftValue) {
    temp = this.nodes[index];
    this.nodes[index] = leftValue;
    leftValue = temp;
    this.downHeap(leftValue)
  }
  //then repeat this for the rightValue.
  if (rightValue < leftValue && value < rightValue) {
    temp = this.nodes[index];
    this.nodes[index] = rightValue;
    rightValue = temp;
    this.downheap(rightValue);
  }
}

//extract takes no arguements
//assign the zeroth position of the node to value
//then assign the zeroth position of the node to this.nodes.pop();
//then call downheap starting with the zeroth position.


// BH.prototype.extract = function() {
//   var value = this.node[0]
//   this.nodes[0] = this.nodes.pop();
//   this.downHeap(0);
// }

BH.prototype.extract = function() {
  // assign [0] to a temporary variable
  const value = this.node[0];
  // pop off the last position and assign it to the parent.
  this.nodes[0] = this.nodes.pop();
  //call downheap starting with the parent
  this.downHeap(0);

  return value;
}



GOOD TO REMEMBER:
upHeap ==> insert
downHeap ==> extract

//whenever you're working with a tree, binary tree, or a heap they are logarithmic
//because it uses divide and conquer. O(n).


//instead of having a node object, just store nodes in an array.
//but you must have a parent function so you can compare it's value
//to the currently inspected node value.