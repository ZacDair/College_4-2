// Word Guesser
// Global arrays for the word to guess, and the current guess
var goalWord = ['F', 'O', 'X'];
var currentWord = ['_', '_', '_'];
var correctGuessCount = 0;
var prizeMoney = 0;
var hangmanState = 0;
var usedLetters = [];
var gameRunning = true;

// Compare the length fot he goal word with the correct guesses
function winStatusCheck(){
  if (correctGuessCount == goalWord.length){
    console.log("Congratulations you have won the game!!!\n");
  }
  else if (!gameRunning){
    console.log("Game Over!");
    
  }
  else{
    console.log(goalWord.length - correctGuessCount, "letters left to guess...\n");
  }
}

// Function checks if the guessedLetter is in the goalWord array
function guessLetter(guessedLetter){
  if (gameRunning){
    guessedLetter = guessedLetter.toUpperCase();

    // Check if the letter has been used already
    if (usedLetters.indexOf(guessedLetter) == -1){

      // Store the old correct count
      var currentGuessCount = correctGuessCount;
      for (letterIndex in goalWord){

        // if we found a letter
        if (goalWord[letterIndex] == guessedLetter){

          // Add the guessed letter to the array
          currentWord[letterIndex] = guessedLetter;

          // Increment our correct guesses count
          correctGuessCount++;
          console.log("Congratulations, you found a letter!!!");
        }
      }
      // If we made new correct guesses add prize money
      if (currentGuessCount != correctGuessCount){

        // Generate a random amount of prize money, multiply it by the number of letters found that guess
        prizeMoney = prizeMoney + Math.floor(Math.random()*100)*correctGuessCount-currentGuessCount;
      }
      else{
        prizeMoney = prizeMoney - 10;
        hangmanState++;
        console.log("Incorrect, you've lost some prize money!");
      }
      // Log the current game status
      usedLetters.push(guessedLetter);
      console.log("Letters you have guessed:", usedLetters);
      if(hangmanState == 6){
        gameRunning = false; 
        hangmanState = `
  |---------
  |    |
  |    O
  |   -|-
  |   / \\
  |
  |
  `;
      }
      console.log("Hangman State:", hangmanState)
      console.log("You currently have", prizeMoney+"$ prize money");
      console.log("You're current guess is:", currentWord);
      winStatusCheck();
    }
  }
  else{
    console.log("Sorry the game is over!!!");
  }
}

guessLetter('a');
guessLetter('b');
guessLetter('f');
guessLetter('f');
guessLetter('e');
guessLetter('d');
guessLetter('c');
guessLetter('g');
guessLetter('x');


// Calculator
function squareNumber(ourNum){
  var res = Math.pow(ourNum, 2);
  console.log("The result of squaring the number "+ourNum+" is", res, "\n");
  return res;
}

function halfNumber(ourNum){
  var res = ourNum/2;
  console.log("The result of halfing the number "+ourNum+" is", res, "\n");
  return res;
}

function percentOf(ourNum, ourTotal){
  var res = (ourNum*100)/ourTotal;
  console.log(ourNum+" is", res+"% of", ourTotal, "\n");
  return res;
}

function areaOfCircle(ourRadius){
  var res = squareNumber(ourRadius) * Math.PI;
  console.log("The area of a circle with radius", ourRadius, "is", res);
  res = res.toFixed(2);
  console.log("Rounded to 2 decimal places:", res, "\n");
  return res;
}

function runCalculations(num){
  console.log("Running all calculations:\n")
  var half = halfNumber(num);
  var squared = squareNumber(half);
  var area = areaOfCircle(squared);
  var percentage = percentOf(squared, area);


}

squareNumber(3);
halfNumber(5);
percentOf(2, 4);
areaOfCircle(2);
runCalculations(3)