defmodule Fitculinaire.ProgramsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Fitculinaire.Programs` context.
  """

  @doc """
  Generate a program.
  """
  def program_fixture(attrs \\ %{}) do
    {:ok, program} =
      attrs
      |> Enum.into(%{
        avg_exercice_duration: "some avg_exercice_duration",
        difficulty: "some difficulty",
        duration: "some duration",
        name: "some name",
        thumbnail: "some thumbnail"
      })
      |> Fitculinaire.Programs.create_program()

    program
  end
end
