defmodule Fitculinaire.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :description, :string
      add :instruction, :string
      add :cooking_time, :string
      add :preparation_time, :string
      add :notes, :string
      add :is_private, :boolean, default: false, null: false
      add :program_id, references(:programs, on_delete: :nothing)

      timestamps()
    end

    create index(:recipes, [:program_id])
  end
end
