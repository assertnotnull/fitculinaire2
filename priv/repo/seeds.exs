# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Fitculinaire.Repo.insert!(%Fitculinaire.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Fitculinaire.Recipes.Aliment
alias Fitculinaire.Recipes.Recipe
alias Fitculinaire.Recipes
alias Fitculinaire.Programs


Recipes.convert_and_add(%Aliment{name: "chicken", quantity: 100, unit: :g, calories: })
Recipes.convert_and_add(%Aliment{name: "brocoli", quantity: 100, unit: :g, calories: })
