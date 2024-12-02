const fs = require('fs');

const list1 = [];
const list2 = [];

fs.readFileSync("../_input/day1.txt", "utf8").split("\n").forEach(line => {
  if (!line) return;
  const [a, b] = line.split("   ");
  list1.push(parseInt(a));
  list2.push(parseInt(b));
});

list1.sort();
list2.sort();

result = list1.map((i, index) => Math.abs(i - list2[index])).reduce((s, i) => s + i, 0);

console.log(result);
