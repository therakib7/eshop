defmodule Eshop.Payments do
  @moduledoc """
  The Payments context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Payments.BankingProvider

  @doc """
  Returns the list of banking_providers.

  ## Examples

      iex> list_banking_providers()
      [%BankingProvider{}, ...]

  """
  def list_banking_providers do
    Repo.all(BankingProvider)
  end

  @doc """
  Gets a single banking_provider.

  Raises `Ecto.NoResultsError` if the Banking provider does not exist.

  ## Examples

      iex> get_banking_provider!(123)
      %BankingProvider{}

      iex> get_banking_provider!(456)
      ** (Ecto.NoResultsError)

  """
  def get_banking_provider!(id), do: Repo.get!(BankingProvider, id)

  @doc """
  Creates a banking_provider.

  ## Examples

      iex> create_banking_provider(%{field: value})
      {:ok, %BankingProvider{}}

      iex> create_banking_provider(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_banking_provider(attrs \\ %{}) do
    %BankingProvider{}
    |> BankingProvider.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a banking_provider.

  ## Examples

      iex> update_banking_provider(banking_provider, %{field: new_value})
      {:ok, %BankingProvider{}}

      iex> update_banking_provider(banking_provider, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_banking_provider(%BankingProvider{} = banking_provider, attrs) do
    banking_provider
    |> BankingProvider.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a banking_provider.

  ## Examples

      iex> delete_banking_provider(banking_provider)
      {:ok, %BankingProvider{}}

      iex> delete_banking_provider(banking_provider)
      {:error, %Ecto.Changeset{}}

  """
  def delete_banking_provider(%BankingProvider{} = banking_provider) do
    Repo.delete(banking_provider)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking banking_provider changes.

  ## Examples

      iex> change_banking_provider(banking_provider)
      %Ecto.Changeset{data: %BankingProvider{}}

  """
  def change_banking_provider(%BankingProvider{} = banking_provider, attrs \\ %{}) do
    BankingProvider.changeset(banking_provider, attrs)
  end

  alias Eshop.Payments.ShopPaymentMethod

  @doc """
  Returns the list of shop_payment_methods.

  ## Examples

      iex> list_shop_payment_methods()
      [%ShopPaymentMethod{}, ...]

  """
  def list_shop_payment_methods do
    Repo.all(ShopPaymentMethod)
  end

  @doc """
  Gets a single shop_payment_method.

  Raises `Ecto.NoResultsError` if the Shop payment method does not exist.

  ## Examples

      iex> get_shop_payment_method!(123)
      %ShopPaymentMethod{}

      iex> get_shop_payment_method!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shop_payment_method!(id), do: Repo.get!(ShopPaymentMethod, id)

  @doc """
  Creates a shop_payment_method.

  ## Examples

      iex> create_shop_payment_method(%{field: value})
      {:ok, %ShopPaymentMethod{}}

      iex> create_shop_payment_method(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shop_payment_method(attrs \\ %{}) do
    %ShopPaymentMethod{}
    |> ShopPaymentMethod.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shop_payment_method.

  ## Examples

      iex> update_shop_payment_method(shop_payment_method, %{field: new_value})
      {:ok, %ShopPaymentMethod{}}

      iex> update_shop_payment_method(shop_payment_method, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shop_payment_method(%ShopPaymentMethod{} = shop_payment_method, attrs) do
    shop_payment_method
    |> ShopPaymentMethod.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shop_payment_method.

  ## Examples

      iex> delete_shop_payment_method(shop_payment_method)
      {:ok, %ShopPaymentMethod{}}

      iex> delete_shop_payment_method(shop_payment_method)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shop_payment_method(%ShopPaymentMethod{} = shop_payment_method) do
    Repo.delete(shop_payment_method)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shop_payment_method changes.

  ## Examples

      iex> change_shop_payment_method(shop_payment_method)
      %Ecto.Changeset{data: %ShopPaymentMethod{}}

  """
  def change_shop_payment_method(%ShopPaymentMethod{} = shop_payment_method, attrs \\ %{}) do
    ShopPaymentMethod.changeset(shop_payment_method, attrs)
  end
end
