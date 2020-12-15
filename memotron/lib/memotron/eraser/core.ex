defmodule Memotron.Eraser.Core do
  defstruct [:schedule, :text]

  # constructor
  def new(text, steps) when is_binary(text) and is_integer(steps) do
    l = String.length(text)

    schedule = Enum.shuffle(1..l) |> Enum.chunk_every(Kernel.ceil(l/steps))

    %__MODULE__{text: text, schedule: schedule}
  end

  # converter
  #def string_to_array(text) do
  #end

  # reducer
  def erase(eraser) do
    eraser
  end

  def example, do: %{text: "abcde", schedule: [[1, 2, 3], [4, 5]]}
end
