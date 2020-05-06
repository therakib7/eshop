defmodule Eshop.ConditionsTest do
  use Eshop.DataCase

  alias Eshop.Conditions

  describe "term_conditions" do
    alias Eshop.Conditions.TermCondition

    @valid_attrs %{content: "some content", native_content: "some native_content", type: 42, type_id: 42}
    @update_attrs %{content: "some updated content", native_content: "some updated native_content", type: 43, type_id: 43}
    @invalid_attrs %{content: nil, native_content: nil, type: nil, type_id: nil}

    def term_condition_fixture(attrs \\ %{}) do
      {:ok, term_condition} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Conditions.create_term_condition()

      term_condition
    end

    test "list_term_conditions/0 returns all term_conditions" do
      term_condition = term_condition_fixture()
      assert Conditions.list_term_conditions() == [term_condition]
    end

    test "get_term_condition!/1 returns the term_condition with given id" do
      term_condition = term_condition_fixture()
      assert Conditions.get_term_condition!(term_condition.id) == term_condition
    end

    test "create_term_condition/1 with valid data creates a term_condition" do
      assert {:ok, %TermCondition{} = term_condition} = Conditions.create_term_condition(@valid_attrs)
      assert term_condition.content == "some content"
      assert term_condition.native_content == "some native_content"
      assert term_condition.type == 42
      assert term_condition.type_id == 42
    end

    test "create_term_condition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conditions.create_term_condition(@invalid_attrs)
    end

    test "update_term_condition/2 with valid data updates the term_condition" do
      term_condition = term_condition_fixture()
      assert {:ok, %TermCondition{} = term_condition} = Conditions.update_term_condition(term_condition, @update_attrs)
      assert term_condition.content == "some updated content"
      assert term_condition.native_content == "some updated native_content"
      assert term_condition.type == 43
      assert term_condition.type_id == 43
    end

    test "update_term_condition/2 with invalid data returns error changeset" do
      term_condition = term_condition_fixture()
      assert {:error, %Ecto.Changeset{}} = Conditions.update_term_condition(term_condition, @invalid_attrs)
      assert term_condition == Conditions.get_term_condition!(term_condition.id)
    end

    test "delete_term_condition/1 deletes the term_condition" do
      term_condition = term_condition_fixture()
      assert {:ok, %TermCondition{}} = Conditions.delete_term_condition(term_condition)
      assert_raise Ecto.NoResultsError, fn -> Conditions.get_term_condition!(term_condition.id) end
    end

    test "change_term_condition/1 returns a term_condition changeset" do
      term_condition = term_condition_fixture()
      assert %Ecto.Changeset{} = Conditions.change_term_condition(term_condition)
    end
  end
end
