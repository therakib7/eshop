defmodule Eshop.Shipments do
  @moduledoc """
  The Shipments context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Shipments.ShippingMethod

  @doc """
  Returns the list of shipping_methods.

  ## Examples

      iex> list_shipping_methods()
      [%ShippingMethod{}, ...]

  """
  def list_shipping_methods do
    Repo.all(ShippingMethod)
  end

  @doc """
  Gets a single shipping_method.

  Raises `Ecto.NoResultsError` if the Shipping method does not exist.

  ## Examples

      iex> get_shipping_method!(123)
      %ShippingMethod{}

      iex> get_shipping_method!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shipping_method!(id), do: Repo.get!(ShippingMethod, id)

  @doc """
  Creates a shipping_method.

  ## Examples

      iex> create_shipping_method(%{field: value})
      {:ok, %ShippingMethod{}}

      iex> create_shipping_method(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shipping_method(attrs \\ %{}) do
    %ShippingMethod{}
    |> ShippingMethod.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shipping_method.

  ## Examples

      iex> update_shipping_method(shipping_method, %{field: new_value})
      {:ok, %ShippingMethod{}}

      iex> update_shipping_method(shipping_method, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shipping_method(%ShippingMethod{} = shipping_method, attrs) do
    shipping_method
    |> ShippingMethod.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shipping_method.

  ## Examples

      iex> delete_shipping_method(shipping_method)
      {:ok, %ShippingMethod{}}

      iex> delete_shipping_method(shipping_method)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shipping_method(%ShippingMethod{} = shipping_method) do
    Repo.delete(shipping_method)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shipping_method changes.

  ## Examples

      iex> change_shipping_method(shipping_method)
      %Ecto.Changeset{data: %ShippingMethod{}}

  """
  def change_shipping_method(%ShippingMethod{} = shipping_method, attrs \\ %{}) do
    ShippingMethod.changeset(shipping_method, attrs)
  end

  alias Eshop.Shipments.ShopShippingMethod

  @doc """
  Returns the list of shop_shipping_methods.

  ## Examples

      iex> list_shop_shipping_methods()
      [%ShopShippingMethod{}, ...]

  """
  def list_shop_shipping_methods do
    Repo.all(ShopShippingMethod)
  end

  @doc """
  Gets a single shop_shipping_method.

  Raises `Ecto.NoResultsError` if the Shop shipping method does not exist.

  ## Examples

      iex> get_shop_shipping_method!(123)
      %ShopShippingMethod{}

      iex> get_shop_shipping_method!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shop_shipping_method!(id), do: Repo.get!(ShopShippingMethod, id)

  @doc """
  Creates a shop_shipping_method.

  ## Examples

      iex> create_shop_shipping_method(%{field: value})
      {:ok, %ShopShippingMethod{}}

      iex> create_shop_shipping_method(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shop_shipping_method(attrs \\ %{}) do
    %ShopShippingMethod{}
    |> ShopShippingMethod.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shop_shipping_method.

  ## Examples

      iex> update_shop_shipping_method(shop_shipping_method, %{field: new_value})
      {:ok, %ShopShippingMethod{}}

      iex> update_shop_shipping_method(shop_shipping_method, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shop_shipping_method(%ShopShippingMethod{} = shop_shipping_method, attrs) do
    shop_shipping_method
    |> ShopShippingMethod.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shop_shipping_method.

  ## Examples

      iex> delete_shop_shipping_method(shop_shipping_method)
      {:ok, %ShopShippingMethod{}}

      iex> delete_shop_shipping_method(shop_shipping_method)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shop_shipping_method(%ShopShippingMethod{} = shop_shipping_method) do
    Repo.delete(shop_shipping_method)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shop_shipping_method changes.

  ## Examples

      iex> change_shop_shipping_method(shop_shipping_method)
      %Ecto.Changeset{data: %ShopShippingMethod{}}

  """
  def change_shop_shipping_method(%ShopShippingMethod{} = shop_shipping_method, attrs \\ %{}) do
    ShopShippingMethod.changeset(shop_shipping_method, attrs)
  end

  alias Eshop.Shipments.ShippingAddress

  @doc """
  Returns the list of shipping_addresses.

  ## Examples

      iex> list_shipping_addresses()
      [%ShippingAddress{}, ...]

  """
  def list_shipping_addresses do
    Repo.all(ShippingAddress)
  end

  @doc """
  Gets a single shipping_address.

  Raises `Ecto.NoResultsError` if the Shipping address does not exist.

  ## Examples

      iex> get_shipping_address!(123)
      %ShippingAddress{}

      iex> get_shipping_address!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shipping_address!(id), do: Repo.get!(ShippingAddress, id)

  @doc """
  Creates a shipping_address.

  ## Examples

      iex> create_shipping_address(%{field: value})
      {:ok, %ShippingAddress{}}

      iex> create_shipping_address(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shipping_address(attrs \\ %{}) do
    %ShippingAddress{}
    |> ShippingAddress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shipping_address.

  ## Examples

      iex> update_shipping_address(shipping_address, %{field: new_value})
      {:ok, %ShippingAddress{}}

      iex> update_shipping_address(shipping_address, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shipping_address(%ShippingAddress{} = shipping_address, attrs) do
    shipping_address
    |> ShippingAddress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shipping_address.

  ## Examples

      iex> delete_shipping_address(shipping_address)
      {:ok, %ShippingAddress{}}

      iex> delete_shipping_address(shipping_address)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shipping_address(%ShippingAddress{} = shipping_address) do
    Repo.delete(shipping_address)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shipping_address changes.

  ## Examples

      iex> change_shipping_address(shipping_address)
      %Ecto.Changeset{data: %ShippingAddress{}}

  """
  def change_shipping_address(%ShippingAddress{} = shipping_address, attrs \\ %{}) do
    ShippingAddress.changeset(shipping_address, attrs)
  end

  alias Eshop.Shipments.TrackingInvoice

  @doc """
  Returns the list of tracking_invoices.

  ## Examples

      iex> list_tracking_invoices()
      [%TrackingInvoice{}, ...]

  """
  def list_tracking_invoices do
    Repo.all(TrackingInvoice)
  end

  @doc """
  Gets a single tracking_invoice.

  Raises `Ecto.NoResultsError` if the Tracking invoice does not exist.

  ## Examples

      iex> get_tracking_invoice!(123)
      %TrackingInvoice{}

      iex> get_tracking_invoice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tracking_invoice!(id), do: Repo.get!(TrackingInvoice, id)

  @doc """
  Creates a tracking_invoice.

  ## Examples

      iex> create_tracking_invoice(%{field: value})
      {:ok, %TrackingInvoice{}}

      iex> create_tracking_invoice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tracking_invoice(attrs \\ %{}) do
    %TrackingInvoice{}
    |> TrackingInvoice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tracking_invoice.

  ## Examples

      iex> update_tracking_invoice(tracking_invoice, %{field: new_value})
      {:ok, %TrackingInvoice{}}

      iex> update_tracking_invoice(tracking_invoice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tracking_invoice(%TrackingInvoice{} = tracking_invoice, attrs) do
    tracking_invoice
    |> TrackingInvoice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tracking_invoice.

  ## Examples

      iex> delete_tracking_invoice(tracking_invoice)
      {:ok, %TrackingInvoice{}}

      iex> delete_tracking_invoice(tracking_invoice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tracking_invoice(%TrackingInvoice{} = tracking_invoice) do
    Repo.delete(tracking_invoice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tracking_invoice changes.

  ## Examples

      iex> change_tracking_invoice(tracking_invoice)
      %Ecto.Changeset{data: %TrackingInvoice{}}

  """
  def change_tracking_invoice(%TrackingInvoice{} = tracking_invoice, attrs \\ %{}) do
    TrackingInvoice.changeset(tracking_invoice, attrs)
  end
end
