// given a array of phrases or word, return the longest item.

// looping through the array, compare the current item to the next item using the index
// save the index of the longest word or phrase.
// access the array at this index and return the longest word/phrase

function longest_word_or_phrase(phrases){
  longest_word_index = 0;
  for (i=0; i < (phrases.length - 1) ; i++){
      if (phrases[i].length < phrases[i + 1].length ){
        longest_word_index = i + 1;
      }
  }
  return phrases[longest_word_index];
};


array = ["me","I am the king of the word","Titanic","how about to see a movie tomorrow"]
console.log("longest phrases or word is: " , longest_word_or_phrase(array) );