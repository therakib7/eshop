defmodule Eshop.Components do
  @moduledoc """
  The Components context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Components.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories(args) do
    query = from(p in Category)
    filter_with(query, args.filter)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias Eshop.Components.Brand

  @doc """
  Returns the list of brands.

  ## Examples

      iex> list_brands()
      [%Brand{}, ...]

  """
  def list_brands(args) do
    query = from(p in Brand)
    filter_with(query, args.filter)
  end

  defp filter_with(query, filter) do
    Enum.reduce(filter, query, fn
      {:id, id}, query ->
        from q in query, where: q.id == ^id

      {:name, name}, query ->
        from q in query, where: ilike(q.name, ^"%#{name}%")

      {:inserted_before, date}, query ->
        from q in query, where: q.inserted_at <= ^date

      {:inserted_after, date}, query ->
        from q in query, where: q.inserted_at >= ^date
    end)
  end

  @doc """
  Gets a single brand.

  Raises `Ecto.NoResultsError` if the Brand does not exist.

  ## Examples

      iex> get_brand!(123)
      %Brand{}

      iex> get_brand!(456)
      ** (Ecto.NoResultsError)

  """
  def get_brand!(id), do: Repo.get!(Brand, id)

  @doc """
  Creates a brand.

  ## Examples

      iex> create_brand(%{field: value})
      {:ok, %Brand{}}

      iex> create_brand(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_brand(attrs \\ %{}) do
    # %Brand{}
    # |> Brand.changeset(attrs)
    # |> Repo.insert()
    {:ok, brand} =
      %Brand{}
      |> Brand.changeset(attrs)
      # |> Ecto.Changeset.put_assoc(:type_categories, [{type_id, 3, type_id: 1, category_id: 1}])
      |> Repo.insert()

    Enum.each(attrs.category_ids, fn x ->
      create_type_category(%{
        # 2 = brand
        type: 2,
        type_id: brand.id,
        category_id: x[:category_id]
      })
    end)

    {:ok, brand}
  end

  @doc """
  Updates a brand.

  ## Examples

      iex> update_brand(brand, %{field: new_value})
      {:ok, %Brand{}}

      iex> update_brand(brand, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_brand(%Brand{} = brand, attrs) do
    brand
    |> Brand.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a brand.

  ## Examples

      iex> delete_brand(brand)
      {:ok, %Brand{}}

      iex> delete_brand(brand)
      {:error, %Ecto.Changeset{}}

  """
  def delete_brand(%Brand{} = brand) do
    Repo.delete(brand)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking brand changes.

  ## Examples

      iex> change_brand(brand)
      %Ecto.Changeset{data: %Brand{}}

  """
  def change_brand(%Brand{} = brand, attrs \\ %{}) do
    Brand.changeset(brand, attrs)
  end

  alias Eshop.Components.UnitType

  @doc """
  Returns the list of unit_types.

  ## Examples

      iex> list_unit_types()
      [%UnitType{}, ...]

  """
  def list_unit_types do
    Repo.all(UnitType)
  end

  @doc """
  Gets a single unit_type.

  Raises `Ecto.NoResultsError` if the Unit type does not exist.

  ## Examples

      iex> get_unit_type!(123)
      %UnitType{}

      iex> get_unit_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_unit_type!(id), do: Repo.get!(UnitType, id)

  @doc """
  Creates a unit_type.

  ## Examples

      iex> create_unit_type(%{field: value})
      {:ok, %UnitType{}}

      iex> create_unit_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_unit_type(attrs \\ %{}) do
    %UnitType{}
    |> UnitType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a unit_type.

  ## Examples

      iex> update_unit_type(unit_type, %{field: new_value})
      {:ok, %UnitType{}}

      iex> update_unit_type(unit_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_unit_type(%UnitType{} = unit_type, attrs) do
    unit_type
    |> UnitType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a unit_type.

  ## Examples

      iex> delete_unit_type(unit_type)
      {:ok, %UnitType{}}

      iex> delete_unit_type(unit_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_unit_type(%UnitType{} = unit_type) do
    Repo.delete(unit_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking unit_type changes.

  ## Examples

      iex> change_unit_type(unit_type)
      %Ecto.Changeset{data: %UnitType{}}

  """
  def change_unit_type(%UnitType{} = unit_type, attrs \\ %{}) do
    UnitType.changeset(unit_type, attrs)
  end

  alias Eshop.Components.TypeCategory

  @doc """
  Returns the list of type_categories.

  ## Examples

      iex> list_type_categories()
      [%TypeCategory{}, ...]

  """
  def list_type_categories do
    Repo.all(TypeCategory)
  end

  @doc """
  Gets a single type_category.

  Raises `Ecto.NoResultsError` if the Type category does not exist.

  ## Examples

      iex> get_type_category!(123)
      %TypeCategory{}

      iex> get_type_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type_category!(id), do: Repo.get!(TypeCategory, id)

  @doc """
  Creates a type_category.

  ## Examples

      iex> create_type_category(%{field: value})
      {:ok, %TypeCategory{}}

      iex> create_type_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_type_category(attrs \\ %{}) do
    %TypeCategory{}
    |> TypeCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a type_category.

  ## Examples

      iex> update_type_category(type_category, %{field: new_value})
      {:ok, %TypeCategory{}}

      iex> update_type_category(type_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_type_category(%TypeCategory{} = type_category, attrs) do
    type_category
    |> TypeCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a type_category.

  ## Examples

      iex> delete_type_category(type_category)
      {:ok, %TypeCategory{}}

      iex> delete_type_category(type_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_type_category(%TypeCategory{} = type_category) do
    Repo.delete(type_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking type_category changes.

  ## Examples

      iex> change_type_category(type_category)
      %Ecto.Changeset{data: %TypeCategory{}}

  """
  def change_type_category(%TypeCategory{} = type_category, attrs \\ %{}) do
    TypeCategory.changeset(type_category, attrs)
  end

  alias Eshop.Components.Variant

  @doc """
  Returns the list of variants.

  ## Examples

      iex> list_variants()
      [%Variant{}, ...]

  """
  def list_variants do
    Repo.all(Variant)
  end

  @doc """
  Gets a single variant.

  Raises `Ecto.NoResultsError` if the Variant does not exist.

  ## Examples

      iex> get_variant!(123)
      %Variant{}

      iex> get_variant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_variant!(id), do: Repo.get!(Variant, id)

  @doc """
  Creates a variant.

  ## Examples

      iex> create_variant(%{field: value})
      {:ok, %Variant{}}

      iex> create_variant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_variant(attrs \\ %{}) do
    # %Variant{}
    # |> Variant.changeset(attrs)
    # |> Repo.insert()

    {:ok, variant} =
      %Variant{}
      |> Variant.changeset(attrs)
      # |> Ecto.Changeset.put_assoc(:type_categories, [{type_id, 3, type_id: 1, category_id: 1}])
      |> Repo.insert()

    Enum.each(attrs.category_ids, fn x ->
      create_type_category(%{
        # 3 = variant
        type: 3,
        type_id: variant.id,
        category_id: x[:category_id]
      })
    end)

    {:ok, variant}
  end

  @doc """
  Updates a variant.

  ## Examples

      iex> update_variant(variant, %{field: new_value})
      {:ok, %Variant{}}

      iex> update_variant(variant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_variant(%Variant{} = variant, attrs) do
    variant
    |> Variant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a variant.

  ## Examples

      iex> delete_variant(variant)
      {:ok, %Variant{}}

      iex> delete_variant(variant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_variant(%Variant{} = variant) do
    Repo.delete(variant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking variant changes.

  ## Examples

      iex> change_variant(variant)
      %Ecto.Changeset{data: %Variant{}}

  """
  def change_variant(%Variant{} = variant, attrs \\ %{}) do
    Variant.changeset(variant, attrs)
  end

  alias Eshop.Components.VariantValue

  @doc """
  Returns the list of variant_values.

  ## Examples

      iex> list_variant_values()
      [%VariantValue{}, ...]

  """
  def list_variant_values do
    Repo.all(VariantValue)
  end

  @doc """
  Gets a single variant_value.

  Raises `Ecto.NoResultsError` if the Variant value does not exist.

  ## Examples

      iex> get_variant_value!(123)
      %VariantValue{}

      iex> get_variant_value!(456)
      ** (Ecto.NoResultsError)

  """
  def get_variant_value!(id), do: Repo.get!(VariantValue, id)

  @doc """
  Creates a variant_value.

  ## Examples

      iex> create_variant_value(%{field: value})
      {:ok, %VariantValue{}}

      iex> create_variant_value(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_variant_value(attrs \\ %{}) do
    %VariantValue{}
    |> VariantValue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a variant_value.

  ## Examples

      iex> update_variant_value(variant_value, %{field: new_value})
      {:ok, %VariantValue{}}

      iex> update_variant_value(variant_value, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_variant_value(%VariantValue{} = variant_value, attrs) do
    variant_value
    |> VariantValue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a variant_value.

  ## Examples

      iex> delete_variant_value(variant_value)
      {:ok, %VariantValue{}}

      iex> delete_variant_value(variant_value)
      {:error, %Ecto.Changeset{}}

  """
  def delete_variant_value(%VariantValue{} = variant_value) do
    Repo.delete(variant_value)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking variant_value changes.

  ## Examples

      iex> change_variant_value(variant_value)
      %Ecto.Changeset{data: %VariantValue{}}

  """
  def change_variant_value(%VariantValue{} = variant_value, attrs \\ %{}) do
    VariantValue.changeset(variant_value, attrs)
  end

  alias Eshop.Components.ItemCategory

  @doc """
  Returns the list of item_categories.

  ## Examples

      iex> list_item_categories()
      [%ItemCategory{}, ...]

  """
  def list_item_categories do
    Repo.all(ItemCategory)
  end

  @doc """
  Gets a single item_category.

  Raises `Ecto.NoResultsError` if the Item category does not exist.

  ## Examples

      iex> get_item_category!(123)
      %ItemCategory{}

      iex> get_item_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item_category!(id), do: Repo.get!(ItemCategory, id)

  @doc """
  Creates a item_category.

  ## Examples

      iex> create_item_category(%{field: value})
      {:ok, %ItemCategory{}}

      iex> create_item_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item_category(attrs \\ %{}) do
    %ItemCategory{}
    |> ItemCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item_category.

  ## Examples

      iex> update_item_category(item_category, %{field: new_value})
      {:ok, %ItemCategory{}}

      iex> update_item_category(item_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item_category(%ItemCategory{} = item_category, attrs) do
    item_category
    |> ItemCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item_category.

  ## Examples

      iex> delete_item_category(item_category)
      {:ok, %ItemCategory{}}

      iex> delete_item_category(item_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item_category(%ItemCategory{} = item_category) do
    Repo.delete(item_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item_category changes.

  ## Examples

      iex> change_item_category(item_category)
      %Ecto.Changeset{data: %ItemCategory{}}

  """
  def change_item_category(%ItemCategory{} = item_category, attrs \\ %{}) do
    ItemCategory.changeset(item_category, attrs)
  end

  alias Eshop.Components.Package

  @doc """
  Returns the list of packages.

  ## Examples

      iex> list_packages()
      [%Package{}, ...]

  """
  def list_packages do
    Repo.all(Package)
  end

  @doc """
  Gets a single package.

  Raises `Ecto.NoResultsError` if the Package does not exist.

  ## Examples

      iex> get_package!(123)
      %Package{}

      iex> get_package!(456)
      ** (Ecto.NoResultsError)

  """
  def get_package!(id), do: Repo.get!(Package, id)

  @doc """
  Creates a package.

  ## Examples

      iex> create_package(%{field: value})
      {:ok, %Package{}}

      iex> create_package(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_package(attrs \\ %{}) do
    %Package{}
    |> Package.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a package.

  ## Examples

      iex> update_package(package, %{field: new_value})
      {:ok, %Package{}}

      iex> update_package(package, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_package(%Package{} = package, attrs) do
    package
    |> Package.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a package.

  ## Examples

      iex> delete_package(package)
      {:ok, %Package{}}

      iex> delete_package(package)
      {:error, %Ecto.Changeset{}}

  """
  def delete_package(%Package{} = package) do
    Repo.delete(package)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking package changes.

  ## Examples

      iex> change_package(package)
      %Ecto.Changeset{data: %Package{}}

  """
  def change_package(%Package{} = package, attrs \\ %{}) do
    Package.changeset(package, attrs)
  end

  alias Eshop.Components.PackageItem

  @doc """
  Returns the list of package_items.

  ## Examples

      iex> list_package_items()
      [%PackageItem{}, ...]

  """
  def list_package_items do
    Repo.all(PackageItem)
  end

  @doc """
  Gets a single package_item.

  Raises `Ecto.NoResultsError` if the Package item does not exist.

  ## Examples

      iex> get_package_item!(123)
      %PackageItem{}

      iex> get_package_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_package_item!(id), do: Repo.get!(PackageItem, id)

  @doc """
  Creates a package_item.

  ## Examples

      iex> create_package_item(%{field: value})
      {:ok, %PackageItem{}}

      iex> create_package_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_package_item(attrs \\ %{}) do
    %PackageItem{}
    |> PackageItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a package_item.

  ## Examples

      iex> update_package_item(package_item, %{field: new_value})
      {:ok, %PackageItem{}}

      iex> update_package_item(package_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_package_item(%PackageItem{} = package_item, attrs) do
    package_item
    |> PackageItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a package_item.

  ## Examples

      iex> delete_package_item(package_item)
      {:ok, %PackageItem{}}

      iex> delete_package_item(package_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_package_item(%PackageItem{} = package_item) do
    Repo.delete(package_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking package_item changes.

  ## Examples

      iex> change_package_item(package_item)
      %Ecto.Changeset{data: %PackageItem{}}

  """
  def change_package_item(%PackageItem{} = package_item, attrs \\ %{}) do
    PackageItem.changeset(package_item, attrs)
  end

  alias Eshop.Components.ItemVariant

  @doc """
  Returns the list of item_variants.

  ## Examples

      iex> list_item_variants()
      [%ItemVariant{}, ...]

  """
  def list_item_variants do
    Repo.all(ItemVariant)
  end

  @doc """
  Gets a single item_variant.

  Raises `Ecto.NoResultsError` if the Item variant does not exist.

  ## Examples

      iex> get_item_variant!(123)
      %ItemVariant{}

      iex> get_item_variant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item_variant!(id), do: Repo.get!(ItemVariant, id)

  @doc """
  Creates a item_variant.

  ## Examples

      iex> create_item_variant(%{field: value})
      {:ok, %ItemVariant{}}

      iex> create_item_variant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item_variant(attrs \\ %{}) do
    %ItemVariant{}
    |> ItemVariant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item_variant.

  ## Examples

      iex> update_item_variant(item_variant, %{field: new_value})
      {:ok, %ItemVariant{}}

      iex> update_item_variant(item_variant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item_variant(%ItemVariant{} = item_variant, attrs) do
    item_variant
    |> ItemVariant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item_variant.

  ## Examples

      iex> delete_item_variant(item_variant)
      {:ok, %ItemVariant{}}

      iex> delete_item_variant(item_variant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item_variant(%ItemVariant{} = item_variant) do
    Repo.delete(item_variant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item_variant changes.

  ## Examples

      iex> change_item_variant(item_variant)
      %Ecto.Changeset{data: %ItemVariant{}}

  """
  def change_item_variant(%ItemVariant{} = item_variant, attrs \\ %{}) do
    ItemVariant.changeset(item_variant, attrs)
  end

  alias Eshop.Components.ItemWarehouseVariant

  @doc """
  Returns the list of item_warehouse_variants.

  ## Examples

      iex> list_item_warehouse_variants()
      [%ItemWarehouseVariant{}, ...]

  """
  def list_item_warehouse_variants do
    Repo.all(ItemWarehouseVariant)
  end

  @doc """
  Gets a single item_warehouse_variant.

  Raises `Ecto.NoResultsError` if the Item warehouse variant does not exist.

  ## Examples

      iex> get_item_warehouse_variant!(123)
      %ItemWarehouseVariant{}

      iex> get_item_warehouse_variant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item_warehouse_variant!(id), do: Repo.get!(ItemWarehouseVariant, id)

  @doc """
  Creates a item_warehouse_variant.

  ## Examples

      iex> create_item_warehouse_variant(%{field: value})
      {:ok, %ItemWarehouseVariant{}}

      iex> create_item_warehouse_variant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item_warehouse_variant(attrs \\ %{}) do
    %ItemWarehouseVariant{}
    |> ItemWarehouseVariant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item_warehouse_variant.

  ## Examples

      iex> update_item_warehouse_variant(item_warehouse_variant, %{field: new_value})
      {:ok, %ItemWarehouseVariant{}}

      iex> update_item_warehouse_variant(item_warehouse_variant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item_warehouse_variant(%ItemWarehouseVariant{} = item_warehouse_variant, attrs) do
    item_warehouse_variant
    |> ItemWarehouseVariant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item_warehouse_variant.

  ## Examples

      iex> delete_item_warehouse_variant(item_warehouse_variant)
      {:ok, %ItemWarehouseVariant{}}

      iex> delete_item_warehouse_variant(item_warehouse_variant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item_warehouse_variant(%ItemWarehouseVariant{} = item_warehouse_variant) do
    Repo.delete(item_warehouse_variant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item_warehouse_variant changes.

  ## Examples

      iex> change_item_warehouse_variant(item_warehouse_variant)
      %Ecto.Changeset{data: %ItemWarehouseVariant{}}

  """
  def change_item_warehouse_variant(
        %ItemWarehouseVariant{} = item_warehouse_variant,
        attrs \\ %{}
      ) do
    ItemWarehouseVariant.changeset(item_warehouse_variant, attrs)
  end

  alias Eshop.Components.Faq

  @doc """
  Returns the list of faqs.

  ## Examples

      iex> list_faqs()
      [%Faq{}, ...]

  """
  def list_faqs do
    Repo.all(Faq)
  end

  @doc """
  Gets a single faq.

  Raises `Ecto.NoResultsError` if the Faq does not exist.

  ## Examples

      iex> get_faq!(123)
      %Faq{}

      iex> get_faq!(456)
      ** (Ecto.NoResultsError)

  """
  def get_faq!(id), do: Repo.get!(Faq, id)

  @doc """
  Creates a faq.

  ## Examples

      iex> create_faq(%{field: value})
      {:ok, %Faq{}}

      iex> create_faq(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_faq(attrs \\ %{}) do
    %Faq{}
    |> Faq.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a faq.

  ## Examples

      iex> update_faq(faq, %{field: new_value})
      {:ok, %Faq{}}

      iex> update_faq(faq, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_faq(%Faq{} = faq, attrs) do
    faq
    |> Faq.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a faq.

  ## Examples

      iex> delete_faq(faq)
      {:ok, %Faq{}}

      iex> delete_faq(faq)
      {:error, %Ecto.Changeset{}}

  """
  def delete_faq(%Faq{} = faq) do
    Repo.delete(faq)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking faq changes.

  ## Examples

      iex> change_faq(faq)
      %Ecto.Changeset{data: %Faq{}}

  """
  def change_faq(%Faq{} = faq, attrs \\ %{}) do
    Faq.changeset(faq, attrs)
  end

  alias Eshop.Components.DiscountCode

  @doc """
  Returns the list of discount_codes.

  ## Examples

      iex> list_discount_codes()
      [%DiscountCode{}, ...]

  """
  def list_discount_codes do
    Repo.all(DiscountCode)
  end

  @doc """
  Gets a single discount_code.

  Raises `Ecto.NoResultsError` if the Discount code does not exist.

  ## Examples

      iex> get_discount_code!(123)
      %DiscountCode{}

      iex> get_discount_code!(456)
      ** (Ecto.NoResultsError)

  """
  def get_discount_code!(id), do: Repo.get!(DiscountCode, id)

  @doc """
  Creates a discount_code.

  ## Examples

      iex> create_discount_code(%{field: value})
      {:ok, %DiscountCode{}}

      iex> create_discount_code(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_discount_code(attrs \\ %{}) do
    %DiscountCode{}
    |> DiscountCode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a discount_code.

  ## Examples

      iex> update_discount_code(discount_code, %{field: new_value})
      {:ok, %DiscountCode{}}

      iex> update_discount_code(discount_code, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_discount_code(%DiscountCode{} = discount_code, attrs) do
    discount_code
    |> DiscountCode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a discount_code.

  ## Examples

      iex> delete_discount_code(discount_code)
      {:ok, %DiscountCode{}}

      iex> delete_discount_code(discount_code)
      {:error, %Ecto.Changeset{}}

  """
  def delete_discount_code(%DiscountCode{} = discount_code) do
    Repo.delete(discount_code)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking discount_code changes.

  ## Examples

      iex> change_discount_code(discount_code)
      %Ecto.Changeset{data: %DiscountCode{}}

  """
  def change_discount_code(%DiscountCode{} = discount_code, attrs \\ %{}) do
    DiscountCode.changeset(discount_code, attrs)
  end

  alias Eshop.Components.TypeStatus

  @doc """
  Returns the list of type_statuses.

  ## Examples

      iex> list_type_statuses()
      [%TypeStatus{}, ...]

  """
  def list_type_statuses do
    Repo.all(TypeStatus)
  end

  @doc """
  Gets a single type_status.

  Raises `Ecto.NoResultsError` if the Type status does not exist.

  ## Examples

      iex> get_type_status!(123)
      %TypeStatus{}

      iex> get_type_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type_status!(id), do: Repo.get!(TypeStatus, id)

  @doc """
  Creates a type_status.

  ## Examples

      iex> create_type_status(%{field: value})
      {:ok, %TypeStatus{}}

      iex> create_type_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_type_status(attrs \\ %{}) do
    %TypeStatus{}
    |> TypeStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a type_status.

  ## Examples

      iex> update_type_status(type_status, %{field: new_value})
      {:ok, %TypeStatus{}}

      iex> update_type_status(type_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_type_status(%TypeStatus{} = type_status, attrs) do
    type_status
    |> TypeStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a type_status.

  ## Examples

      iex> delete_type_status(type_status)
      {:ok, %TypeStatus{}}

      iex> delete_type_status(type_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_type_status(%TypeStatus{} = type_status) do
    Repo.delete(type_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking type_status changes.

  ## Examples

      iex> change_type_status(type_status)
      %Ecto.Changeset{data: %TypeStatus{}}

  """
  def change_type_status(%TypeStatus{} = type_status, attrs \\ %{}) do
    TypeStatus.changeset(type_status, attrs)
  end

  alias Eshop.Components.InvoiceStatus

  @doc """
  Returns the list of invoice_statuses.

  ## Examples

      iex> list_invoice_statuses()
      [%InvoiceStatus{}, ...]

  """
  def list_invoice_statuses do
    Repo.all(InvoiceStatus)
  end

  @doc """
  Gets a single invoice_status.

  Raises `Ecto.NoResultsError` if the Invoice status does not exist.

  ## Examples

      iex> get_invoice_status!(123)
      %InvoiceStatus{}

      iex> get_invoice_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_invoice_status!(id), do: Repo.get!(InvoiceStatus, id)

  @doc """
  Creates a invoice_status.

  ## Examples

      iex> create_invoice_status(%{field: value})
      {:ok, %InvoiceStatus{}}

      iex> create_invoice_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_invoice_status(attrs \\ %{}) do
    %InvoiceStatus{}
    |> InvoiceStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a invoice_status.

  ## Examples

      iex> update_invoice_status(invoice_status, %{field: new_value})
      {:ok, %InvoiceStatus{}}

      iex> update_invoice_status(invoice_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_invoice_status(%InvoiceStatus{} = invoice_status, attrs) do
    invoice_status
    |> InvoiceStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a invoice_status.

  ## Examples

      iex> delete_invoice_status(invoice_status)
      {:ok, %InvoiceStatus{}}

      iex> delete_invoice_status(invoice_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_invoice_status(%InvoiceStatus{} = invoice_status) do
    Repo.delete(invoice_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking invoice_status changes.

  ## Examples

      iex> change_invoice_status(invoice_status)
      %Ecto.Changeset{data: %InvoiceStatus{}}

  """
  def change_invoice_status(%InvoiceStatus{} = invoice_status, attrs \\ %{}) do
    InvoiceStatus.changeset(invoice_status, attrs)
  end
end
