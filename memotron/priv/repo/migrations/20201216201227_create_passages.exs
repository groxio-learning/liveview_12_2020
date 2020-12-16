defmodule Memotron.Repo.Migrations.CreatePassages do
  use Ecto.Migration

  def change do
    create table(:passages) do
      add :text, :text
      add :steps, :integer
      add :name, :string

      timestamps()
    end

  end
end
