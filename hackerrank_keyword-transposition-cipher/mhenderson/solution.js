var ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

function processData(input) {
    var lines = input.split('\n');
    var numCases = parseInt(lines[0]);

    // prepare yourselves to be thoroughly amazed by this magic [numbers] trick!!!
    for(var i = 1; i < numCases*2; i+=2) {
        var keyword = lines[i];
        var ciphertext = lines[i+1];

        var cipher = createCipher(keyword, ciphertext);
        console.log(decipher(ciphertext, cipher));
    }
}

function createCipher(keyword, ciphertext) {
    // holds an array representation of the columns used for the keyword transposition cipher
    var cipherArray = keyword.concat(ALPHABET).unique();

    var keywordChars = keyword.unique();
    keywordChars.sort();

    // maps substitution : original
    var cipher = {};

    // loop over keyword chars; traverse each "column" in alphabetical order by keyword char
    for(var columnNum = 0; columnNum < keywordChars.length; columnNum++) {
        var rowIndex = 0;
        var arrayIndex = getArrayIndex(cipherArray, keywordChars, columnNum, rowIndex);

        // go down column until there's no more column to go down
        while(cipherArray[arrayIndex]) {
            var character = ALPHABET.charAt(Object.keys(cipher).length);
            cipher[cipherArray[arrayIndex]] = character;
            arrayIndex = getArrayIndex(cipherArray, keywordChars, columnNum, ++rowIndex);
        }
    }

    return cipher;
}

// I kinda tried to not pass in so many arguments...
function getArrayIndex(cipherArray, firstRow, columnNum, rowIndex) {
    var columnOffset = cipherArray.indexOf(firstRow[columnNum]);
    return columnOffset + (firstRow.length * rowIndex);
}

function decipher(ciphertext, cipher) {
    var deciphered = "";
    for(var i = 0; i < ciphertext.length; i++) {
        // undefined if character is not in map (i.e., not a letter in our alphabet)
        var character = cipher[ciphertext.charAt(i)];

        var charToConcat = character ? cipher[ciphertext.charAt(i)] : ciphertext.charAt(i);
        deciphered = deciphered.concat(charToConcat);
    }
    return deciphered;
}


// 'unique' and 'contains' gifted by the SO gods (http://stackoverflow.com/questions/11246758/how-to-get-unique-values-in-an-array)
String.prototype.unique = function() {
    var arr = [];
    for(var i = 0; i < this.length; i++) {
        if(!arr.contains(this[i])) {
            arr.push(this[i]);
        }
    }
    return arr;
};

Array.prototype.contains = function(v) {
    for(var i = 0; i < this.length; i++) {
        if(this[i] === v) return true;
    }
    return false;
};


// boilerplate thanks to the lovely folks at hackerrank
process.stdin.resume();
process.stdin.setEncoding("ascii");
_input = "";
process.stdin.on("data", function (input) {
    _input += input;
});

process.stdin.on("end", function () {
    processData(_input);
});
