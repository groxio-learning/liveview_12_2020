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
  end
end
