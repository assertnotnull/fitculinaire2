defmodule Fitculinaire.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :cooking_time, :string
    field :description, :string
    field :instruction, :string
    field :is_private, :boolean, default: false
    field :notes, :string
    field :preparation_time, :string
    field :title, :string
    field :program_id, :id

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :description, :instruction, :cooking_time, :preparation_time, :notes, :is_private])
    |> validate_required([:title, :description, :instruction, :cooking_time, :preparation_time, :notes, :is_private])
  end
end
