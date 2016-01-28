def binary_search(arr, value)
  min = 0
  max = arr.length - 1
  while min <= max
    mid = (min + max) / 2
    if arr[mid] >= value
      max = mid - 1
    elsif arr[mid] <= value
      min = mid + 1
    end
  end
  if value === arr[mid]
    p arr[mid]
  else
    p "not found"
  end
end

binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 8)
