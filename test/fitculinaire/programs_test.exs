defmodule Fitculinaire.ProgramsTest do
  use Fitculinaire.DataCase

  alias Fitculinaire.Programs

  describe "programs" do
    alias Fitculinaire.Programs.Program

    import Fitculinaire.ProgramsFixtures

    @invalid_attrs %{avg_exercice_duration: nil, difficulty: nil, duration: nil, name: nil, thumbnail: nil}

    test "list_programs/0 returns all programs" do
      program = program_fixture()
      assert Programs.list_programs() == [program]
    end

    test "get_program!/1 returns the program with given id" do
      program = program_fixture()
      assert Programs.get_program!(program.id) == program
    end

    test "create_program/1 with valid data creates a program" do
      valid_attrs = %{avg_exercice_duration: "some avg_exercice_duration", difficulty: "some difficulty", duration: "some duration", name: "some name", thumbnail: "some thumbnail"}

      assert {:ok, %Program{} = program} = Programs.create_program(valid_attrs)
      assert program.avg_exercice_duration == "some avg_exercice_duration"
      assert program.difficulty == "some difficulty"
      assert program.duration == "some duration"
      assert program.name == "some name"
      assert program.thumbnail == "some thumbnail"
    end

    test "create_program/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Programs.create_program(@invalid_attrs)
    end

    test "update_program/2 with valid data updates the program" do
      program = program_fixture()
      update_attrs = %{avg_exercice_duration: "some updated avg_exercice_duration", difficulty: "some updated difficulty", duration: "some updated duration", name: "some updated name", thumbnail: "some updated thumbnail"}

      assert {:ok, %Program{} = program} = Programs.update_program(program, update_attrs)
      assert program.avg_exercice_duration == "some updated avg_exercice_duration"
      assert program.difficulty == "some updated difficulty"
      assert program.duration == "some updated duration"
      assert program.name == "some updated name"
      assert program.thumbnail == "some updated thumbnail"
    end

    test "update_program/2 with invalid data returns error changeset" do
      program = program_fixture()
      assert {:error, %Ecto.Changeset{}} = Programs.update_program(program, @invalid_attrs)
      assert program == Programs.get_program!(program.id)
    end

    test "delete_program/1 deletes the program" do
      program = program_fixture()
      assert {:ok, %Program{}} = Programs.delete_program(program)
      assert_raise Ecto.NoResultsError, fn -> Programs.get_program!(program.id) end
    end

    test "change_program/1 returns a program changeset" do
      program = program_fixture()
      assert %Ecto.Changeset{} = Programs.change_program(program)
    end
  end
end
