defmodule MyFile do
  def read_first_line(filename) do
    case File.open(filename) do
      {:ok, file} ->
        IO.puts "First line: #{IO.read(file, :line)}" 
      {:error, reason} ->
        IO.puts "Failed to open file: #{reason}"
    end
  end
end

MyFile.read_first_line("test_file.txt")
MyFile.read_first_line("nothing.txt")
