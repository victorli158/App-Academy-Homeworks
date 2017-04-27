// window.setTimeout(function () {
//   alert('HAMMER TIME!');
// }, 5000);
//
// function hammerTime(time) {
//   window.setTimeout(function() {
//     alert(`${time} is hammertime!`);
//   });
// }
//
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  reader.question("Would you like some tea?", function (firstRes) {
    console.log(firstRes);
    reader.question("Would you like some biscuits?", function (secondRes) {
      console.log(secondRes);

      const first = (firstRes === "yes") ? "do" : "don\'t";
      const second = (secondRes === "yes") ? "do" : "don\'t";

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close;
    });
  });
}

teaAndBiscuits();
