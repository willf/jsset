JsSet: A small set package for Sets in Javascript

This treats Javascript arrays as sets. For the array functions, it assumes that
the arrays are already sets; that is, the values are unique. It also assumes that
the items in the arrays have a reasonable == function (as if for hashing); e.g.,
you cannot create sets of sets.

intersection(a, b) - returns a new array, the intersection of a and b
union(a, b)  - returns a new array, the union of a and b
difference(a, b) returns a new array, the differene of a and b
intersection_arity(a, b) - returns the size of the intersection of a and b, without creating a new array
union_arity(a, b) - returns the size of the union of a and b, without creating a new array
difference_arity(a, b) - returns the size of the difference of a and b, without creating a new array
jaccardIndex(a, b) - returns the Jaccard Index of a and b
jaccardDistance(a, b) - returns the Jaccard Distance of a and b
hammingDistance(a, b) - returns the Hamming Distance of a and b
normalizedHammingDistance(a, b, size) - returns the Hamming Distance of a and b, normalized to some size