var guessesLeft = 10;
var highScores = new Array([9, "HarryJamesPotter"], [3, "ZedCthulhu"], [2, "NearlyDied"]);
var winningNumber;

$(function() {
  	setWinningNumber();
  	$('span#winningNumber').append(winningNumber);
  	updateScore(guessesLeft);
  	populateHighScores(highScores);
});

function checkGuess(){
	input = document.getElementById('guess');
	guess = input.value;

	if(guess == winningNumber){
		document.getElementById("hint").innerHTML="You Win!";
		getName();
		populateHighScores(highScores);
		return;
	}
	else if (guess > winningNumber){
		document.getElementById("hint").innerHTML="Too High Bro!";
	}
	else {
		document.getElementById("hint").innerHTML="Too Low Bro!";
	}
	
	guessesLeft--;
	updateScore(guessesLeft);
	
	if(guessesLeft == 0){
		alert("You Lose! A new game will start.");
		reset();
	}
}

function setWinningNumber(){
	winningNumber = Math.floor(Math.random()*102)+1; 
}

function populateHighScores(scores) {
  	$('div#highScores').empty();
  	for (var i = 0; i < scores.length; ++i) {
    	$('div#highScores').append("<p>" + scores[i][0] + " " + scores[i][1] + "</p>");
  	}
}

function updateScore(score) {
  	document.getElementById("guessesLeft").innerHTML=score;
}

function getName(){
	var userName = prompt("Please enter your name", "Darth Vader");
	highScores.push([guessesLeft, userName]);
	reset();
}

function reset() {
	guessesLeft = 10;
	setWinningNumber();
	updateScore(guessesLeft);
  	populateHighScores(highScores);
  	document.getElementById("hint").innerHTML="";
  	document.getElementById("guess").value="";
  	document.getElementById("winningNumber").innerHTML=winningNumber;
}