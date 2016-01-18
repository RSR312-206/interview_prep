function bubbleSort(arr) {
var hasSwaped = true;
var temp;
  while (hasSwaped) {
    hasSwaped = false;
    for (var i = 0; i < arr.length - 1; i++) {
      if(arr[i] > arr[i+1]) {
        //use temp first
        temp = arr[i];
        //then use your arr[i] is free to assign.
        arr[i] = arr[i+1];
        arr[i+1] = temp;
        hasSwaped = true;
      }
    }
  }
  console.log(arr);
}

bubbleSort([5,1,4,2,8]);

// Scalability notation:
// O(n^2)