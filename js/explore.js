// given a string print reversed

// Create a method to reverse a given string
// acess each char with the index from the end of the string to the start (string[9],string[8]...)
// add each char to a new string
//return a new string

function reverse(word) {

  var reversed = "";
  for (i=0;i< word.length;i++){
    index_reversed = (word.length - 1) - i;
    reversed += word[index_reversed];
  }
  return reversed
};


var reversed = reverse("hello");
console.log("hello reverted is :", reverse("hello"))

var reversed = reverse("Jesusmar");

if (reversed === "ramsuseJ") {
  console.log("Reverse function works");
}
else {
  console.log("ops somethig wrong");
}


