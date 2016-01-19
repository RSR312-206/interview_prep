# A linked list is a data structure that consists of a collection of nodes
# that represent a sequence. Each element in a linked list will contain a datum
# and a reference to the next element in the linked list (a pointer).


class Node
  #node class accessors are value and next node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
  end
end

class LinkedList
  attr_accessor :head, :tail, :length
  #init makes an instance of the node class
  #which is assigned to the head and tail
  #instance variables.
  def initialize(value)
    node = Node.new(value)
    @head = node
    @tail = node
    @length = 1
  end

  def push(value)
    #adds a new value to the tail of the list
    @tail.next_node = Node.new(value)
    @tail = @tail.next_node
    @length += 1
  end

  def to_s(node = @head)
    #prints the node as a string to the console
    return "{node.value}" if node.next_node.nil?
    return "{node.value} > #{to_s(node.next_node)}"
  end

   def unshift(value)
    #take the current head and
    #create a new node with the value arg.
    #then put the old head in the next position
    unshifted_head = @head
    @head = Node.new(value)
    @head.next_node = unshifted_head
    @length -= 1
  end


  def shift(value)
    #shift the head out of the linked list
    #and assign the next node to the head.
    #take the second node and place it at the
    #head of the ll.
    shifted_head = @head
    @head = @head.next_node
    @length -= 1
    puts shifted_head.value
  end

  def pop
    return nil if @length == 0

    if @length == 1
      prev_head = @head
      @tail = nil
      @head = nil
      @length = 0
      return prev_head.value
    end
    old_tail = @tail
    before_node = go_to_index(-2)
    @tail = before_node
    @tail.next_node = nil
    @length -= 1

    return old_tail.value
  end

  def find(value, node = @head)
    return node if node.value == value
    return nil if node.next_node.nil?
    find(value, node.next_node)
  end

  def remove(value, node = @head)
    if node.next_node.nil?
      return nil
    elsif node.value == value
      @head = node.next_node
      @length -= 1
    elsif node.next_node.value == value
      node.next_node = node.next_node.next_node
      @length -= 1
      return true
    end
  end

  def go_to_index(index, return_prev = false)
    node = @head

    #if index is greater than or equal to the lengh of thell,
    # less than 0, or the node value is nil:
    if index >= @length || index < 0 || node.nil?
      nil
    else
      prev = nil
      i = 0
      while i < index
        prev = node
        node = node.next_node
        i += 1
      end
      return_prev ? prev : node
    end
  end

  def reverse(node = @head)
    if node.next_node.nil?
      @head = node
      return
    end

    reverse(node.next_node)
    node.next_node.next_node = node
    node.next_node = nil
    @tail = node
  end
end

