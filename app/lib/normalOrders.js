import range from '../helpers/range'
import {permutation} from 'js-combinatorics'

export default set => {
	const scalarNames = ['L', 'M', 's']

	let string = []
	set.forEach((scalar, index) => {
		range(scalar).forEach(() => {
			string.push(scalarNames[index])
		})
	})
	console.log(string)

	console.log(permutation(string).toArray()) //later, don't include repeats of indist els



	return [2,3,4]
}


/*

int main()
{
    using namespace std;
    using std::swap;
    using std::list;
    ofstream output;
    output.open("output.txt");
    std::string temp;
    std::string compare2;
    std::string compareMod;
    list<std::string> permutations;
    list<std::string> comparison;
    std::string permutation = "sssLLLL";
    sort(begin(permutation), end(permutation));
    permutations.push_back(permutation);
    
    while (std::next_permutation(permutation.begin(), permutation.end()))
    {
        permutations.push_back(permutation);
        //std::cout << permutation << std::endl;
    }
    for (std::list<std::string>::iterator it = permutations.begin(); it != permutations.end(); ++it) {
        comparison.push_back(*it);
        for (std::list<std::string>::iterator compare = permutations.begin(); compare != permutations.end(); ++compare) {
            if (*it != *compare) {
                compare2 = (*compare);
                for (int j = 0; j < (*compare).size() ; ++j) {
                    if (*it != compare2) {
                        compareMod = compare2;
                        temp = compareMod[compareMod.length()-1];
                        compareMod.pop_back();
                        compareMod.insert(0, temp);
                        compare2 = compareMod;
                    }
                    else {
                        comparison.push_back((*it) + " = " + *compare);
                        compare = permutations.erase(compare);
                        --compare;
                        break;
                    }
                }
            }
        }
        output << comparison.size()<< '\n';
        for (std::list<std::string>::iterator it2 = comparison.begin(); it2 != comparison.end(); ++it2) {
            output << *it2 << '\n';
        }
        comparison.clear();
    }
}

*/