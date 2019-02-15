defmodule Parse do
  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str),           do: _number_digits(str,  0)

  defp _number_digits([], value), do: value
  defp _number_digits([ digit | tail ], value)
  when digit in '0123456789' do
    _number_digits(tail, value*10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end
end



defmodule MyString do
  def calculate (str) do
    _parse([], str)
  end

  defp _parse(left_num, [ sign | right_num ])
  when sign in '+-/*' do
    _perform_operation(sign, left_num, right_num)
  end

  defp _parse(left_num, [ digit | tail ])
  when digit in '0123456789' do
    _parse(left_num ++ [digit], tail)
  end

  defp _parse(_, [ non_digit | _ ]) do
    raise "Invalid digit '#{[non_digit]}'"
  end

  defp _perform_operation(sign, left_num, right_num) do
    l = Parse.number(left_num)
    r = Parse.number(right_num)

    case sign do
      ?+ ->
        l + r
      ?- ->
        l - r
      ?* ->
        l * r
      ?/ ->
        l / r
      _  ->
        raise "Invalid sign"
    end
  end
end

# IO.inspect Parse.number('1+2')


IO.inspect MyString.calculate('123+27') # => 150
IO.inspect MyString.calculate('10-5') # => 5
IO.inspect MyString.calculate('1*0') # => 0
IO.inspect MyString.calculate('4/2') # => 2
