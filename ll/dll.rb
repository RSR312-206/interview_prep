class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize(value)
    @value = value
  end
end

class DoublyLinkedList
  attr_accessor :head, :tail, :length

  def initialize(value)
    @head = Node.new(value)
    @tail = @head
    @length = 1
  end

  def push(value)
    new_node = Node.new(value)
    @tail.next_node = new_node
    new_node.prev_node = @tail
    @tail = new_node
    @length += 1
  end

  def to_s(node = @head, res = "")
    return res if node.nil?
    return "#{node.value}" if node.next_node.nil?
    return "#{node.value} > #{to_s(node.next_node)}"
  end

  def unshift(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head.prev_node = new_node
    @head = new_node
    @length += 1
  end

  def shift
    old_head = @head
    @head = @head.next_node
    @head.prev_node = nil
    @length -=1

    old_head.value
  end

  def pop
    old_tail = @tail
    @tail = old_tail.prev_node
    @tail.next_node = nil
    @length -= 1

    old_tail.value
  end

  def find(value, node = @head)
    return node if node.value == value
    return nil if node.next_node.nil?
    find(value, node.next_node)
  end

  def insert_after(existing_node_value, new_node_value)
    if @tail.value == existing_node_value
      push(new_node_value)
    else
      existing_node = find(existing_node_value)
      new_node = Node.new(new_node_value)
      new_node.next_node = existing_node.next_node
      existing_node.next_node = new_node
      new_node.next_node.prev_node = new_node
    end
    @length += 1
  end

  def remove(value)
    removed_node = find(value)
    if removed_node.nil?
      return nil
    end
    removed_node_next = removed_node.next_node
    removed_node_prev = removed_node.prev_node
    if removed_node == @head || removed_node == @tail
      if removed_node == @head
        shift
        @length -= 1
      elsif removed_node == @tail
        @tail = removed_node.prev_node
        @tail.next_node = nil
        @length -= 1
      end
    else
      removed_node.prev_node.next_node = removed_node_next
      removed_node.next_node.prev_node = removed_node_prev
      @length -= 1
    end
  end

  def reverse
    @head, @tail = @tail, @head
    node = @head
    while !node.nil?
      node.next_node, node.prev_node = node.prev_node, node.next_node
      node = node.next_node
    end
  end
end
