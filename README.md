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

## **Section 3**

- Specific syntax for documentation
- Examples are tests too (doctests)
- Can make assertions in separate file (case tests)
- assert vs. refute keywords

## **Section 4**

### **Maps**

- Map: `%{primary: "red", secondary: "blue"}`
- Pattern matching with maps: `%{secondary: secondary_color} = colors` (secondary_color will be "blue")
- Update map method 1: `Map.put(map, key, value)`, NB! `:key`
- Method map method 2: `%{ colors | primary: "blue"}`, NB! Can be used only if key exists in a map.
- Adding value `Map.put(colors, :white, "black")`

### **Keyword lists**

- Keyword list: `colors = [{:primary, "red"}, {:secondary, "green"}]` -> returns `[primary: "red", secondary: "green"]`
- Access: `colors[:primary]`
- Second syntax to crete: `colors = [primary: "red", secondary: "green"]`
- `colors = [primary: "red", primary: "green"]`, it is valid and keywor list can have many same "keys"
- Usage is for example when working with DB-s
- Shortcut: if passing keyword list to a function as a last argument we can omit square braces, also can remove parenthesis

## **Section 5 & Section 6**

- Pipe operator is cool
- Struct is a map that is used to store data in Elixir application
- Structs can be assigned default values
- Only properties that are defined can exist in a struct
- Caring about only first three values in a list: `[r, g, b | _tail] = hex_list`
- Tuple should be used when each element has particular meaning like `color = {r, g, b}`
- needed to add `{:egd, github: "erlang/egd"}` to mix deps
- Identicon for "s22su":

![Identicon for s22su ](identicon/s22su.png)

## Section 7 - Phoenix 🔥

- use `asdf` to install older elixir (1.4) and erlang (19)
- installation (v1.2) `mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new-1.2.5.ez`
- `mix phoenix.new discuss`
- `mix deps.get`
- `mix ecto.create`
- `mix phoenix.server`

## Section 8

- `iex -S mix phoenix.server`
- HTML is in `templates` directory!
- `mix ecto.gen.migration add_topics`
- `mix ecto.migrate`
- `import`, `alias`, `use`

## Section 9

- `func(params \\ %{})` - if we pass `nil` as a param, it will be defaulted to an empty map.
- `%{"topic" => topic} = params` to get "topic" from posted form (pattern matching 💯)

## Section 10

- Ecto deals with _Changeset_ and _Repo_
- Repo insert stuff to database
- `Discuss.Repo.all(Discuss.Topic)`
- Simple CRUD for topics is created 🤩
- `resources "/topics", TopicController`

## Section 11

- 'conn.assigns` = shared user data as a map - useful info from Ueberauth goes there
- 