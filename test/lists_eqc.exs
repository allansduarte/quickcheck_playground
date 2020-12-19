defmodule ListsEQCTest do
  use ExUnit.Case
  use EQC.ExUnit
  alias QuickcheckPlayground.ListsEQC

  property "reversing a list twice yields the original list" do
    forall l <- list(int()) do
      ensure(l |> Enum.reverse() |> Enum.reverse() == l)
    end
  end

  property "sorting works" do
    forall l <- list(int()) do
      ensure(l |> Enum.sort() |> ListsEQC.sorted?() == true)
    end
  end

  property "tail of list" do
    forall l <- non_empty(list(int())) do
      implies l != [] do
        [_head | tail] = l
        ensure(tl(l) == tail)
      end
    end
  end

  property "list concatenation" do
    forall {l1, l2} <- {list(int()), list(int())} do
      ensure(Enum.concat(l1, l2) == l1 ++ l2)
    end
  end
end
