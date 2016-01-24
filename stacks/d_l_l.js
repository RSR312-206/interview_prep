'use strict'

class Node {
  constructor(value, prev = null, next = null) {
    this._value  = value;
    this._prev = null;
    this._next = null;
  }
}

class List {
  constructor() {
    this._head = null;
    this._tail = null;
    this.length = 0;
  }
  clear() {
    this._prev = null;
    this._next = null;
    return value;
  }

  push(value) {
    this.length += 1;
    this._tail = new Node(value, this._tail);
    if (this._leangth === 1) {
      this._head = this._tail;
    } else {
      this._tail.prev.next = this._tail;
    }
  return value;
  }
  pop() {
    if (this.length === 0) {
      return undefined;
    }
    this.length -= 1;
    const temp = this._tail;
    this._tail. = this._tail._prev
    if ( this._length === 0) {
      this._head = nil;
    } else {
    this._tail._next = null;
      return temp.clear;
    }
  }
}

