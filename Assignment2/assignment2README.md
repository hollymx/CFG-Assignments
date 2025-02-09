** Question 2.1 **

** unshift() **  
_adds more elements to the beginning of an array_

let CGFstreams = ["product management", "fullstack"];
CFGstreams.unshift("software engineering", "data science");
console.log(CFGstreams); 

> output: ["software engineering", "data science", "product management", "fullstack"]

** shift() ** 
_removes the first element from an array and then returns the remove element. Shortening the array_

let CFGstreams = ["software engineering", "data science", "product management", "fullstack"]
let firstCFGstreams = CFGstreams.shift();
console.log(firstCFGstreams); 

Output: ["software engineering"]

console.log(CFGstreams); 

> Output: ["data science", "product management", "fullstack"]

** _split() ** 
_splits a string into an array and returns the new array_

let sentence = "CFG offer different courses that teach the fundamentals of tech";
let words = sentence.split(" ");
console.log(words); 

> Output: ["CFG", "offer", "different", "courses", "that", "teach", "the", "fundamentals", "of", "tech"]

** Question 2.2 **

_Object methods can be accessed by using functions in Javascript. The objects are stored as property values and can be called upon without the use of brackets ()_

let programmingLanguage = {
    language1: "java",
    language2: "javascript",
    language3: "python",
    programingLanguageDetails: function () {
        return this.language1 + " " + this.language2 + " " + this.language3 + " ";
    }
};

console.log(programmingLanguage.programingLanguageDetails());

> Output: java javascript python

** Question 2.3 **

Onmouseover event - used in Javascript to trigger a specific action when the mouse point hovers over an HTML element. The event is usually an interactive one, as part of a web page. (colour of a button changing, drop shadow appearing)

Touchmove event - executed when the user moves a finger across the screen. (only works on touchscreen devices)

Onload event - can be used to check the visitors browser type and version. It will then load the relevant version of the webpage based on this information.