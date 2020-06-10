defmodule Eshop.Companies do
  @moduledoc """
  The Companies context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Companies.Company

  @doc """
  Returns the list of companies.

  ## Examples

      iex> list_companies()
      [%Company{}, ...]

  """
  def list_companies do
    Repo.all(Company)
  end

  @doc """
  Gets a single company.

  Raises `Ecto.NoResultsError` if the Company does not exist.

  ## Examples

      iex> get_company!(123)
      %Company{}

      iex> get_company!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company!(id), do: Repo.get!(Company, id)

  @doc """
  Creates a company.

  ## Examples

      iex> create_company(%{field: value})
      {:ok, %Company{}}

      iex> create_company(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company(attrs \\ %{}) do
    {:ok, company} =
      %Company{}
      |> Company.changeset(attrs)
      |> Repo.insert()

    role_id =
      Eshop.Repo.one(from u in Eshop.Users.Role, where: u.slug == "com_admin", select: u.id)

    # 1 = super, 2 = company, 3 = shop, 4 = warehouse
    create_type_user_role(%{
      type: 2,
      type_id: company.id,
      user_id: company.user_id,
      role_id: role_id
    })

    {:ok, company}
    # {:error, message: "Unknown user", code: 21}
  end

  @doc """
  Updates a company.

  ## Examples

      iex> update_company(company, %{field: new_value})
      {:ok, %Company{}}

      iex> update_company(company, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company(%Company{} = company, attrs) do
    company
    |> Company.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a company.

  ## Examples

      iex> delete_company(company)
      {:ok, %Company{}}

      iex> delete_company(company)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company(%Company{} = company) do
    Repo.delete(company)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company changes.

  ## Examples

      iex> change_company(company)
      %Ecto.Changeset{data: %Company{}}

  """
  def change_company(%Company{} = company, attrs \\ %{}) do
    Company.changeset(company, attrs)
  end

  alias Eshop.Companies.Shop

  @doc """
  Returns the list of shops.

  ## Examples

      iex> list_shops()
      [%Shop{}, ...]

  """
  def list_shops do
    Repo.all(Shop)
  end

  @doc """
  Gets a single shop.

  Raises `Ecto.NoResultsError` if the Shop does not exist.

  ## Examples

      iex> get_shop!(123)
      %Shop{}

      iex> get_shop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shop!(id), do: Repo.get!(Shop, id)

  @doc """
  Creates a shop.

  ## Examples

      iex> create_shop(%{field: value})
      {:ok, %Shop{}}

      iex> create_shop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

  def create_shop(attrs \\ %{}) do
    {:ok, shop} =
      %Shop{}
      |> Shop.changeset(attrs)
      |> Repo.insert()

    role_id =
      Eshop.Repo.one(from u in Eshop.Users.Role, where: u.slug == "shop_admin", select: u.id)

    create_type_user_role(%{
      # 3 = shop
      type: 3,
      type_id: shop.id,
      user_id: shop.user_id,
      role_id: role_id
    })

    {:ok, shop}
  end

  @doc """
  Updates a shop.

  ## Examples

      iex> update_shop(shop, %{field: new_value})
      {:ok, %Shop{}}

      iex> update_shop(shop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shop(%Shop{} = shop, attrs) do
    shop
    |> Shop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shop.

  ## Examples

      iex> delete_shop(shop)
      {:ok, %Shop{}}

      iex> delete_shop(shop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shop(%Shop{} = shop) do
    Repo.delete(shop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shop changes.

  ## Examples

      iex> change_shop(shop)
      %Ecto.Changeset{data: %Shop{}}

  """
  def change_shop(%Shop{} = shop, attrs \\ %{}) do
    Shop.changeset(shop, attrs)
  end

  alias Eshop.Companies.TypeUserRole

  @doc """
  Returns the list of type_user_roles.

  ## Examples

      iex> list_type_user_roles()
      [%TypeUserRole{}, ...]

  """
  def list_type_user_roles do
    Repo.all(TypeUserRole)
  end

  @doc """
  Gets a single type_user_role.

  Raises `Ecto.NoResultsError` if the Type user role does not exist.

  ## Examples

      iex> get_type_user_role!(123)
      %TypeUserRole{}

      iex> get_type_user_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type_user_role!(id), do: Repo.get!(TypeUserRole, id)

  @doc """
  Creates a type_user_role.

  ## Examples

      iex> create_type_user_role(%{field: value})
      {:ok, %TypeUserRole{}}

      iex> create_type_user_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_type_user_role(attrs \\ %{}) do
    %TypeUserRole{}
    |> TypeUserRole.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a type_user_role.

  ## Examples

      iex> update_type_user_role(type_user_role, %{field: new_value})
      {:ok, %TypeUserRole{}}

      iex> update_type_user_role(type_user_role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_type_user_role(%TypeUserRole{} = type_user_role, attrs) do
    type_user_role
    |> TypeUserRole.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a type_user_role.

  ## Examples

      iex> delete_type_user_role(type_user_role)
      {:ok, %TypeUserRole{}}

      iex> delete_type_user_role(type_user_role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_type_user_role(%TypeUserRole{} = type_user_role) do
    Repo.delete(type_user_role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking type_user_role changes.

  ## Examples

      iex> change_type_user_role(type_user_role)
      %Ecto.Changeset{data: %TypeUserRole{}}

  """
  def change_type_user_role(%TypeUserRole{} = type_user_role, attrs \\ %{}) do
    TypeUserRole.changeset(type_user_role, attrs)
  end

  alias Eshop.Companies.Warehouse

  @doc """
  Returns the list of warehouses.

  ## Examples

      iex> list_warehouses()
      [%Warehouse{}, ...]

  """
  def list_warehouses do
    Repo.all(Warehouse)
  end

  @doc """
  Gets a single warehouse.

  Raises `Ecto.NoResultsError` if the Warehouse does not exist.

  ## Examples

      iex> get_warehouse!(123)
      %Warehouse{}

      iex> get_warehouse!(456)
      ** (Ecto.NoResultsError)

  """
  def get_warehouse!(id), do: Repo.get!(Warehouse, id)

  @doc """
  Creates a warehouse.

  ## Examples

      iex> create_warehouse(%{field: value})
      {:ok, %Warehouse{}}

      iex> create_warehouse(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_warehouse(attrs \\ %{}) do
    %Warehouse{}
    |> Warehouse.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a warehouse.

  ## Examples

      iex> update_warehouse(warehouse, %{field: new_value})
      {:ok, %Warehouse{}}

      iex> update_warehouse(warehouse, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_warehouse(%Warehouse{} = warehouse, attrs) do
    warehouse
    |> Warehouse.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a warehouse.

  ## Examples

      iex> delete_warehouse(warehouse)
      {:ok, %Warehouse{}}

      iex> delete_warehouse(warehouse)
      {:error, %Ecto.Changeset{}}

  """
  def delete_warehouse(%Warehouse{} = warehouse) do
    Repo.delete(warehouse)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking warehouse changes.

  ## Examples

      iex> change_warehouse(warehouse)
      %Ecto.Changeset{data: %Warehouse{}}

  """
  def change_warehouse(%Warehouse{} = warehouse, attrs \\ %{}) do
    Warehouse.changeset(warehouse, attrs)
  end

  alias Eshop.Companies.WarehouseVariant

  @doc """
  Returns the list of warehouse_variants.

  ## Examples

      iex> list_warehouse_variants()
      [%WarehouseVariant{}, ...]

  """
  def list_warehouse_variants do
    Repo.all(WarehouseVariant)
  end

  @doc """
  Gets a single warehouse_variant.

  Raises `Ecto.NoResultsError` if the Warehouse variant does not exist.

  ## Examples

      iex> get_warehouse_variant!(123)
      %WarehouseVariant{}

      iex> get_warehouse_variant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_warehouse_variant!(id), do: Repo.get!(WarehouseVariant, id)

  @doc """
  Creates a warehouse_variant.

  ## Examples

      iex> create_warehouse_variant(%{field: value})
      {:ok, %WarehouseVariant{}}

      iex> create_warehouse_variant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_warehouse_variant(attrs \\ %{}) do
    %WarehouseVariant{}
    |> WarehouseVariant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a warehouse_variant.

  ## Examples

      iex> update_warehouse_variant(warehouse_variant, %{field: new_value})
      {:ok, %WarehouseVariant{}}

      iex> update_warehouse_variant(warehouse_variant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_warehouse_variant(%WarehouseVariant{} = warehouse_variant, attrs) do
    warehouse_variant
    |> WarehouseVariant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a warehouse_variant.

  ## Examples

      iex> delete_warehouse_variant(warehouse_variant)
      {:ok, %WarehouseVariant{}}

      iex> delete_warehouse_variant(warehouse_variant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_warehouse_variant(%WarehouseVariant{} = warehouse_variant) do
    Repo.delete(warehouse_variant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking warehouse_variant changes.

  ## Examples

      iex> change_warehouse_variant(warehouse_variant)
      %Ecto.Changeset{data: %WarehouseVariant{}}

  """
  def change_warehouse_variant(%WarehouseVariant{} = warehouse_variant, attrs \\ %{}) do
    WarehouseVariant.changeset(warehouse_variant, attrs)
  end

  alias Eshop.Companies.WarehouseVariantValue

  @doc """
  Returns the list of warehouse_variant_values.

  ## Examples

      iex> list_warehouse_variant_values()
      [%WarehouseVariantValue{}, ...]

  """
  def list_warehouse_variant_values do
    Repo.all(WarehouseVariantValue)
  end

  @doc """
  Gets a single warehouse_variant_value.

  Raises `Ecto.NoResultsError` if the Warehouse variant value does not exist.

  ## Examples

      iex> get_warehouse_variant_value!(123)
      %WarehouseVariantValue{}

      iex> get_warehouse_variant_value!(456)
      ** (Ecto.NoResultsError)

  """
  def get_warehouse_variant_value!(id), do: Repo.get!(WarehouseVariantValue, id)

  @doc """
  Creates a warehouse_variant_value.

  ## Examples

      iex> create_warehouse_variant_value(%{field: value})
      {:ok, %WarehouseVariantValue{}}

      iex> create_warehouse_variant_value(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_warehouse_variant_value(attrs \\ %{}) do
    %WarehouseVariantValue{}
    |> WarehouseVariantValue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a warehouse_variant_value.

  ## Examples

      iex> update_warehouse_variant_value(warehouse_variant_value, %{field: new_value})
      {:ok, %WarehouseVariantValue{}}

      iex> update_warehouse_variant_value(warehouse_variant_value, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_warehouse_variant_value(%WarehouseVariantValue{} = warehouse_variant_value, attrs) do
    warehouse_variant_value
    |> WarehouseVariantValue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a warehouse_variant_value.

  ## Examples

      iex> delete_warehouse_variant_value(warehouse_variant_value)
      {:ok, %WarehouseVariantValue{}}

      iex> delete_warehouse_variant_value(warehouse_variant_value)
      {:error, %Ecto.Changeset{}}

  """
  def delete_warehouse_variant_value(%WarehouseVariantValue{} = warehouse_variant_value) do
    Repo.delete(warehouse_variant_value)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking warehouse_variant_value changes.

  ## Examples

      iex> change_warehouse_variant_value(warehouse_variant_value)
      %Ecto.Changeset{data: %WarehouseVariantValue{}}

  """
  def change_warehouse_variant_value(
        %WarehouseVariantValue{} = warehouse_variant_value,
        attrs \\ %{}
      ) do
    WarehouseVariantValue.changeset(warehouse_variant_value, attrs)
  end
end
