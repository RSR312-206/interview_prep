def bubble_sort(arr)
  n = arr.length
  loop do
    is_swapped = false
    (n-1).times do |i|
      if arr[i] > arr[i + 1]
        temp = arr[i]
        arr[i] = arr[i+1]
        arr[i+1] = temp
        is_swapped = true
      end
    end
    break if is_swapped == false
  end
  p arr
end

bubble_sort([100,34,345,1,-5,0])


# O(n^2) == bad