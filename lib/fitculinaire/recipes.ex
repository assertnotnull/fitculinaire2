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
end
