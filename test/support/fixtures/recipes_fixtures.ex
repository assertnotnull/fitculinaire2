defmodule Fitculinaire.RecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Fitculinaire.Recipes` context.
  """

  @doc """
  Generate a aliment.
  """
  def aliment_fixture(attrs \\ %{}) do
    {:ok, aliment} =
      attrs
      |> Enum.into(%{
        calories: 42,
        carbs: 42,
        carbs_fibre: 42,
        carbs_sugar: 42,
        cholesterol: 42,
        fat: 42,
        fat_saturated: 42,
        fat_trans: 42,
        name: "some name",
        other: %{},
        protein: 42,
        quantity: 42,
        sodium: 42,
        unit: :ml
      })
      |> Fitculinaire.Recipes.create_aliment()

    aliment
  end
end
