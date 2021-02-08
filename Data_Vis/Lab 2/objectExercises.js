// Recipe Object Exercise

// Create and populate the recipe object fields
var recipe = {
	title:"Pasta Carbonara", 
	servings:4, 
	ingredients:["Pancetta - 100g", "Pecorino Cheese - 50g", "3 large Eggs",
               "Spaghetti - 350g", "3 Cloves of Garlic", "Butter - 50g", "Salt and Pepper"]
};

// Print the recipe title, servings to the console
console.log(recipe.title);
console.log("Serves:",recipe.servings);
console.log("Ingredients:");

// For each element in the ingredients list, use it's index to print the corresponding value
for (ingredient in recipe.ingredients){
  console.log(recipe.ingredients[ingredient]);
}

// Book Object Exercise
// Create an array of book objects
let books = [
  {
    title: "The Lord of The Rings",
    author: "JRR Tolkein",
    alreadyRead: true
  },
  {
    title: "The Witcher: The Last Wish",
    author: "Andrzej Sapkowski",
    alreadyRead: false
  },
  {
    title: "The Alchemyst",
    author: "Michael Scott",
    alreadyRead: true
  },
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    alreadyRead: true
  },
  {
    title: "Ulysses",
    author: "James Joyce",
    alreadyRead: false
  },
  {
    title: "The Cloud Atlas",
    author: "David Mitchell",
    alreadyRead: false
  },
];

// For each element of the books list get their index and extract the book associated with that index
for(book in books){
  var book = books[book];

  // Print the book details to the console
  //console.log(book.title, "by", book.author);

  // Conditionally change the console output if the user has/hasn't read a book
  if(book.alreadyRead){
    console.log("You already read", book.title, "by", book.author);
  }
  else{
    console.log("You still need to read", book.title, "by", book.author);
  }
}