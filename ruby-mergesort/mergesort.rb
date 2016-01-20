def merge_sort(main_arr)
  if main_arr.length <= 1
    main_arr
  else
    mid = main_arr.length / 2
    #left side calls the method. - 1 to not include the midpoint.
    left_arr = main_arr[0..mid - 1]
    #right arr calls the method, includs the midpoint.
    right_arr = main_arr[mid..main_arr.length]
    #call merge on the new left and right arrays
    merge(merge_sort(right_arr), merge_sort(left_arr) )
  end
end

def merge(left_arr, right_arr)
  sorted = []
  until left_arr.empty? || right_arr.empty?
    if left_arr.first <= right_arr.first
      sorted.push(left_arr.shift)
    elsif right_arr.first <= left_arr.first
      sorted.push(right_arr.shift)
    end
  end
  sorted.concat(left_arr).concat(right_arr)
  p sorted
end

#time space complexity
# O(n log(n))


#alternate solution
# def merge(left_arr, right_arr)
#   if left_arr.empty?
#     right_arr
#   elsif right_arr.empty?
#     left_arr
#   elsif left_arr.first < right_arr.first
#     [left_arr.first] + merge(left_arr[1..left_arr.length], right_arr)
#   else right_arr.first < left_arr.first
#     [right_arr.first] + merge(left_arr, right_arr[1..right_arr.length])
#   end
# end
