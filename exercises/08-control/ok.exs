# Write an ok! function that takes an arbitrary parameter.
# If the parameter is the tuple {:ok, data}, return the data.
# Otherwise, raise an exception containing information from the parameter.

# You could use your function like this:
# file = ok! File.open("somefile")

defmodule Utils do
  def ok!({:ok, data}), do: data
  def ok!({error_type, error_msg}), do: raise("#{error_type}: #{error_msg}")
end

IO.inspect Utils.ok! File.open("Rakefile")
Utils.ok! File.open("missing_file")
