// given a array of phrases or word, return the longest item.

// looping through the array, compare the current item to the next item using the index
// save the index of the longest word or phrase.
// access the array at this index and return the longest word/phrase

//-------------------- release 0--------------------------------
function longest_word_or_phrase(phrases){
  longest_word_index = 0;
  for (i=0; i < (phrases.length - 1) ; i++){
      if (phrases[i].length < phrases[i + 1].length ){
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
      if (has_key_value(attribute,obj1[attribute],obj2)){
        return true;
      }
  }
  return false;

};

function has_key_value(key,value,obj2){
  for (var attribute in obj2){
    if (attribute === key && value === obj2[attribute]){
      return true;
    }
  }
  return false;
};

//------------------------ driver code -------------------------------------
//test release 0
console.log("-----------------------------")
console.log("Tests for release 0")
array = ["me","I am the king of the word","Titanic","how about to see a movie tomorrow"]
console.log("Array:",array)
console.log("\nlongest phrases or word is: " , longest_word_or_phrase(array) );


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