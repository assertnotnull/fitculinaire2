defmodule Fitculinaire.RecipesTest do
  use Fitculinaire.DataCase

  alias Fitculinaire.Recipes

  describe "aliments" do
    alias Fitculinaire.Recipes.Aliment

    import Fitculinaire.RecipesFixtures

    @invalid_attrs %{calories: nil, carbs: nil, carbs_fibre: nil, carbs_sugar: nil, cholesterol: nil, fat: nil, fat_saturated: nil, fat_trans: nil, name: nil, other: nil, protein: nil, quantity: nil, sodium: nil, unit: nil}

    test "list_aliments/0 returns all aliments" do
      aliment = aliment_fixture()
      assert Recipes.list_aliments() == [aliment]
    end

    test "get_aliment!/1 returns the aliment with given id" do
      aliment = aliment_fixture()
      assert Recipes.get_aliment!(aliment.id) == aliment
    end

    test "create_aliment/1 with valid data creates a aliment" do
      valid_attrs = %{calories: 42, carbs: 42, carbs_fibre: 42, carbs_sugar: 42, cholesterol: 42, fat: 42, fat_saturated: 42, fat_trans: 42, name: "some name", other: %{}, protein: 42, quantity: 42, sodium: 42, unit: :ml}

      assert {:ok, %Aliment{} = aliment} = Recipes.create_aliment(valid_attrs)
      assert aliment.calories == 42
      assert aliment.carbs == 42
      assert aliment.carbs_fibre == 42
      assert aliment.carbs_sugar == 42
      assert aliment.cholesterol == 42
      assert aliment.fat == 42
      assert aliment.fat_saturated == 42
      assert aliment.fat_trans == 42
      assert aliment.name == "some name"
      assert aliment.other == %{}
      assert aliment.protein == 42
      assert aliment.quantity == 42
      assert aliment.sodium == 42
      assert aliment.unit == :ml
    end

    test "create_aliment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_aliment(@invalid_attrs)
    end

    test "update_aliment/2 with valid data updates the aliment" do
      aliment = aliment_fixture()
      update_attrs = %{calories: 43, carbs: 43, carbs_fibre: 43, carbs_sugar: 43, cholesterol: 43, fat: 43, fat_saturated: 43, fat_trans: 43, name: "some updated name", other: %{}, protein: 43, quantity: 43, sodium: 43, unit: :g}

      assert {:ok, %Aliment{} = aliment} = Recipes.update_aliment(aliment, update_attrs)
      assert aliment.calories == 43
      assert aliment.carbs == 43
      assert aliment.carbs_fibre == 43
      assert aliment.carbs_sugar == 43
      assert aliment.cholesterol == 43
      assert aliment.fat == 43
      assert aliment.fat_saturated == 43
      assert aliment.fat_trans == 43
      assert aliment.name == "some updated name"
      assert aliment.other == %{}
      assert aliment.protein == 43
      assert aliment.quantity == 43
      assert aliment.sodium == 43
      assert aliment.unit == :g
    end

    test "update_aliment/2 with invalid data returns error changeset" do
      aliment = aliment_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_aliment(aliment, @invalid_attrs)
      assert aliment == Recipes.get_aliment!(aliment.id)
    end

    test "delete_aliment/1 deletes the aliment" do
      aliment = aliment_fixture()
      assert {:ok, %Aliment{}} = Recipes.delete_aliment(aliment)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_aliment!(aliment.id) end
    end

    test "change_aliment/1 returns a aliment changeset" do
      aliment = aliment_fixture()
      assert %Ecto.Changeset{} = Recipes.change_aliment(aliment)
    end
  end
end
