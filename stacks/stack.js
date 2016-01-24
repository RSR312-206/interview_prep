'use strict'

class Stack {
  constructor() {
    this._list = new List();
    // composition
    //more selective than inheritence.
  }

  isEmpty() {
    return this._list.length() === 0;
    //abstraction
  }
  length() {
    return this._list._length();
  }
  push(value) {
    return this._list.push(value);
    //delegation
  }
  pop() {
    return this._list.pop();
    //delegation
  }
}

//queue
//-----
//enqueue | list.push
//dequeue | list.shift