defmodule Memotron.Library.Passage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "passages" do
    field :name, :string
    field :steps, :integer
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(passage, attrs) do
    passage
    |> cast(attrs, [:text, :steps, :name])
    |> validate_required([:text, :steps, :name])
    |> validate_length(:name, min: 2)
    |> validate_length(:text, min: 4)
    |> validate_number(:steps, greater_than: 1, less_than: 10)
  end
end
