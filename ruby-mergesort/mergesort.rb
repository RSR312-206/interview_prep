
  def merge_sort(main_arr)
    if main_arr.length <= 1
      main_arr
    else
      mid = main_arr.length / 2
      #left side calls the method. - 1 to not include the midpoint.
      left_arr = merge_sort(main_arr[0..mid - 1])
      #right arr calls the method, includs the midpoint.
      right_arr = merge_sort(main_arr[mid..main_arr.length])
      merge(right_arr, left_arr)
     end
  end

  def merge(left_arr, right_arr)
    if left_arr.empty?
      right_arr
    elsif right_arr.empty?
      left_arr
    elsif left_arr.first < right_arr.first
      [left_arr.first] + merge(left_arr[1..left_arr.length], right_arr)
    else right_arr.first < left_arr.first
      [right_arr.first] + merge(left_arr, right_arr[1..right_arr.length])
    end
  end


p merge_sort([1,2,12,900,50, 4, 1, 9, 4, 7, 5, 6666, -1000])
p merge_sort([34,54,1])
p merge_sort([0,0])
