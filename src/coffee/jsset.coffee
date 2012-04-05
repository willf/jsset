this.Set = class Set
  constructor: (items=[]) ->
    @store= {}
    @store[item] = item for item in items
  
  add: (object) -> 
    @store[object] = object
    
  contains: (object) ->
    @store[object] || false
    
  delete: (object) ->
    delete(@store[object])
    
  items: () ->
    @store[key] for key in Object.keys(@store)

  size: () -> this.items().length
      
  equals: (other) ->
    s = @store
    eq = true
    for item in this.items()
      do (item) ->
        eq = false unless other.store[item]
    return eq unless eq
    loc = this
    for item in other.items()
      do (item) ->
        eq = false unless loc.store[item]
    return eq

  union: (other) ->
    new Set(other.items().concat(this.items()))
    
  intersection: (other) ->
    ks = []
    for item in this.items()
      do (item) ->
        ks[ks.length] = item if other.contains(item)
    new Set(ks)
    
  difference: (other) ->
    ks = []
    for item in this.items()
      do (item) ->
        ks[ks.length] = item unless other.contains(item)
    new Set(ks)
    
  union_arity: (other) ->
    (this.union(other)).size()

  intersection_arity: (other) ->
    n = 0
    for item in this.items()
      do (item) ->
        n++ if other.contains(item)
    n

  difference_arity: (other) ->
    n = 0
    for item in this.items()
      do (item) ->
        n++ unless other.contains(item)
    n
  
  jaccardIndex: (other) -> this.intersection_arity(other) / this.union_arity(other)

  jaccardDistance: (other) -> 1 - this.jaccardIndex(other)
  
  hammingDistance: (other) ->
    this.union_arity(other) - this.intersection_arity(other)
  
  normalizedHammingDistance: (other,size=null) ->
    if size == null
      this.jaccardDistance(other)
    else
      (this.union_arity(other) - this.intersection_arity(other)) / size
    
    
    
    
    
