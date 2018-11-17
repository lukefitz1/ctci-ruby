require_relative './chapter_one/strings_and_arrays'
require 'rspec/expectations'
include RSpec::Matchers

chpt1 = StringsAndArrays.new
# 1.1 - part 1
expect(chpt1.is_unique("This is not a unique string")).to be(false)
expect(chpt1.is_unique("Unique strg")).to be(true)

# 1.1 - part 2
expect(chpt1.is_unique_no_structure("abcdefgh")).to be(true)
expect(chpt1.is_unique_no_structure("abcdefghf")).to be(false)

# 1.2
expect(chpt1.is_permutation("string", "gnirts")).to be(true)
expect(chpt1.is_permutation("strinighiohlwg", "gnifdfdrtsffes")).to be (false)

# 1.3
expect(chpt1.urlify("Mr John Smith   ", 13)).to eq('Mr%20John%20Smith')
expect(chpt1.urlify("This is another string   ", 22)).to eq('This%20is%20another%20string')

# 1.4
expect(chpt1.palindrome_permutation("tac cato")).to be(true)
expect(chpt1.palindrome_permutation("taco cato")).to be(true)
expect(chpt1.palindrome_permutation("taco cAto")).to be(true)
expect(chpt1.palindrome_permutation("this string")).to be(false)
expect(chpt1.palindrome_permutation("not a permutation")).to be(false)

# 1.5
expect(chpt1.one_away("pa", "pab")).to be(true)
expect(chpt1.one_away("pall", "pb")).to be(false)
expect(chpt1.one_away("pale", "ple")).to be(true)
expect(chpt1.one_away("pales", "pale")).to be(true)
expect(chpt1.one_away("pale", "bale")).to be(true)
expect(chpt1.one_away("pale", "bake")).to be(false)
expect(chpt1.one_away("palles", "pale")).to be(false)

# 1.6
expect(chpt1.string_compression("aabcccccaaa")).to eq('a2b1c5a3')
expect(chpt1.string_compression("abcdkgie")).to eq('abcdkgie')
expect(chpt1.string_compression("dddoegjeiegegkkkkkkfgiwgjwwlll")).to eq('d3o1e1g1j1e1i1e1g1e1g1k6f1g1i1w1g1j1w2l3')