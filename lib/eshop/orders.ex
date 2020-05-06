defmodule Eshop.Orders do
  @moduledoc """
  The Orders context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Orders.Invoice

  @doc """
  Returns the list of invoices.

  ## Examples

      iex> list_invoices()
      [%Invoice{}, ...]

  """
  def list_invoices do
    Repo.all(Invoice)
  end

  @doc """
  Gets a single invoice.

  Raises `Ecto.NoResultsError` if the Invoice does not exist.

  ## Examples

      iex> get_invoice!(123)
      %Invoice{}

      iex> get_invoice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_invoice!(id), do: Repo.get!(Invoice, id)

  @doc """
  Creates a invoice.

  ## Examples

      iex> create_invoice(%{field: value})
      {:ok, %Invoice{}}

      iex> create_invoice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_invoice(attrs \\ %{}) do
    %Invoice{}
    |> Invoice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a invoice.

  ## Examples

      iex> update_invoice(invoice, %{field: new_value})
      {:ok, %Invoice{}}

      iex> update_invoice(invoice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_invoice(%Invoice{} = invoice, attrs) do
    invoice
    |> Invoice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a invoice.

  ## Examples

      iex> delete_invoice(invoice)
      {:ok, %Invoice{}}

      iex> delete_invoice(invoice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_invoice(%Invoice{} = invoice) do
    Repo.delete(invoice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking invoice changes.

  ## Examples

      iex> change_invoice(invoice)
      %Ecto.Changeset{data: %Invoice{}}

  """
  def change_invoice(%Invoice{} = invoice, attrs \\ %{}) do
    Invoice.changeset(invoice, attrs)
  end

  alias Eshop.Orders.InvoiceItem

  @doc """
  Returns the list of invoice_items.

  ## Examples

      iex> list_invoice_items()
      [%InvoiceItem{}, ...]

  """
  def list_invoice_items do
    Repo.all(InvoiceItem)
  end

  @doc """
  Gets a single invoice_item.

  Raises `Ecto.NoResultsError` if the Invoice item does not exist.

  ## Examples

      iex> get_invoice_item!(123)
      %InvoiceItem{}

      iex> get_invoice_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_invoice_item!(id), do: Repo.get!(InvoiceItem, id)

  @doc """
  Creates a invoice_item.

  ## Examples

      iex> create_invoice_item(%{field: value})
      {:ok, %InvoiceItem{}}

      iex> create_invoice_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_invoice_item(attrs \\ %{}) do
    %InvoiceItem{}
    |> InvoiceItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a invoice_item.

  ## Examples

      iex> update_invoice_item(invoice_item, %{field: new_value})
      {:ok, %InvoiceItem{}}

      iex> update_invoice_item(invoice_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_invoice_item(%InvoiceItem{} = invoice_item, attrs) do
    invoice_item
    |> InvoiceItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a invoice_item.

  ## Examples

      iex> delete_invoice_item(invoice_item)
      {:ok, %InvoiceItem{}}

      iex> delete_invoice_item(invoice_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_invoice_item(%InvoiceItem{} = invoice_item) do
    Repo.delete(invoice_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking invoice_item changes.

  ## Examples

      iex> change_invoice_item(invoice_item)
      %Ecto.Changeset{data: %InvoiceItem{}}

  """
  def change_invoice_item(%InvoiceItem{} = invoice_item, attrs \\ %{}) do
    InvoiceItem.changeset(invoice_item, attrs)
  end

  alias Eshop.Orders.InvoiceItemVariant

  @doc """
  Returns the list of invoice_item_variants.

  ## Examples

      iex> list_invoice_item_variants()
      [%InvoiceItemVariant{}, ...]

  """
  def list_invoice_item_variants do
    Repo.all(InvoiceItemVariant)
  end

  @doc """
  Gets a single invoice_item_variant.

  Raises `Ecto.NoResultsError` if the Invoice item variant does not exist.

  ## Examples

      iex> get_invoice_item_variant!(123)
      %InvoiceItemVariant{}

      iex> get_invoice_item_variant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_invoice_item_variant!(id), do: Repo.get!(InvoiceItemVariant, id)

  @doc """
  Creates a invoice_item_variant.

  ## Examples

      iex> create_invoice_item_variant(%{field: value})
      {:ok, %InvoiceItemVariant{}}

      iex> create_invoice_item_variant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_invoice_item_variant(attrs \\ %{}) do
    %InvoiceItemVariant{}
    |> InvoiceItemVariant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a invoice_item_variant.

  ## Examples

      iex> update_invoice_item_variant(invoice_item_variant, %{field: new_value})
      {:ok, %InvoiceItemVariant{}}

      iex> update_invoice_item_variant(invoice_item_variant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_invoice_item_variant(%InvoiceItemVariant{} = invoice_item_variant, attrs) do
    invoice_item_variant
    |> InvoiceItemVariant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a invoice_item_variant.

  ## Examples

      iex> delete_invoice_item_variant(invoice_item_variant)
      {:ok, %InvoiceItemVariant{}}

      iex> delete_invoice_item_variant(invoice_item_variant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_invoice_item_variant(%InvoiceItemVariant{} = invoice_item_variant) do
    Repo.delete(invoice_item_variant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking invoice_item_variant changes.

  ## Examples

      iex> change_invoice_item_variant(invoice_item_variant)
      %Ecto.Changeset{data: %InvoiceItemVariant{}}

  """
  def change_invoice_item_variant(%InvoiceItemVariant{} = invoice_item_variant, attrs \\ %{}) do
    InvoiceItemVariant.changeset(invoice_item_variant, attrs)
  end
end
