// given a string print reversed

// Create a method to reverse a given string
// acess each char with the index from the end of the string to the start (string[9],string[8]...)
// add each char to a new string
//return a new string

function reverse(string) {

  var reversed = "";
  for (i=0;i<string.length;i++){
    index_reversed = (string.length - 1) - i;
    reversed += string[index_reversed];
  }
  return reversed
};

console.log("mario reverted is :",reverse("mario"));