defmodule Eshop.Settings do
  @moduledoc """
  The Settings context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Settings.Setting

  @doc """
  Returns the list of settings.

  ## Examples

      iex> list_settings()
      [%Setting{}, ...]

  """
  def list_settings do
    Repo.all(Setting)
  end

  @doc """
  Gets a single setting.

  Raises `Ecto.NoResultsError` if the Setting does not exist.

  ## Examples

      iex> get_setting!(123)
      %Setting{}

      iex> get_setting!(456)
      ** (Ecto.NoResultsError)

  """
  def get_setting!(id), do: Repo.get!(Setting, id)

  @doc """
  Creates a setting.

  ## Examples

      iex> create_setting(%{field: value})
      {:ok, %Setting{}}

      iex> create_setting(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_setting(attrs \\ %{}) do
    %Setting{}
    |> Setting.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a setting.

  ## Examples

      iex> update_setting(setting, %{field: new_value})
      {:ok, %Setting{}}

      iex> update_setting(setting, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_setting(%Setting{} = setting, attrs) do
    setting
    |> Setting.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a setting.

  ## Examples

      iex> delete_setting(setting)
      {:ok, %Setting{}}

      iex> delete_setting(setting)
      {:error, %Ecto.Changeset{}}

  """
  def delete_setting(%Setting{} = setting) do
    Repo.delete(setting)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking setting changes.

  ## Examples

      iex> change_setting(setting)
      %Ecto.Changeset{data: %Setting{}}

  """
  def change_setting(%Setting{} = setting, attrs \\ %{}) do
    Setting.changeset(setting, attrs)
  end

  alias Eshop.Settings.UserSetting

  @doc """
  Returns the list of user_settings.

  ## Examples

      iex> list_user_settings()
      [%UserSetting{}, ...]

  """
  def list_user_settings do
    Repo.all(UserSetting)
  end

  @doc """
  Gets a single user_setting.

  Raises `Ecto.NoResultsError` if the User setting does not exist.

  ## Examples

      iex> get_user_setting!(123)
      %UserSetting{}

      iex> get_user_setting!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_setting!(id), do: Repo.get!(UserSetting, id)

  @doc """
  Creates a user_setting.

  ## Examples

      iex> create_user_setting(%{field: value})
      {:ok, %UserSetting{}}

      iex> create_user_setting(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_setting(attrs \\ %{}) do
    %UserSetting{}
    |> UserSetting.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_setting.

  ## Examples

      iex> update_user_setting(user_setting, %{field: new_value})
      {:ok, %UserSetting{}}

      iex> update_user_setting(user_setting, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_setting(%UserSetting{} = user_setting, attrs) do
    user_setting
    |> UserSetting.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_setting.

  ## Examples

      iex> delete_user_setting(user_setting)
      {:ok, %UserSetting{}}

      iex> delete_user_setting(user_setting)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_setting(%UserSetting{} = user_setting) do
    Repo.delete(user_setting)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_setting changes.

  ## Examples

      iex> change_user_setting(user_setting)
      %Ecto.Changeset{data: %UserSetting{}}

  """
  def change_user_setting(%UserSetting{} = user_setting, attrs \\ %{}) do
    UserSetting.changeset(user_setting, attrs)
  end

  alias Eshop.Settings.CompanySetting

  @doc """
  Returns the list of company_settings.

  ## Examples

      iex> list_company_settings()
      [%CompanySetting{}, ...]

  """
  def list_company_settings do
    Repo.all(CompanySetting)
  end

  @doc """
  Gets a single company_setting.

  Raises `Ecto.NoResultsError` if the Company setting does not exist.

  ## Examples

      iex> get_company_setting!(123)
      %CompanySetting{}

      iex> get_company_setting!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company_setting!(id), do: Repo.get!(CompanySetting, id)

  @doc """
  Creates a company_setting.

  ## Examples

      iex> create_company_setting(%{field: value})
      {:ok, %CompanySetting{}}

      iex> create_company_setting(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company_setting(attrs \\ %{}) do
    %CompanySetting{}
    |> CompanySetting.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a company_setting.

  ## Examples

      iex> update_company_setting(company_setting, %{field: new_value})
      {:ok, %CompanySetting{}}

      iex> update_company_setting(company_setting, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company_setting(%CompanySetting{} = company_setting, attrs) do
    company_setting
    |> CompanySetting.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a company_setting.

  ## Examples

      iex> delete_company_setting(company_setting)
      {:ok, %CompanySetting{}}

      iex> delete_company_setting(company_setting)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company_setting(%CompanySetting{} = company_setting) do
    Repo.delete(company_setting)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company_setting changes.

  ## Examples

      iex> change_company_setting(company_setting)
      %Ecto.Changeset{data: %CompanySetting{}}

  """
  def change_company_setting(%CompanySetting{} = company_setting, attrs \\ %{}) do
    CompanySetting.changeset(company_setting, attrs)
  end
end
