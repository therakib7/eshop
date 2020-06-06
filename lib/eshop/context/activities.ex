defmodule Eshop.Activities do
  @moduledoc """
  The Activities context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Activities.UserLove

  @doc """
  Returns the list of user_loves.

  ## Examples

      iex> list_user_loves()
      [%UserLove{}, ...]

  """
  def list_user_loves do
    Repo.all(UserLove)
  end

  @doc """
  Gets a single user_love.

  Raises `Ecto.NoResultsError` if the User love does not exist.

  ## Examples

      iex> get_user_love!(123)
      %UserLove{}

      iex> get_user_love!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_love!(id), do: Repo.get!(UserLove, id)

  @doc """
  Creates a user_love.

  ## Examples

      iex> create_user_love(%{field: value})
      {:ok, %UserLove{}}

      iex> create_user_love(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_love(attrs \\ %{}) do
    %UserLove{}
    |> UserLove.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_love.

  ## Examples

      iex> update_user_love(user_love, %{field: new_value})
      {:ok, %UserLove{}}

      iex> update_user_love(user_love, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_love(%UserLove{} = user_love, attrs) do
    user_love
    |> UserLove.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_love.

  ## Examples

      iex> delete_user_love(user_love)
      {:ok, %UserLove{}}

      iex> delete_user_love(user_love)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_love(%UserLove{} = user_love) do
    Repo.delete(user_love)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_love changes.

  ## Examples

      iex> change_user_love(user_love)
      %Ecto.Changeset{data: %UserLove{}}

  """
  def change_user_love(%UserLove{} = user_love, attrs \\ %{}) do
    UserLove.changeset(user_love, attrs)
  end

  alias Eshop.Activities.Rating

  @doc """
  Returns the list of ratings.

  ## Examples

      iex> list_ratings()
      [%Rating{}, ...]

  """
  def list_ratings do
    Repo.all(Rating)
  end

  @doc """
  Gets a single rating.

  Raises `Ecto.NoResultsError` if the Rating does not exist.

  ## Examples

      iex> get_rating!(123)
      %Rating{}

      iex> get_rating!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rating!(id), do: Repo.get!(Rating, id)

  @doc """
  Creates a rating.

  ## Examples

      iex> create_rating(%{field: value})
      {:ok, %Rating{}}

      iex> create_rating(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rating(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rating.

  ## Examples

      iex> update_rating(rating, %{field: new_value})
      {:ok, %Rating{}}

      iex> update_rating(rating, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rating(%Rating{} = rating, attrs) do
    rating
    |> Rating.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rating.

  ## Examples

      iex> delete_rating(rating)
      {:ok, %Rating{}}

      iex> delete_rating(rating)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rating(%Rating{} = rating) do
    Repo.delete(rating)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rating changes.

  ## Examples

      iex> change_rating(rating)
      %Ecto.Changeset{data: %Rating{}}

  """
  def change_rating(%Rating{} = rating, attrs \\ %{}) do
    Rating.changeset(rating, attrs)
  end

  alias Eshop.Activities.TypeComment

  @doc """
  Returns the list of type_comments.

  ## Examples

      iex> list_type_comments()
      [%TypeComment{}, ...]

  """
  def list_type_comments do
    Repo.all(TypeComment)
  end

  @doc """
  Gets a single type_comment.

  Raises `Ecto.NoResultsError` if the Type comment does not exist.

  ## Examples

      iex> get_type_comment!(123)
      %TypeComment{}

      iex> get_type_comment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type_comment!(id), do: Repo.get!(TypeComment, id)

  @doc """
  Creates a type_comment.

  ## Examples

      iex> create_type_comment(%{field: value})
      {:ok, %TypeComment{}}

      iex> create_type_comment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_type_comment(attrs \\ %{}) do
    %TypeComment{}
    |> TypeComment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a type_comment.

  ## Examples

      iex> update_type_comment(type_comment, %{field: new_value})
      {:ok, %TypeComment{}}

      iex> update_type_comment(type_comment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_type_comment(%TypeComment{} = type_comment, attrs) do
    type_comment
    |> TypeComment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a type_comment.

  ## Examples

      iex> delete_type_comment(type_comment)
      {:ok, %TypeComment{}}

      iex> delete_type_comment(type_comment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_type_comment(%TypeComment{} = type_comment) do
    Repo.delete(type_comment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking type_comment changes.

  ## Examples

      iex> change_type_comment(type_comment)
      %Ecto.Changeset{data: %TypeComment{}}

  """
  def change_type_comment(%TypeComment{} = type_comment, attrs \\ %{}) do
    TypeComment.changeset(type_comment, attrs)
  end
end
