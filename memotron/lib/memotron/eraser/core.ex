def Memotron.Eraser.Core do
  defstruct [:schedule, :text]
  
  def new(text, steps) do
    %__MODULE__{}
  end
  
  def erase(eraser) do
    eraser
  end
  
  def example, do: %{text: "abcde", schedule: [[1, 2, 3], [4, 5]]}
end