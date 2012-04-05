this.intersection = (a, b) ->
  r = []
  h = new Object
  h[item]=true for item in a
  r.push(item) for item in b when h[item]
  r
  
this.union = (a,b)  ->
  r = []
  h = new Object
  h[item]=true for item in a
  r.push(item) for item in a 
  r.push(item) for item in b when !h[item]
  r

this.difference = (a, b) ->
  r = []
  h = new Object
  h[item]=true for item in b
  r.push(item) for item in a when !h[item]
  r

this.intersection_arity = (a,b)  ->
  count = 0
  h = new Object
  h[item]=true for item in a
  count++ for item in b when h[item]
  count

this.union_arity = (a,b)  ->
  count = a.length
  h = new Object
  h[item]=true for item in a
  count++ for item in b when !h[item]
  count

this.difference_arity = (a, b) ->
  count = 0
  h = new Object
  h[item]=true for item in b
  count++ for item in a when !h[item]
  count
  
this.jaccardIndex = (a,b) ->
  intersection_arity(a,b) / union_arity(a,b)

this.jaccardDistance = (a,b) ->
  1 - jaccardIndex(a,b)

this.hammingDistance = (a,b) ->
  difference_arity(a,b) + difference_arity(b,a)

this.normalizedHammingDistance = (a,b,size)->
  hammingDistance(a,b) / size
  