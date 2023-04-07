defmodule Fitculinaire.Repo.Migrations.CreateAliments do
  use Ecto.Migration

  def change do
    create table(:aliments) do
      add :name, :string
      add :quantity, :integer
      add :unit, :string
      add :calories, :integer
      add :protein, :integer
      add :carbs, :integer
      add :carbs_sugar, :integer
      add :carbs_fibre, :integer
      add :sodium, :integer
      add :fat, :integer
      add :fat_trans, :integer
      add :fat_saturated, :integer
      add :cholesterol, :integer
      add :other, :map

      timestamps()
    end
  end
end
