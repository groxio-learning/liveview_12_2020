defmodule Memotron.Core do
  def new(initial_value \\ 0) when is_integer(initial_value) do
    initial_value
  end

  def increment(value) do
    value + 1
  end
end
