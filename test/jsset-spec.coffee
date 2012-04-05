
describe "Javacript Sets", ->
  it 'handles the creation of a new, empty Set', ->
    expect(Set?).toBeTruthy()
    
  it 'handles adding an item to a Set', ->
    s = new Set()
    s.add(1)
    expect(s.contains(1)).toBeTruthy()
    
  it 'allows querying the size of a Set', ->
    s = new Set()
    expect(s.size()).toBe(0)
    s.add(1)
    expect(s.size()).toBe(1)
    
  it 'allows adding an item twice, without changing its size', ->
    s = new Set()
    expect(s.size()).toBe(0)
    s.add(1)
    expect(s.size()).toBe(1)      
    s.add(1)
    s.add(1)
    s.add(1)
    s.add(1)
    s.add(1)
    expect(s.size()).toBe(1)
    
  it 'allows deleting an item', ->
    s = new Set()
    expect(s.size()).toBe(0)
    s.add(1)
    expect(s.size()).toBe(1)      
    s.delete(1)
    expect(s.size()).toBe(0)
    
  it 'deleting an item not in the list is ok', ->
    s = new Set()
    expect(s.size()).toBe(0)
    s.add(1)
    expect(s.size()).toBe(1)      
    s.delete(1)
    s.delete(1)
    s.delete(1)
    s.delete(1)
    expect(s.size()).toBe(0)
    
  it 'allows the creation of a new set from an array', ->
    expect(new Set([1,2,3,4,5]).size()).toBe(5)
    
  it 'allows the conversion to an array', ->
    l = ["a", "b", "c", "d"]
    s = new Set(l)
    arr = s.items()
    expect(arr).toContain(i) for i in l

  it 'allows the conversion to an array, even if numeric', ->
    l = [1,2,3,4]
    s = new Set(l)
    arr = s.items()
    expect(arr).toContain(i) for i in l
    
  it 'allows the creation of union of two sets', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.union(s2).equals(new Set([1,2,3,4,5,6,7]))).toBeTruthy()
    
  it 'allows the creation of the intersection of two sets', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.intersection(s2).equals(new Set([3,4,5]))).toBeTruthy()

  it 'allows the creation of the difference of two sets', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.difference(s2).equals(new Set([1,2]))).toBeTruthy()

  it 'returns the empty set if intesecting with an empty set', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.intersection(new Set()).equals(new Set())).toBeTruthy()
    expect(s2.intersection(new Set()).equals(new Set())).toBeTruthy()
    
  it 'returns a (cheaper) arity for union', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.union_arity(s2)).toBe(7)

  it 'returns a (cheaper) arity for intersection', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.intersection_arity(s2)).toBe(3)

  it 'returns a (cheaper) arity for difference', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.difference_arity(s2)).toBe(2)
    
  it 'returns a jaccard similarity score', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.jaccardIndex(s2)).toBe(3/7) 

  it 'returns a jaccard distance score', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.jaccardDistance(s2)).toBe(1-(3/7))
    
  it 'returns a hamming distance', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.hammingDistance(s2)).toBe(4)

  it 'returns a normalized hamming distance (without a reference size)', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.normalizedHammingDistance(s2)).toBe(1-(3/7))

  it 'returns a normalized hamming distance (with a reference size)', ->
    s1 = new Set([1,2,3,4,5])
    s2 = new Set([3,4,5,6,7])
    expect(s1.normalizedHammingDistance(s2,1000)).toBe(4/1000)
    
    
    
    
