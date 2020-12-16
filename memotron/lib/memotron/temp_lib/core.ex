defmodule Memotron.TempLib.Core do
  @passages [
    %{
      id: :it_crowd,
      text: "Did you try turning it off and on again",
      steps: 2
    },
    %{
      id: :terminator,
      text: "I will be back",
      steps: 2
    },
    %{
      id: :princessbride,
      text: "As you wish",
      steps: 3
    }
  ]

  #Return text
  def find_by_id(id) do
    Enum.find(@passages, fn x -> x.id == id end) |> Map.get(:text)
  end

  def get_first_id() do
    List.first(@passages).id
  end

  #Return next id
  def next(:terminator), do: :princessbride
  def next(:it_crowd), do: :terminator
  def next(:princessbride), do: :it_crowd

  # Return previous id
  def previous(:terminator), do: :it_crowd
  def previous(:it_crowd), do: :princessbride
  def previous(:princessbride), do: :terminator
end
