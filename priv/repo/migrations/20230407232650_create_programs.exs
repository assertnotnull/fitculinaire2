defmodule Fitculinaire.Repo.Migrations.CreatePrograms do
  use Ecto.Migration

  def change do
    create table(:programs) do
      add :name, :string
      add :duration, :string
      add :avg_exercice_duration, :string
      add :difficulty, :string
      add :thumbnail, :string

      timestamps()
    end
  end
end
