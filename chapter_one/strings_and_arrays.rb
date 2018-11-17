class StringsAndArrays
	
	# 1.1 - Is Unique
	# Implement and algorithm to determine if a string has all unique characters
	def is_unique(string)
		hash = {}
		chars = string.split('')
		chars.each do |char|
			if !hash.key?(char)
				hash[char] = 1
			else
				return false
			end
		end

		return true
	end

	# 1.1 - Is Unique (part 2)
	# What if you cannot use additional data structures?
	def is_unique_no_structure(string)
		chars = string.split('')
		chars.each_with_index do |char, i|
			chars.drop(i + 1).each do |char2|
				if char == char2
					return false
				end
			end
		end

		return true
	end

	# 1.2 - Check Permutation
	# Given two strings, write a method to decide if one is a permutation of the other
	def is_permutation(string1, string2)
		string1.chars.sort.join == string2.chars.sort.join
	end

	# 1.3 - URLify
	# Write a method to replace all spaces in a string with '%20'
	# You may assume that the string has sufficient space at the end to hold all the additiona characters, 
	# and that you are given the 'true' length of the string. 
	# Input "Mr John Smith  ", 13
	# Output "Mr%20John%20Smith"
	def urlify(string, string_length)
		chars = string.rstrip.split('')
		chars.each_with_index do |char, index|
			if char == ' '
				chars.delete_at(index)
				chars.insert(index, '%', '2', '0')
			end
		end

		return chars.join('')
	end

	# 1.4 - Palindrome Permutation
	# Given a string, write a function to check if it is a permutation of a palindrome. 
	# A palindrome is a word of phrase that is the same forwards and backwords.
	# A permutation is a rearrangement of letters. 
	# The palindrome does not need to be limited to just dictionary words
	def palindrome_permutation(string)
		no_spaces = string.gsub(/\s+/, "").downcase
		chars = no_spaces.split('')
		hash = {}
		ct = 0
		single_char = 0
		chars.each do |char|
			if hash.key? char
				hash[char] = hash[char] + 1
			else
				hash[char] = 1
			end
		end

		hash.each do |key, value|
			if value == 1
				single_char = single_char + 1
				if single_char > 1
					return false
				end
			else
				if value % 2 != 0
					return false
				end
			end
		end

		return true
	end

	# 1.5 One Away
	# There are three types of edits that can be performed on strings: insert a character, 
	# remove a character, or replace a character. Given two strings, write a function to check
	# if they are one edit (or zero edits) away
	def one_away(string1, string2)
		chars1 = string1.split('')
		chars2 = string2.split('')
		length_diff = false

		if string1 == string2
			return true
		end

		if (string1.length - string2.length).abs > 1
			return false
		elsif string1.length != string2.length
			length_diff = true
		end

		if chars2.length > chars1.length
			temp = chars1
			chars1 = chars2
			chars2 = temp
		end

		differences = 0
		step_back = 0
		chars1.each_with_index do |c1, i|
			# if there is a difference in the length, and we have reached the last index of the longer string
			# we will know at this point that there is 1 or fewer differences
			if length_diff && i == (chars1.length - 1)
				return true
			end

			if c1 != chars2[i] && step_back == 0
				differences = differences + 1
				
				# if the 2 strings have a different length, we need to be sure to step back
				# in the 2nd string when doing the comparison if we find a missing character in one 
				if length_diff
					step_back = 1
				end
			elsif c1 != chars2[i - 1] && step_back == 1
				differences = differences + 1
			end

			if differences > 1
				return false
			end
		end

		return true
	end

	

end