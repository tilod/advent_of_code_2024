const fs = require('fs');

const list1 = [];
const list2 = [];

fs.readFileSync("../_input/day1.txt", "utf8").split("\n").forEach(line => {
  if (!line) return;
  const [a, b] = line.split("   ");
  list1.push(parseInt(a));
  list2.push(parseInt(b));
});

result = list1.reduce((sum, i) => {
  return sum + i * list2.filter(x => x === i).length;
}, 0);

console.log(result);
