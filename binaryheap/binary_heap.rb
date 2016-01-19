# upheap --> insert
# downheap --> extract

class BinaryHeap

  def initialize
    @nodes = []
  end


  def parent(index)
    (index - 1) / 2
  end


  def up_heap(index)
    parent = parent(index)

    if parent == 0
      return
    end

    if @nodes[parent] <= @nodes[index]
      return
    end

    temp = parent
    parent = @nodes[index]
    @nodes[index] = temp
    upHeap(parent)
  end


  def insert(value)
    @nodes.push(value)
    up_heap(@nodes.length - 1)
  end


  def left(index)
    return (@nodes[index] * 2) + 1
  end


  def right(index)
    return (@nodes[index] * 2) + 2
  end


  def down_heap(index)
    left = left(index)
    right - right(index)
    left_value = @nodes[left] || -Float::INFINITY
    right_value = @nodes[right] || -Float::INFINITY
    value = @nodes[index]
    temp;

    if left_value == -Float::INFINITY && right_value == -Float::INFINITY
      return
    end
    if value >= left_value && value <= right_value
      return
    end
      #left value must be less than right, value must be less than left falue
    if left_value < right_value && value < left_value
      temp = value
      value = left_value
      left_value = temp
      down_heap(left_value)
    else
      #right value is less than left value, value is less than right value.
      right_value < left_value && value < right_value
      temp = value
      value = right_value
      right_value = temp
      down_heap(right_value)
    end
  end


  def extract()
    value = nodes[0]
    node[0] = nodes.pop
    down_heap(0)
    return value
  end

  private :parent, :up_heap, :down_heap, :left, :right

end

bh = BinaryHeap.new()
bh.insert(4)
bh.extract(10)

