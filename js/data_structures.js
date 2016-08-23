//_____ Release 0 _____________________________________________________________

var colors = ["red", "green", "black", "orange"];
var names = ["Ed", "Jay", "David", "John"];

colors.push("blue");
names.push("Mary");

//_____ Release 1 _____________________________________________________________

var barn = [];

for(var i = 0; i < colors.length; i++) {
  var horse = {};
  horse[names[i]] = colors[i];
  barn.push(horse);
}

console.log(barn);

//_____ Release 2 _____________________________________________________________

function Car(brand, model, year, color, used) {
  console.log("Our car is: " + brand);
  this.brand = brand;
  this.model = model;
  this.year = year;
  this.color = color;
  this.used = used;

  this.drive = function() { console.log("VROOOM!!!"); };

  console.log("CAR INITIALIZATION COMPLETE");
}

console.log("\n_____ Ferrari _____")
var ferrari = new Car("Ferrari", "Spider", 1978, "yellow", true);
ferrari.drive();
console.log("Original color:", ferrari.color);
ferrari.color = 'green';
console.log("New color:", ferrari.color);

console.log("\n_____ Lexus _____")
var lexus = new Car("Lexus", "IS 300s", 2016, "silver", false)
lexus.drive()
console.log("Used:", lexus.used);
lexus.used = true;
console.log("Used:", lexus.used);