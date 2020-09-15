let sentence = "I have a giant problem"
let splitArr = sentence.split {$0 == " "}

print(Array(splitArr.reversed()))