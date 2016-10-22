import range from '../helpers/range'
import elementCount from '../helpers/elementCount'
import Immutable from 'immutable'
const {List, Iterable, concat} = Immutable
// const concat = Iterable.concat


/*
The second parameter @p@ is the length of the longest
--   prefix of @pre@ which is a Lyndon word, i.e. an aperiodic
--   necklace.  @pre@ is the current (reversed) prefix of the
--   necklaces being generated.
*/
const cPrime = (n, t, p, pre, xs) => {
  console.log('\n**********C-PRIME*************')

  if (xs.size === 0) {
    if (n % p === 0) {
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      console.log('OH')
      const anOutput = pre.map((fst, snd) => snd); 
      //why would it be the second element of a structure which is 
      //[thing, [thing, thing]] ?
      //i feel like this [thing1, [thing2, thing3]] thing is:
      //thing1: L, M, or s but converted to 210
      //thing2: L, M, or s, your custom choice
      //thing3: the count of it
      //the thing that WOULD make sense to print out in this case
      //would be thing2... but when would it ever be the 2nd el of anything?
      //i'm really starting to think i'm doing something wrong with "pre"
      console.log('early return cPrime w mod true, so one of the ouput results ', anOutput)
      return anOutput
    } else {
      console.log('early return cPrime w/o mod true, so return empty set \n')
      return []
    }
  } else {
    console.log('n (is always?) ', n)
    console.log('pre ', pre)
    console.log('p ', p)
    const atp = pre.get(p-1).get(0)
    console.log('atp ', atp)
    console.log('xs ', xs)
    // console.log('\n')

    const takeFn = el => {
      console.log('hi i am an el ', el, ' comp my first el against ', atp)
      return el.get(0) >= atp 
    }

    //except this couldn't be the thing about finding the longest lyndon word
    //because it's iterating over something like the scalar set
    //not the like, string it's building up
    console.log('k bout to iterate and find the longest lyndon word i think')
    const takeWhileResult = xs.takeWhile(takeFn)
    console.log('takeWhileResult ', takeWhileResult)
    console.log('and ok so now for some reason we iterate over the els of it')

    const takeWhileResultMapResult = takeWhileResult.map(elOfTakeWhileResult => {
      console.log('\nhere an el of the lyndon word ', elOfTakeWhileResult)

      const j = elOfTakeWhileResult.get(0)
      const xj = elOfTakeWhileResult.get(1) //result.get(1).get(0) //we expect xj to be a list of [a, b]
      const thirdArg = j === atp ? p : t

      // console.log('trying to concat ', List([List([j, xj])]), ' and ', xs)
      const fourthArg = List([List([j, xj])]).concat(xs)

      console.log('need to call remove now')
      const fifthArg = remove(j, xs) //maybe should be List([remove(j, xs)]) or remove is borked?
      
      console.log('j ', j)
      console.log('xj', xj)
      console.log('thirdArg, will be p ', thirdArg)
      console.log('fourthArg, will be pre ', fourthArg)
      console.log('fifthArg, will be xs ', fifthArg)
      console.log('AND NOW... about to go into the recursive call to cPrime \n')

      const cPrimeResult = cPrime(n, t+1, thirdArg, fourthArg, fifthArg)
      console.log('***********END CPRIME *********')
      return cPrimeResult
    })

    console.log(takeWhileResultMapResult)
    return takeWhileResultMapResult
  }
}

const remove = (j, arrOfAnIntAndAnArrOfAnAAndAnInt) => {
  console.log('\n**********REMOVE*************')
  console.log('with j ', j, ' and arrOfYaddaYadda ', arrOfAnIntAndAnArrOfAnAAndAnInt)
  if (arrOfAnIntAndAnArrOfAnAAndAnInt.size === 0) {
    console.log('early return on account of arrOfYaddaYadda being empty')
    return List([])
  }

  const x = arrOfAnIntAndAnArrOfAnAAndAnInt.get(0)
  const xs = arrOfAnIntAndAnArrOfAnAAndAnInt.shift(1)
  const jPrime = x.get(0)
  const xj = x.get(1).get(0)
  const nj = x.get(1).get(1)
  console.log('x ', x)
  console.log('xs ', xs)
  console.log('jPrime ', jPrime)
  console.log('xj ', xj)
  console.log('nj ', nj)

  if (j == jPrime && nj == 1) {
    console.log('FIRST return condition, returning ', xs)
    console.log('**********END REMOVE INTERJECTION*********', '\n')
    return xs
  } else if (j == jPrime) {
    // console.log('first half should be ', List([jPrime, List([xj, nj - 1])]))
    // console.log('second half should be ', xs)
    console.log('SECOND return condition, returning ', xs.shift(List([jPrime, List([xj, nj - 1])]))) //not concat?
    // return List([jPrime, List([xj, nj - 1])]).concat(xs)
    console.log('**********END REMOVE INTERJECTION*********', '\n')
    return xs.shift(List([jPrime, List([xj, nj - 1])]))
  } else {
    console.log('THIRD return condition, which leads to a recursive remove call!')
    const removalReturnValue = remove(j, xs)
    // console.log('first half should be ', x)
    // console.log('second half should be ', removalReturnValue)
    console.log('THIRD return condition, returning ', x.shift(removalReturnValue))
    console.log('**********END REMOVE INTERJECTION*********', '\n')
    return x.shift(removalReturnValue)
  }
}

export default scalarSet => {
  if (scalarSet.size === 0) return List([])

  const x1 = scalarSet.get(0).get(0)
  const n1 = scalarSet.get(0).get(1)
  const xs = scalarSet.shift(1) // the "tail"
  const n = scalarSet.reduce((memo, scalar) => memo + scalar.get(1), 0)//elementCount(scalarSet) // sum . getCounts $ m //i think this is just elementsCount of scalarSet?

  let lastArg, zipHalf, otherZipHalf
  //okay, so this is just the very beginning. the whole thing branches depending on whether
  //the first scalar has a count of 1 or not. seems not so important...
  if (n1 === 1) { 
    // console.log('n1 === 1')
    zipHalf = xs;
    otherZipHalf = List(range(zipHalf.size))
    // console.log('zipHalf', zipHalf)
    // console.log('otherZipHalf', otherZipHalf)
    lastArg = zipHalf.map((el, idx) => List([otherZipHalf.get(idx), el]))//.reverse()
    // console.log('last arg of n1 === 1', lastArg)
    // console.log('*********INTRO IS OVER*************')
    // console.log('\n')
    return cPrime(n, 2, 1, List([List([0, x1])]), lastArg)
  } else {
    // console.log('n1 !== 1')
    zipHalf = xs.unshift(List([x1, n1 - 1]))
    otherZipHalf = List(range(zipHalf.size + 1, 1))
    lastArg = zipHalf.map((el, idx) => List([otherZipHalf.get(idx), el]))//.reverse()
    // console.log('last arg of n1 !== 1', lastArg)
    // console.log('*********INTRO IS OVER*************')
    // console.log('\n')
    return cPrime(n, 2, 1, List([List([0, x1])]), lastArg)
  }
}


/*

-- | A multiset is represented as a list of (element, count) pairs.
--   We maintain the invariants that the counts are always positive,
--   and no element ever appears more than once.
newtype Multiset a = MS { toCounts :: [(a, Count)] }
  deriving (Show, Functor)

-- | Construct a 'Multiset' from a list of (element, count) pairs.
--   Precondition: the counts must all be positive, and there must not
--   be any duplicate elements.
fromCounts :: [(a, Count)] -> Multiset a
fromCounts = MS

-- | Extract just the element counts from a multiset, forgetting the
--   elements.
getCounts :: Multiset a -> [Count]
getCounts = map snd . toCounts

-- | Compute the total size of a multiset.
size :: Multiset a -> Int
size = sum . getCounts

liftMS :: ([(a, Count)] -> [(b, Count)]) -> Multiset a -> Multiset b
liftMS f (MS m) = MS (f m)

-- | A multiset with no values in it.
emptyMS :: Multiset a
emptyMS = MS []

-- | Create a multiset with only a single value in it.
singletonMS :: a -> Multiset a
singletonMS a = MS [(a,1)]

-- | Add an element with multiplicity to a multiset.  Precondition:
--   the new element is distinct from all elements already in the
--   multiset.
consMS :: (a, Count) -> Multiset a -> Multiset a
consMS e@(_,c) (MS m)
  | c > 0     = MS (e:m)
  | otherwise = MS m

-- | A convenient shorthand for 'consMS'.
(+:) :: (a, Count) -> Multiset a -> Multiset a
(+:) = consMS

-- | Convert a multiset to a list.
toList :: Multiset a -> [a]
toList = expandCounts . toCounts

expandCounts :: [(a, Count)] -> [a]
expandCounts = concatMap (uncurry (flip replicate))

-- | Efficiently convert a list to a multiset, given an 'Ord' instance
--   for the elements.  This method is provided just for convenience.
--   you can also use 'fromListEq' with only an 'Eq' instance, or
--   construct 'Multiset's directly using 'fromCounts'.
fromList :: Ord a => [a] -> Multiset a
fromList = fromCounts . map (head &&& length) . group . sort

-- | Convert a list to a multiset, given an 'Eq' instance for the
--   elements.
fromListEq :: Eq a => [a] -> Multiset a
fromListEq = fromCounts . fromListEq'
  where fromListEq' []     = []
        fromListEq' (x:xs) = (x, 1 + length xEqs) : fromListEq' xNeqs
          where
            (xEqs, xNeqs) = partition (==x) xs

-- | Make a multiset with one copy of each element from a list of
--   distinct elements.
fromDistinctList :: [a] -> Multiset a
fromDistinctList = fromCounts . map (\x -> (x,1))

-- | Form the disjoint union of two multisets; i.e. we assume the two
--   multisets share no elements in common.
disjUnion :: Multiset a -> Multiset a -> Multiset a
disjUnion (MS xs) (MS ys) = MS (xs ++ ys)

-- | Form the disjoint union of a collection of multisets.  We assume
--   that the multisets all have distinct elements.
disjUnions :: [Multiset a] -> Multiset a
disjUnions = foldr disjUnion (MS [])

*/


/*
----------------------------------------------------------------------
-- Cycles (aka Necklaces)
----------------------------------------------------------------------

-- | Generate all distinct cycles, aka necklaces, with elements taken
--   from a multiset.  See J. Sawada, \"A fast algorithm to generate
--   necklaces with fixed content\", J. Theor. Comput. Sci. 301 (2003)
--   pp. 477-489.
--
--   Given the ordering on the elements of the multiset based on their
--   position in the multiset representation (with \"smaller\"
--   elements first), in @map reverse (cycles m)@, each generated
--   cycle is lexicographically smallest among all its cyclic shifts,
--   and furthermore, the cycles occur in reverse lexicographic
--   order. (It's simply more convenient/efficient to generate the
--   cycles reversed in this way, and of course we get the same set of
--   cycles either way.)
--
--   For example, @cycles (fromList \"aabbc\") ==
--   [\"cabba\",\"bcaba\",\"cbaba\",\"bbcaa\",\"bcbaa\",\"cbbaa\"]@.
cycles :: Multiset a -> [[a]]
cycles (MS [])         = []   -- no such thing as an empty cycle
cycles m@(MS ((x1,n1):xs))
  | n1 == 1    = (cycles' n 2 1 [(0,x1)] (reverse $ zip [1..] xs))
  | otherwise =  (cycles' n 2 1 [(0,x1)] (reverse $ zip [0..] ((x1,n1-1):xs)))
  where n = sum . getCounts $ m

-- | The first parameter is the length of the necklaces being
--   generated.  The second parameter @p@ is the length of the longest
--   prefix of @pre@ which is a Lyndon word, i.e. an aperiodic
--   necklace.  @pre@ is the current (reversed) prefix of the
--   necklaces being generated.
cycles' :: Int -> Int -> Int -> [(Int, a)] -> [(Int, (a,Count))] -> [[a]]
cycles' n _ p pre [] | n `mod` p == 0 = [map snd pre]
                     | otherwise      = []

cycles' n t p pre xs =
  (takeWhile ((>=atp) . fst) xs) >>= \(j, (xj,_)) ->
    cycles' n (t+1) (if j == atp then p else t)
      ((j,xj):pre)
      (remove j xs)
  where atp = fst $ pre !! (p - 1)

remove :: Int -> [(Int, (a, Int))] -> [(Int, (a, Int))]
remove _ [] = []
remove j (x@(j',(xj,nj)):xs)
  | j == j' && nj == 1 = xs
  | j == j'            = (j',(xj,nj-1)):xs
  | otherwise          = x:remove j xs
*/

/*
[9.4, 33.2, 96.2] !! 1 -> 33.2  
take 3 [5,4,3,2,1]  -> [5,4,3]  
sum [5,2,1,6,3,2,5,7] -> 31  
[3,2,1] > [2,10,100] -> True
1 : [2, 3] -> [1, 2, 3]

' just means a modified or strict version of a function
not $ 3 < 5 is the exact same as not (3 < 5)
_ is just ignoring the value of an argument

(.) :: (b -> c) -> (a -> b) -> (a -> c)
(.) f g = (\x -> f (g x)) 
-- alternatively
f . g = (\x -> f (g x))
The function . is called function composition, 
similar to the definition you see in math (“fog” notation). 
It returns a function that takes in an input, passes it to the function g, 
and then pipes the result of g into f. 
Looking at the type signature, it makes sense. 
Given a value of type a, you pass it into function g, 
which returns a value of type b, 
and the value of type b gets passed into the function f, 
which returns a value of type c. 
Looking at it like it’s a black box, 
the type of the function composition is (a -> c).

Yes, it's just syntactic sugar, with @ read aloud as "as". 
ps@(p:pt) gives you names for
the list: ps
the list's head : p
the list's tail: pt

fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
This is a case of “pattern matching”. 
Haskell goes down the list and tries to find a matching definition.
fib n
  | n < 2 = 1
  | otherwise = fib (n - 1) + fib (n - 2)
These are just variations of the same fib function, using different syntax. 
The first one is called “guard expressions”, and uses | followed by different 
cases and their values. otherwise is just a catch-all value 
(in fact, otherwise is the exact same as True).

addFour w x y z =
   z + b
 where
   a = w + x
   b = y + a
let ... in ... and ... where ... 
let you build up computation and store them in local variables. 
Picking between let and where is a matter of preference 
- they achieve the same thing.
https://wiki.haskell.org/Let_vs._Where for more info

takeWhile, applied to a predicate p and a list xs, 
returns the longest prefix (possibly empty) of xs of elements that satisfy p: 
> takeWhile (< 3) [1,2,3,4,1,2,3,4] == [1,2] 
> takeWhile (< 9) [1,2,3] == [1,2,3] 
> takeWhile (< 0) [1,2,3] == []

The Functor class is used for types that can be mapped over.
Instances of Functor should satisfy the following laws:
fmap id  ==  id
fmap (f . g)  ==  fmap f . fmap g

The instances of class Show are those types that can be converted 
to character strings (typically for I/O).

The “bind” function, >>=, is one example.

*/

//my attempt at implementing takeWhile
// const takeWhile = (arr, fn) => arr.forEach((el, i) => fn(el) ? arr.slice(0, i) )