# Find the library functions to do the following, and then use each in iex.
# (If the word Elixir or Erlang appears at the end of the challenge, 
# then you’ll find the answer in that set of libraries.)

# – Convert a float to a string with two decimal digits. (Erlang)
:io.format("~.2f~n", [2.0/3.0])

# – Get the value of an operating-system environment variable. (Elixir)
System.get_env("USER")

# – Return the extension component of a file name (so return .exs if given
# "dave/test.exs"). (Elixir)
Path.extname("dave/test.exs")

# – Return the process’s current working directory. (Elixir)
System.cwd()

# – Convert a string containing JSON into Elixir data structures. (Just
# find; don’t install.)
# ...
# – Execute a command in your operating system’s shell.
System.cmd("date", [])
