defmodule Fitculinaire.Recipes do
  @moduledoc """
  The Recipes context.
  """

  import Ecto.Query, warn: false
  alias Fitculinaire.Repo

  alias Fitculinaire.Recipes.Aliment

  @doc """
  Returns the list of aliments.

  ## Examples

      iex> list_aliments()
      [%Aliment{}, ...]

  """
  def list_aliments do
    Repo.all(Aliment)
  end

  @doc """
  Gets a single aliment.

  Raises `Ecto.NoResultsError` if the Aliment does not exist.

  ## Examples

      iex> get_aliment!(123)
      %Aliment{}

      iex> get_aliment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_aliment!(id), do: Repo.get!(Aliment, id)

  @doc """
  Creates a aliment.

  ## Examples

      iex> create_aliment(%{field: value})
      {:ok, %Aliment{}}

      iex> create_aliment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_aliment(attrs \\ %{}) do
    %Aliment{}
    |> Aliment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a aliment.

  ## Examples

      iex> update_aliment(aliment, %{field: new_value})
      {:ok, %Aliment{}}

      iex> update_aliment(aliment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_aliment(%Aliment{} = aliment, attrs) do
    aliment
    |> Aliment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a aliment.

  ## Examples

      iex> delete_aliment(aliment)
      {:ok, %Aliment{}}

      iex> delete_aliment(aliment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_aliment(%Aliment{} = aliment) do
    Repo.delete(aliment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking aliment changes.

  ## Examples

      iex> change_aliment(aliment)
      %Ecto.Changeset{data: %Aliment{}}

  """
  def change_aliment(%Aliment{} = aliment, attrs \\ %{}) do
    Aliment.changeset(aliment, attrs)
  end

  alias Fitculinaire.Recipes.Recipe

  @doc """
  Returns the list of recipes.

  ## Examples

      iex> list_recipes()
      [%Recipe{}, ...]

  """
  def list_recipes do
    Repo.all(Recipe)
  end

  @doc """
  Gets a single recipe.

  Raises `Ecto.NoResultsError` if the Recipe does not exist.

  ## Examples

      iex> get_recipe!(123)
      %Recipe{}

      iex> get_recipe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_recipe!(id), do: Repo.get!(Recipe, id)

  @doc """
  Creates a recipe.

  ## Examples

      iex> create_recipe(%{field: value})
      {:ok, %Recipe{}}

      iex> create_recipe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_recipe(attrs \\ %{}) do
    %Recipe{}
    |> Recipe.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a recipe.

  ## Examples

      iex> update_recipe(recipe, %{field: new_value})
      {:ok, %Recipe{}}

      iex> update_recipe(recipe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_recipe(%Recipe{} = recipe, attrs) do
    recipe
    |> Recipe.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a recipe.

  ## Examples

      iex> delete_recipe(recipe)
      {:ok, %Recipe{}}

      iex> delete_recipe(recipe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_recipe(%Recipe{} = recipe) do
    Repo.delete(recipe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking recipe changes.

  ## Examples

      iex> change_recipe(recipe)
      %Ecto.Changeset{data: %Recipe{}}

  """
  def change_recipe(%Recipe{} = recipe, attrs \\ %{}) do
    Recipe.changeset(recipe, attrs)
  end

  def normalize(%Aliment{} = aliment, quantity) do
    keys = Map.keys(aliment)

    Enum.map(keys, fn key ->
      Map.update(aliment, key, 0, fn v -> normalize_value(v, quantity) end)
    end)

    aliment
  end

  defp normalize_value(value, quantity) when is_number(value) and is_number(quantity) do
    case value do
      0 ->
        0

      _ ->
        round(value / quantity * 100)
    end
  end

  def convert_and_add(%Aliment{} = aliment) do
    aliment
    |> normalize(aliment.quantity)
    |> create_aliment()
  end
end
