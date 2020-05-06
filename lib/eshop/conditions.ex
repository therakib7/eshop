defmodule Eshop.Conditions do
  @moduledoc """
  The Conditions context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Conditions.TermCondition

  @doc """
  Returns the list of term_conditions.

  ## Examples

      iex> list_term_conditions()
      [%TermCondition{}, ...]

  """
  def list_term_conditions do
    Repo.all(TermCondition)
  end

  @doc """
  Gets a single term_condition.

  Raises `Ecto.NoResultsError` if the Term condition does not exist.

  ## Examples

      iex> get_term_condition!(123)
      %TermCondition{}

      iex> get_term_condition!(456)
      ** (Ecto.NoResultsError)

  """
  def get_term_condition!(id), do: Repo.get!(TermCondition, id)

  @doc """
  Creates a term_condition.

  ## Examples

      iex> create_term_condition(%{field: value})
      {:ok, %TermCondition{}}

      iex> create_term_condition(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_term_condition(attrs \\ %{}) do
    %TermCondition{}
    |> TermCondition.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a term_condition.

  ## Examples

      iex> update_term_condition(term_condition, %{field: new_value})
      {:ok, %TermCondition{}}

      iex> update_term_condition(term_condition, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_term_condition(%TermCondition{} = term_condition, attrs) do
    term_condition
    |> TermCondition.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a term_condition.

  ## Examples

      iex> delete_term_condition(term_condition)
      {:ok, %TermCondition{}}

      iex> delete_term_condition(term_condition)
      {:error, %Ecto.Changeset{}}

  """
  def delete_term_condition(%TermCondition{} = term_condition) do
    Repo.delete(term_condition)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking term_condition changes.

  ## Examples

      iex> change_term_condition(term_condition)
      %Ecto.Changeset{data: %TermCondition{}}

  """
  def change_term_condition(%TermCondition{} = term_condition, attrs \\ %{}) do
    TermCondition.changeset(term_condition, attrs)
  end

  alias Eshop.Conditions.RefundPolicy

  @doc """
  Returns the list of refund_policies.

  ## Examples

      iex> list_refund_policies()
      [%RefundPolicy{}, ...]

  """
  def list_refund_policies do
    Repo.all(RefundPolicy)
  end

  @doc """
  Gets a single refund_policy.

  Raises `Ecto.NoResultsError` if the Refund policy does not exist.

  ## Examples

      iex> get_refund_policy!(123)
      %RefundPolicy{}

      iex> get_refund_policy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_refund_policy!(id), do: Repo.get!(RefundPolicy, id)

  @doc """
  Creates a refund_policy.

  ## Examples

      iex> create_refund_policy(%{field: value})
      {:ok, %RefundPolicy{}}

      iex> create_refund_policy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_refund_policy(attrs \\ %{}) do
    %RefundPolicy{}
    |> RefundPolicy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a refund_policy.

  ## Examples

      iex> update_refund_policy(refund_policy, %{field: new_value})
      {:ok, %RefundPolicy{}}

      iex> update_refund_policy(refund_policy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_refund_policy(%RefundPolicy{} = refund_policy, attrs) do
    refund_policy
    |> RefundPolicy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a refund_policy.

  ## Examples

      iex> delete_refund_policy(refund_policy)
      {:ok, %RefundPolicy{}}

      iex> delete_refund_policy(refund_policy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_refund_policy(%RefundPolicy{} = refund_policy) do
    Repo.delete(refund_policy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking refund_policy changes.

  ## Examples

      iex> change_refund_policy(refund_policy)
      %Ecto.Changeset{data: %RefundPolicy{}}

  """
  def change_refund_policy(%RefundPolicy{} = refund_policy, attrs \\ %{}) do
    RefundPolicy.changeset(refund_policy, attrs)
  end

  alias Eshop.Conditions.PrivacyPolicy

  @doc """
  Returns the list of privacy_policies.

  ## Examples

      iex> list_privacy_policies()
      [%PrivacyPolicy{}, ...]

  """
  def list_privacy_policies do
    Repo.all(PrivacyPolicy)
  end

  @doc """
  Gets a single privacy_policy.

  Raises `Ecto.NoResultsError` if the Privacy policy does not exist.

  ## Examples

      iex> get_privacy_policy!(123)
      %PrivacyPolicy{}

      iex> get_privacy_policy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_privacy_policy!(id), do: Repo.get!(PrivacyPolicy, id)

  @doc """
  Creates a privacy_policy.

  ## Examples

      iex> create_privacy_policy(%{field: value})
      {:ok, %PrivacyPolicy{}}

      iex> create_privacy_policy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_privacy_policy(attrs \\ %{}) do
    %PrivacyPolicy{}
    |> PrivacyPolicy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a privacy_policy.

  ## Examples

      iex> update_privacy_policy(privacy_policy, %{field: new_value})
      {:ok, %PrivacyPolicy{}}

      iex> update_privacy_policy(privacy_policy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_privacy_policy(%PrivacyPolicy{} = privacy_policy, attrs) do
    privacy_policy
    |> PrivacyPolicy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a privacy_policy.

  ## Examples

      iex> delete_privacy_policy(privacy_policy)
      {:ok, %PrivacyPolicy{}}

      iex> delete_privacy_policy(privacy_policy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_privacy_policy(%PrivacyPolicy{} = privacy_policy) do
    Repo.delete(privacy_policy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking privacy_policy changes.

  ## Examples

      iex> change_privacy_policy(privacy_policy)
      %Ecto.Changeset{data: %PrivacyPolicy{}}

  """
  def change_privacy_policy(%PrivacyPolicy{} = privacy_policy, attrs \\ %{}) do
    PrivacyPolicy.changeset(privacy_policy, attrs)
  end

  alias Eshop.Conditions.Guarantee

  @doc """
  Returns the list of guarantees.

  ## Examples

      iex> list_guarantees()
      [%Guarantee{}, ...]

  """
  def list_guarantees do
    Repo.all(Guarantee)
  end

  @doc """
  Gets a single guarantee.

  Raises `Ecto.NoResultsError` if the Guarantee does not exist.

  ## Examples

      iex> get_guarantee!(123)
      %Guarantee{}

      iex> get_guarantee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_guarantee!(id), do: Repo.get!(Guarantee, id)

  @doc """
  Creates a guarantee.

  ## Examples

      iex> create_guarantee(%{field: value})
      {:ok, %Guarantee{}}

      iex> create_guarantee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_guarantee(attrs \\ %{}) do
    %Guarantee{}
    |> Guarantee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a guarantee.

  ## Examples

      iex> update_guarantee(guarantee, %{field: new_value})
      {:ok, %Guarantee{}}

      iex> update_guarantee(guarantee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_guarantee(%Guarantee{} = guarantee, attrs) do
    guarantee
    |> Guarantee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a guarantee.

  ## Examples

      iex> delete_guarantee(guarantee)
      {:ok, %Guarantee{}}

      iex> delete_guarantee(guarantee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_guarantee(%Guarantee{} = guarantee) do
    Repo.delete(guarantee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking guarantee changes.

  ## Examples

      iex> change_guarantee(guarantee)
      %Ecto.Changeset{data: %Guarantee{}}

  """
  def change_guarantee(%Guarantee{} = guarantee, attrs \\ %{}) do
    Guarantee.changeset(guarantee, attrs)
  end
end
