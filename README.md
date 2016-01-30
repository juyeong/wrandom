# wrandom
Ruby weighted random

## Installation
```sh
gem install wrandom
```

## Usage
```ruby
arr = [1, 2, 3]

# Choose a weighted random element from the array.
arr.wsample { |v| v * 10 }  #=> 3

# Choose n weighted random elements from the array.
arr.wsample(2) { |v| v * 10 }  #=> [3, 2]

# Returns a new array with shuffled by weight.
arr.wshuffle { |v| v * 10 }  #=> [3, 2, 1]
arr #=> [1, 2, 3]

# Shuffles elements by weight.
arr.wshuffle! { |v| v * 10 }  #=> [3, 2, 1]
arr #=> [3, 2, 1]
```

```ruby
# [1,9].sample
Hash[100_000.times.map { [1,9].sample            }.group_by(&:to_i).map { |k,v| [k, (v.size.to_f / 1000)]}]
#=> {1=>50.111, 9=>49.889}

# [1,9].wsample { |v| 1 }
Hash[100_000.times.map { [1,9].wsample { |v| 1 } }.group_by(&:to_i).map { |k,v| [k, (v.size.to_f / 1000)]}]
#=> {1=>50.111, 9=>49.889}

# [1,9].wsample { |v| v }
Hash[100_000.times.map { [1,9].wsample { |v| v } }.group_by(&:to_i).map { |k,v| [k, (v.size.to_f / 1000)]}]
#=> {9=>89.887, 1=>10.113}
```
##License
[The MIT License (MIT)](https://github.com/juyeong/wrandom/blob/master/LICENSE)
