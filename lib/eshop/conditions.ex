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
end
