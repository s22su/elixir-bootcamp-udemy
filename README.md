# elixir-bootcamp-udemy
My code written during Udemy course "The Complete Elixir and Phoenix Bootcamp"
**Link:** https://www.udemy.com/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/

# Some commands

To run cards module:
* `cd cards`
* `iex -S mix`

# Some notes (what I learned)

## **Section 1**

- Check documentation, many functions are built in (Enum + List used so far)
- Two list comprehensions (outer and inner comprehension) is bad! Result is list of lists and we need to flattern it.
- We can run multiple comprehendsions at once

## **Section 2**

- Pattern matching is Elixir's replacement for variable assignment
- Code -> Elixir -> transpiled to Erlang -> run in BEAM (VM)
- Case + do - for error handling, each case on one line
- atoms (:ok, :error)
- Underscore in front of variable name means that we know that there will be some variable but we don't care about it and we need it there because of pattern matching
- pipe operator (|>), takes return value and passes to next function as FIRST argument