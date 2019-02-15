defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

# Let's create sample report
# report = %BugReport{owner: %Customer{name: "Dave", company: "WrongName"}, details: "stuff", severity: 3}



# We'll use put_in for updating nested structures
# put_in(report.owner.company, "CorrectName")



# We can provide our function when using update_in
# update_in(report.owner.name, &("Mr. " <> &1))
