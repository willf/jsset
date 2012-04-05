
describe "Javacript Sets", ->
  it 'allows the creation of union of two sets', ->
    s1 = [1,2,3,4,5]
    s2 = [3,4,5,6,7]
    expected = [1,2,3,4,5,6,7]
    p = union(s1,s2)
    expect(p).toContain(item) for item in expected

  it 'allows the creation of union of two sets, one of which is empty', ->
    s1 = [1,2,3,4,5]
    s2 = []
    expected = [1,2,3,4,5]
    p = union(s1,s2)
    expect(p).toContain(item) for item in expected

  it 'allows the creation of union of two sets, both of which is empty', ->
    s1 = []
    s2 = []
    p = union(s1,s2)
    expect(p.length).toBe(0)
    
  it 'allows the creation of the intersection of two sets', ->
    s1 = [1,2,3,4,5]
    s2 = [3,4,5,6,7]
    expected = [3,4,5]
    unexpected= [1,2,6,7]
    p = intersection(s1,s2)
    expect(p).toContain(item) for item in expected
    expect(p).toNotContain(item) for item in unexpected

  it 'allows the creation of the difference of two sets', ->
    s1 = [1,2,3,4,5]
    s2 = [3,4,5,6,7]
    expected = [1,2]
    unexpected= [3,4,5,6,7]
    p = difference(s1,s2)
    expect(p).toContain(item) for item in expected
    expect(p).toNotContain(item) for item in unexpected

  it 'returns the empty set if intesecting with an empty set', ->
    s1 = [1,2,3,4,5]
    s2 = []
    expected = []
    p = intersection(s1,s2)    
    unexpected= s1
    expect(p).toNotContain(item) for item in unexpected
    expect(p.length).toBe(0)

  it 'returns the empty set if both sets are empty', ->
    s1 = []
    s2 = []
    expected = []
    p = intersection(s1,s2)    
    expect(p.length).toBe(0)
    
  it 'returns a (cheaper) arity for union', ->
    s1 = [1,2,3,4,5]
    s2 = [3,4,5,6,7]
    expect(union_arity(s1,s2)).toBe(7)
  
  it 'returns a (cheaper) arity for intersection', ->
    s1 = [1,2,3,4,5]
    s2 = [3,4,5,6,7]
    expect(intersection_arity(s1,s2)).toBe(3)

  it 'returns a (cheaper) arity for difference', ->
    s1 = [1,2,3,4,5]
    s2 = [3,4,5,6,7]
    expect(difference_arity(s1,s2)).toBe(2)

  it 'returns a jaccard index score', ->
    s1 = [1,2,3,4,5]
    s2 = [3,4,5,6,7]
    expect(jaccardIndex(s1,s2)).toBe(3/7)
  
  it 'returns a jaccard distance score', ->
    s1 = [1,2,3,4,5]
    s2 = [3,4,5,6,7]
    expect(jaccardDistance(s1,s2)).toBe(1-(3/7))

  it 'returns a hamming distance', ->
    s1 = [1,2,3,4,5]
    s2 = [3,4,5,6,7]
    expect(hammingDistance(s1,s2)).toBe(4)
    
  it 'returns a normalized hamming distance (with a reference size)', ->
    s1 = [1,2,3,4,5]
    s2 = [3,4,5,6,7]
    expect(normalizedHammingDistance(s1,s2,1000)).toBe(4/1000)
    
    
    
