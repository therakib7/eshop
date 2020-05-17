defmodule Eshop.ConditionsTest do
  use Eshop.DataCase

  alias Eshop.Conditions

  describe "term_conditions" do
    alias Eshop.Conditions.TermCondition

    @valid_attrs %{
      content: "some content",
      native_content: "some native_content",
      type: 42,
      type_id: 42
    }
    @update_attrs %{
      content: "some updated content",
      native_content: "some updated native_content",
      type: 43,
      type_id: 43
    }
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
      assert {:ok, %TermCondition{} = term_condition} =
               Conditions.create_term_condition(@valid_attrs)

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

      assert {:ok, %TermCondition{} = term_condition} =
               Conditions.update_term_condition(term_condition, @update_attrs)

      assert term_condition.content == "some updated content"
      assert term_condition.native_content == "some updated native_content"
      assert term_condition.type == 43
      assert term_condition.type_id == 43
    end

    test "update_term_condition/2 with invalid data returns error changeset" do
      term_condition = term_condition_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Conditions.update_term_condition(term_condition, @invalid_attrs)

      assert term_condition == Conditions.get_term_condition!(term_condition.id)
    end

    test "delete_term_condition/1 deletes the term_condition" do
      term_condition = term_condition_fixture()
      assert {:ok, %TermCondition{}} = Conditions.delete_term_condition(term_condition)

      assert_raise Ecto.NoResultsError, fn ->
        Conditions.get_term_condition!(term_condition.id)
      end
    end

    test "change_term_condition/1 returns a term_condition changeset" do
      term_condition = term_condition_fixture()
      assert %Ecto.Changeset{} = Conditions.change_term_condition(term_condition)
    end
  end

  describe "refund_policies" do
    alias Eshop.Conditions.RefundPolicy

    @valid_attrs %{
      content: "some content",
      native_content: "some native_content",
      type: 42,
      type_id: 42
    }
    @update_attrs %{
      content: "some updated content",
      native_content: "some updated native_content",
      type: 43,
      type_id: 43
    }
    @invalid_attrs %{content: nil, native_content: nil, type: nil, type_id: nil}

    def refund_policy_fixture(attrs \\ %{}) do
      {:ok, refund_policy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Conditions.create_refund_policy()

      refund_policy
    end

    test "list_refund_policies/0 returns all refund_policies" do
      refund_policy = refund_policy_fixture()
      assert Conditions.list_refund_policies() == [refund_policy]
    end

    test "get_refund_policy!/1 returns the refund_policy with given id" do
      refund_policy = refund_policy_fixture()
      assert Conditions.get_refund_policy!(refund_policy.id) == refund_policy
    end

    test "create_refund_policy/1 with valid data creates a refund_policy" do
      assert {:ok, %RefundPolicy{} = refund_policy} =
               Conditions.create_refund_policy(@valid_attrs)

      assert refund_policy.content == "some content"
      assert refund_policy.native_content == "some native_content"
      assert refund_policy.type == 42
      assert refund_policy.type_id == 42
    end

    test "create_refund_policy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conditions.create_refund_policy(@invalid_attrs)
    end

    test "update_refund_policy/2 with valid data updates the refund_policy" do
      refund_policy = refund_policy_fixture()

      assert {:ok, %RefundPolicy{} = refund_policy} =
               Conditions.update_refund_policy(refund_policy, @update_attrs)

      assert refund_policy.content == "some updated content"
      assert refund_policy.native_content == "some updated native_content"
      assert refund_policy.type == 43
      assert refund_policy.type_id == 43
    end

    test "update_refund_policy/2 with invalid data returns error changeset" do
      refund_policy = refund_policy_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Conditions.update_refund_policy(refund_policy, @invalid_attrs)

      assert refund_policy == Conditions.get_refund_policy!(refund_policy.id)
    end

    test "delete_refund_policy/1 deletes the refund_policy" do
      refund_policy = refund_policy_fixture()
      assert {:ok, %RefundPolicy{}} = Conditions.delete_refund_policy(refund_policy)
      assert_raise Ecto.NoResultsError, fn -> Conditions.get_refund_policy!(refund_policy.id) end
    end

    test "change_refund_policy/1 returns a refund_policy changeset" do
      refund_policy = refund_policy_fixture()
      assert %Ecto.Changeset{} = Conditions.change_refund_policy(refund_policy)
    end
  end

  describe "privacy_policies" do
    alias Eshop.Conditions.PrivacyPolicy

    @valid_attrs %{content: "some content", native_content: "some native_content"}
    @update_attrs %{
      content: "some updated content",
      native_content: "some updated native_content"
    }
    @invalid_attrs %{content: nil, native_content: nil}

    def privacy_policy_fixture(attrs \\ %{}) do
      {:ok, privacy_policy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Conditions.create_privacy_policy()

      privacy_policy
    end

    test "list_privacy_policies/0 returns all privacy_policies" do
      privacy_policy = privacy_policy_fixture()
      assert Conditions.list_privacy_policies() == [privacy_policy]
    end

    test "get_privacy_policy!/1 returns the privacy_policy with given id" do
      privacy_policy = privacy_policy_fixture()
      assert Conditions.get_privacy_policy!(privacy_policy.id) == privacy_policy
    end

    test "create_privacy_policy/1 with valid data creates a privacy_policy" do
      assert {:ok, %PrivacyPolicy{} = privacy_policy} =
               Conditions.create_privacy_policy(@valid_attrs)

      assert privacy_policy.content == "some content"
      assert privacy_policy.native_content == "some native_content"
    end

    test "create_privacy_policy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conditions.create_privacy_policy(@invalid_attrs)
    end

    test "update_privacy_policy/2 with valid data updates the privacy_policy" do
      privacy_policy = privacy_policy_fixture()

      assert {:ok, %PrivacyPolicy{} = privacy_policy} =
               Conditions.update_privacy_policy(privacy_policy, @update_attrs)

      assert privacy_policy.content == "some updated content"
      assert privacy_policy.native_content == "some updated native_content"
    end

    test "update_privacy_policy/2 with invalid data returns error changeset" do
      privacy_policy = privacy_policy_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Conditions.update_privacy_policy(privacy_policy, @invalid_attrs)

      assert privacy_policy == Conditions.get_privacy_policy!(privacy_policy.id)
    end

    test "delete_privacy_policy/1 deletes the privacy_policy" do
      privacy_policy = privacy_policy_fixture()
      assert {:ok, %PrivacyPolicy{}} = Conditions.delete_privacy_policy(privacy_policy)

      assert_raise Ecto.NoResultsError, fn ->
        Conditions.get_privacy_policy!(privacy_policy.id)
      end
    end

    test "change_privacy_policy/1 returns a privacy_policy changeset" do
      privacy_policy = privacy_policy_fixture()
      assert %Ecto.Changeset{} = Conditions.change_privacy_policy(privacy_policy)
    end
  end

  describe "guarantees" do
    alias Eshop.Conditions.Guarantee

    @valid_attrs %{
      content: "some content",
      duration: 42,
      gurantee_type: 42,
      native_content: "some native_content"
    }
    @update_attrs %{
      content: "some updated content",
      duration: 43,
      gurantee_type: 43,
      native_content: "some updated native_content"
    }
    @invalid_attrs %{content: nil, duration: nil, gurantee_type: nil, native_content: nil}

    def guarantee_fixture(attrs \\ %{}) do
      {:ok, guarantee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Conditions.create_guarantee()

      guarantee
    end

    test "list_guarantees/0 returns all guarantees" do
      guarantee = guarantee_fixture()
      assert Conditions.list_guarantees() == [guarantee]
    end

    test "get_guarantee!/1 returns the guarantee with given id" do
      guarantee = guarantee_fixture()
      assert Conditions.get_guarantee!(guarantee.id) == guarantee
    end

    test "create_guarantee/1 with valid data creates a guarantee" do
      assert {:ok, %Guarantee{} = guarantee} = Conditions.create_guarantee(@valid_attrs)
      assert guarantee.content == "some content"
      assert guarantee.duration == 42
      assert guarantee.gurantee_type == 42
      assert guarantee.native_content == "some native_content"
    end

    test "create_guarantee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conditions.create_guarantee(@invalid_attrs)
    end

    test "update_guarantee/2 with valid data updates the guarantee" do
      guarantee = guarantee_fixture()

      assert {:ok, %Guarantee{} = guarantee} =
               Conditions.update_guarantee(guarantee, @update_attrs)

      assert guarantee.content == "some updated content"
      assert guarantee.duration == 43
      assert guarantee.gurantee_type == 43
      assert guarantee.native_content == "some updated native_content"
    end

    test "update_guarantee/2 with invalid data returns error changeset" do
      guarantee = guarantee_fixture()
      assert {:error, %Ecto.Changeset{}} = Conditions.update_guarantee(guarantee, @invalid_attrs)
      assert guarantee == Conditions.get_guarantee!(guarantee.id)
    end

    test "delete_guarantee/1 deletes the guarantee" do
      guarantee = guarantee_fixture()
      assert {:ok, %Guarantee{}} = Conditions.delete_guarantee(guarantee)
      assert_raise Ecto.NoResultsError, fn -> Conditions.get_guarantee!(guarantee.id) end
    end

    test "change_guarantee/1 returns a guarantee changeset" do
      guarantee = guarantee_fixture()
      assert %Ecto.Changeset{} = Conditions.change_guarantee(guarantee)
    end
  end
end
