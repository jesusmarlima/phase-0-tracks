var ulArr = document.getElementsByClassName("unordered-list");

for (var i = 3; i < 8; i++) {

  var listItem = document.createElement("li");
  var textNode = document.createTextNode("List item #" + i);

  listItem.appendChild(textNode);
  ulArr[0].appendChild(listItem);

}

var listItems = ulArr[0].children, listItem;
console.log(listItems);

for (var i = 0; i < listItems.length; i++) {
  listItem = listItems[i];
  if (i % 2 === 0) {
    listItem.style.color = "blue";
  } else {
    listItem.style.color = "red";

  }
}