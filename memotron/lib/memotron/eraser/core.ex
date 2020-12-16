defmodule Memotron.Eraser.Core do
  defstruct [:schedule, :text]
  @dnr [".", "," ," ", "/n", "?"]

  def new(text, steps) when is_binary(text) and is_integer(steps) do
    text_length = String.length(text)
    reds_per_step = Kernel.ceil(text_length/steps)
    schedule =
      1..text_length
      |> Enum.shuffle()
      |> Enum.chunk_every(reds_per_step)

    %__MODULE__{text: text, schedule: schedule}
  end

  def erase(%{schedule: []} = eraser) do
    eraser
  end

  def erase(%{schedule: [replacements | schedule], text: text} = eraser) do
    %{eraser | schedule: schedule, text: replace(text, replacements)}
  end

  defp replace(text, replacements) do
    text
    |> String.graphemes()
    |> Enum.with_index(1)
    |> Enum.map(fn {char, i} ->
      replace_character(char, i in replacements)
    end)
    |> Enum.join()
  end


  defp replace_character(character, true) when character in @dnr do
    character
  end

  defp replace_character(_character, true) do
    "_"
  end

  defp replace_character(character, false) do
    character
  end
end
