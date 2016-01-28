# A linked list is a data structure that consists of a collection of nodes
# that represent a sequence. Each element in a linked list will contain a value
# and a reference to the next element in the linked list (a pointer).

#designed to optimize insertion and deletion
#not great for search
#time space complexity
#insertion/deleteion/pop/push/shift/unshift O(n)
#indexing/search O(n)

#great for stacks- LIFO. Where the head is the only place for insertion/removal.

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
    @head = nod
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
    return "#{node.value}" if node.next_node.nil?
    return "#{node.value} > #{to_s(node.next_node)}"
  end

  def unshift(value)
    #NEW VALUE ADDED AT HEAD, HEAD IS NOW NEXT_NDODE
    #take the current head and
    #create a new node with the value arg.
    #then put the old head in the next position
    unshifted_head = @head
    @head = Node.new(value)
    @head.next_node = unshifted_head
    @length += 1
  end


  def shift
    #HEAD IS REMOVED, LL SHIFTS TO THE LEFT
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
    #remove the tail value in the linked list
    #length is already 0
    return nil if @length == 0
    #length is 1
    if @length == 1
      prev_head = @head
      @tail = nil
      @head = nil
      @length = 0
      return prev_head.value
    end
    #length is greater than one
    old_tail = @tail
    @tail = get_to_index(@length - 2)
    @tail.next_node = nil
    @length -= 1

    return old_tail.value
  end
  #uses recursion to work it's way through the linked list.
  def find(value, node = @head)
    #node equals the value
    return node if node.value == value
    #node does not exist
    return nil if node.next_node.nil?
    find(value, node.next_node)
  end

  def remove(value, node = @head)
    return nil if node.next_node.nil?

    if node.value == value
      @head = node.next_node
      @length -= 1
    else node.next_node.value == value
      node.next_node = node.next_node.next_node
      @length -= 1
      return true
    end
  end

  def get_to_index(index)
    node = @head
    #if index is greater than or equal to the lengh of thell,
    # less than 0, or the node value is nil:
    if index >= @length || index < 0 || node.nil?
      nil
    else
      index.times do
        node = node.next_node
      end
      node
    end
  end

  def reverse(node = @head)
    #set up the base case for recursion
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

