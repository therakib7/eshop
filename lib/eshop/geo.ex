defmodule Eshop.Geo do
  @moduledoc """
  The Geo context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Geo.CountryStage

  @doc """
  Returns the list of country_stages.

  ## Examples

      iex> list_country_stages()
      [%CountryStage{}, ...]

  """
  def list_country_stages do
    Repo.all(CountryStage)
  end

  @doc """
  Gets a single country_stage.

  Raises `Ecto.NoResultsError` if the Country stage does not exist.

  ## Examples

      iex> get_country_stage!(123)
      %CountryStage{}

      iex> get_country_stage!(456)
      ** (Ecto.NoResultsError)

  """
  def get_country_stage!(id), do: Repo.get!(CountryStage, id)

  @doc """
  Creates a country_stage.

  ## Examples

      iex> create_country_stage(%{field: value})
      {:ok, %CountryStage{}}

      iex> create_country_stage(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_country_stage(attrs \\ %{}) do
    %CountryStage{}
    |> CountryStage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a country_stage.

  ## Examples

      iex> update_country_stage(country_stage, %{field: new_value})
      {:ok, %CountryStage{}}

      iex> update_country_stage(country_stage, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_country_stage(%CountryStage{} = country_stage, attrs) do
    country_stage
    |> CountryStage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a country_stage.

  ## Examples

      iex> delete_country_stage(country_stage)
      {:ok, %CountryStage{}}

      iex> delete_country_stage(country_stage)
      {:error, %Ecto.Changeset{}}

  """
  def delete_country_stage(%CountryStage{} = country_stage) do
    Repo.delete(country_stage)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking country_stage changes.

  ## Examples

      iex> change_country_stage(country_stage)
      %Ecto.Changeset{data: %CountryStage{}}

  """
  def change_country_stage(%CountryStage{} = country_stage, attrs \\ %{}) do
    CountryStage.changeset(country_stage, attrs)
  end

  alias Eshop.Geo.Location

  @doc """
  Returns the list of locations.

  ## Examples

      iex> list_locations()
      [%Location{}, ...]

  """
  def list_locations do
    Repo.all(Location)
  end

  @doc """
  Gets a single location.

  Raises `Ecto.NoResultsError` if the Location does not exist.

  ## Examples

      iex> get_location!(123)
      %Location{}

      iex> get_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_location!(id), do: Repo.get!(Location, id)

  @doc """
  Creates a location.

  ## Examples

      iex> create_location(%{field: value})
      {:ok, %Location{}}

      iex> create_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location(attrs \\ %{}) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a location.

  ## Examples

      iex> update_location(location, %{field: new_value})
      {:ok, %Location{}}

      iex> update_location(location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a location.

  ## Examples

      iex> delete_location(location)
      {:ok, %Location{}}

      iex> delete_location(location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking location changes.

  ## Examples

      iex> change_location(location)
      %Ecto.Changeset{data: %Location{}}

  """
  def change_location(%Location{} = location, attrs \\ %{}) do
    Location.changeset(location, attrs)
  end
end
