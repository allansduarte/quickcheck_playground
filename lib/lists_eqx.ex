defmodule QuickcheckPlayground.ListsEQC do
  def sorted?([]), do: true

  def sorted?(list) do
    list
    |> Enum.zip(tl(list))
    |> Enum.all?(fn {x, y} -> x <= y end)
  end
end
