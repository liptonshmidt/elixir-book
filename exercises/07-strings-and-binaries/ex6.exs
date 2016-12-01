# Write a function to capitalize the sentences in a string.
# Each sentence is terminated by a period and a space.
# Right now, the case of the characters in the string is random.

import Enum, only: [map: 2, join: 2]
import String, only: [split: 2, capitalize: 1]

defmodule MyString do
  def capitalize_sequances(str) do
    split(str, ". ") |> map(&capitalize/1) |> join(". ")
  end
end


IO.inspect MyString.capitalize_sequances("oh. a DOG. woof. ")
# =>  "Oh. A dog. Woof"
