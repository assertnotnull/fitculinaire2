defmodule Fitculinaire.Recipes.Aliment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "aliments" do
    field :calories, :integer
    field :carbs, :integer
    field :carbs_fibre, :integer
    field :carbs_sugar, :integer
    field :cholesterol, :integer
    field :fat, :integer
    field :fat_saturated, :integer
    field :fat_trans, :integer
    field :name, :string
    field :other, :map
    field :protein, :integer
    field :quantity, :integer
    field :sodium, :integer
    field :unit, Ecto.Enum, values: [:ml, :g]

    timestamps()
  end

  @doc false
  def changeset(aliment, attrs) do
    aliment
    |> cast(attrs, [:name, :quantity, :unit, :calories, :protein, :carbs, :carbs_sugar, :carbs_fibre, :sodium, :fat, :fat_trans, :fat_saturated, :cholesterol, :other])
    |> validate_required([:name, :quantity, :unit, :calories, :protein, :carbs, :carbs_sugar, :carbs_fibre, :sodium, :fat, :fat_trans, :fat_saturated, :cholesterol, :other])
  end
end
