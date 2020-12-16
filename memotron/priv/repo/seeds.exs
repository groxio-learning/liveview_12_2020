# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Memotron.Repo.insert!(%Memotron.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

[
  %{
    name: "IT Crowd",
    text: "Did you try turning it off and on again",
    steps: 2
  },
  %{
    name: "Terminator",
    text: "I will be back",
    steps: 2
  },
  %{
    name: "The Princess Bride",
    text: "As you wish",
    steps: 3
  }
]
|> Enum.map(&Memotron.Library.create_passage(&1))
