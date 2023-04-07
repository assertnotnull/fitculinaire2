defmodule Fitculinaire.Programs.Program do
  use Ecto.Schema
  import Ecto.Changeset

  schema "programs" do
    field :avg_exercice_duration, :string
    field :difficulty, :string
    field :duration, :string
    field :name, :string
    field :thumbnail, :string

    timestamps()
  end

  @doc false
  def changeset(program, attrs) do
    program
    |> cast(attrs, [:name, :duration, :avg_exercice_duration, :difficulty, :thumbnail])
    |> validate_required([:name, :duration, :avg_exercice_duration, :difficulty, :thumbnail])
  end
end
