import elementCount from '../helpers/elementCount'
import {List} from 'immutable'

const scalarSet = [2, 1, 3]
scalarSet[0]--;

const answerLengthAssumingFirstIsZero = elementCount(scalarSet) //"n"
let answer = List(Array.apply(null, Array(answerLengthAssumingFirstIsZero + 1)).map(() => 0))
const scalarCount = scalarSet.length //k


//t is counting up until you've got a full length word to output
const simpleFixedContent = (t, p, answer) => { //wtf is "p" ? that's this "lyn" fn? so it's actually p(answer) ?
	// console.log(t, answerLength, p)
	if (t > answerLengthAssumingFirstIsZero) { 
		// console.log('okay, t===answerLength, but how about p mod it? ', p, answerLengthAssumingFirstIsZero)
		if (answerLengthAssumingFirstIsZero % p === 0) {
			// console.log("*************HERES ONE")
			console.log(answer)
			// console.log("")
		}
		// console.log("")
	} else {
		const atp = answer.get((t - p) - 1)
		// console.log('methinks yer setting atp too high, cuz yer not grabbing the 0 from the first bucket after you put it back')
		// console.log(atp, answer, t, p, t-p)
		for (let j = atp; j < scalarCount; j++) { //k is the -ary, so in this case 3
			// console.log('j ', j)
			if (scalarSet[j] !== 0) { // if there are still some in this bucket of scalar remaining
				answer = answer.set(t, j)
				scalarSet[j]--; //take one away from the bucket for the remainder of this depth plunge
				// console.log(scalarSet)
				// console.log(answer)
				// console.log("")
				if (j === atp) { //if it is only a pre-necklace?
					simpleFixedContent(t + 1, p, answer) //count up t because you're one closer to a finished answer
				} else { // if it is a fully-fledged necklace? 
					simpleFixedContent(t + 1, t, answer) //count up t because you're one closer to a finished answer
				}
				scalarSet[j]++ //put it back in the bucket
				// i guess i don't have to worry about clearing "answer" since it just overwrites itself
			}
		}
		// console.log('for loop complete')
	}
}

export default () => simpleFixedContent(1, 1, answer) //or maybe (1, 0, answer)


/*
For    , let lynŽ .  be the length of the longest prefix of  that is a k
Lyndon word. This function is well defined since   L. More formally, k
def lyn a a Ž . Ž . Ž. 1 2  an  max 1 4 
 p 
 n  a a1 2  ap k  L p . 9
For example, lynŽ . 001010010  5. Note that if   a a1 2  an is a Lyndon
word, then lynŽ .   n.
The f

----------------
procedure FastFixedContent ( t, p, s : integer );
local j, s : integer;
begin
if nk−1 = n − t + 1 then begin
if nk−1 = rt−p and n mod p = 0 then Print();
else if nk−1¿rt−p then Print();
end;
else if n0 != n − t + 1 then begin
j := head;
s : = s;
while j>=p do begin
rs := t − s;
at := j;
nj := nj − 1;
if nj = 0 then Remove(j);
if j != k − 1 then s := t + 1;
if j = at−p then FastFixedContent(t + 1; p; s
);
else FastFixedContent(t + 1; t; s
);
if nj = 0 then Add(j);
nj := nj + 1;
j := Next(j);
end;
at := k − 1;
end; end;
Fig
*/