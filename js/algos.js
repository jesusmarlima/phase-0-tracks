// given a array of phrases or word, return the longest item.

// looping through the array, compare the current item to the next item using the index
// save the index of the longest word or phrase.
// access the array at this index and return the longest word/phrase

//-------------------- release 0--------------------------------
function longest_word_or_phrase(phrases){
  var longest_word_index = 0;
  var longest = phrases[0];
  for (var i=0; i < (phrases.length - 1) ; i++){
      if (longest.length < phrases[i + 1].length ){
        longest = phrases[i + 1];
        longest_word_index = i + 1;
      }
  }
  return phrases[longest_word_index];
};

//-------------------- release 1--------------------------------

// given to objects compare if they are at least one attribute key and value.
// loop through the fist object and ask if in the second object has the same pair key and value.
//I chose to do with to methods to leave the code readable

function key_value_match(obj1,obj2){

  for (var attribute in obj1){
        if (obj2[attribute] == obj1[attribute]){
         return true;
       }
  }
  return false;
};

//-------------------- release 2--------------------------------

// given a number create a array with the length of the number, and each item is a radom string
// with length between 1 and 10
// first create a function to generate the array with a given length
// second create a method to generate words
// thrird create a method to generate randon words
// at driver code, create a loop to call generate_array_with_length 10 times and and for each time store the longst in a array and print at the end.


function generate_array_with_length(num){
    var words = [];
     for (var i = 0; i < num; i++){
       var str = generate_ramdon_words();
       words.push(str);
     }
     return words;

};

function generate_ramdon_words(){
    var word = "";
    var ramdom_length = Math.floor((Math.random() * 10) + 1);
    for (var i = 0; i < ramdom_length; i++ ){
      word += random_letter();
    }
    return word;
};

function random_letter(){
  var alphabet = 'abcdefghijklmnopqrstuvwxyz'
  return alphabet[Math.floor((Math.random() * 26))];
};




//------------------------ driver code -------------------------------------
//test release 0
console.log("-----------------------------")
console.log("Tests for release 0")
array = ["me","I am the king of the word","Titanic","how about to see a movie tomorrow"]
console.log("Array:",array)
console.log("\nlongest phrases or word is: " , longest_word_or_phrase(array) );

console.log(longest_word_or_phrase(["longest", "long", "longer"]));
console.log(longest_word_or_phrase(["maria", "mariaa", "mariaaa"]));
console.log(longest_word_or_phrase(["mariaa", "mariaaa", "maria"]));

//test release 1
console.log("\n-----------------------------")
console.log("Tests for release 1")

var pear = {color: 'green', weight:10}
var apple = {color: 'red', weight:10}

console.log("Object 1:", pear)
console.log("Object 2:", apple)

if (key_value_match(pear,apple)){
  console.log("\nthey have at least one common attribute")
  }
else {
  console.log("\nNothing equals");
}

var pear = {color: 'green', weight:10}
var apple = {color: 'red', weight:11}

console.log("\nObject 1:", pear)
console.log("Object 2:", apple)

if (key_value_match(pear,apple)){
  console.log("\nthey have at least one common attribute")
  }
else {
  console.log("\nNothing equals");
}


//test release 2
console.log("\n-----------------------------");
console.log("Tests for release 2");

console.log("Tests create array with given length");
array = generate_array_with_length(10)
console.log("array should have length = 10: ", array.length == 10 );

console.log("\nTests generate random letters");
console.log("random_letter test: ",random_letter() );
console.log("random_letter test: ",random_letter() );
console.log("random_letter test: ",random_letter() );
console.log("random_letter test: ",random_letter() );


console.log("\nTests generate random words");
console.log("generate_ramdon_words test: ",generate_ramdon_words() );
console.log("generate_ramdon_words test: ",generate_ramdon_words() );

console.log("\nTests create array with given length and random words");
console.log("array should have length 10 and random words: ",generate_array_with_length(10));

// console.log(" Release 2 Driver code");
console.log("\n-----------------------------");
console.log("Release 2");


var random_words = [];
var longest_random_words = [];

for (var i = 0; i < 10; i++){
  random_words = generate_array_with_length(i);
  longest_random_words.push(longest_word_or_phrase(random_words));
}

 console.log("\nlongest words:")
 for (var i = 0; i < longest_random_words.length; i++){
   console.log(" - ",longest_random_words[i]);
 }







