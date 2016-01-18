const start = process.hrtime(); //[seconds, nanoseconds]

console.log(1+2);
//removing the console.log significantly reduces the process speed.

const nanoseconds = process.hrtime(start)[1];

console.log(nanoseconds / 1000000 + ' milliseconds');
//console.log(nanoseconds 10000000 + ' seconds');