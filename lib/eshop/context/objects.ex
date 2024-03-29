defmodule Eshop.Objects do
  @moduledoc """
  The Objects context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Objects.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

  def create_item(attrs \\ %{}) do
    shop = Eshop.Companies.get_shop!(attrs.shop_id)

    %Item{}
    |> Item.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:shop, shop)
    # |> Ecto.Changeset.put_assoc(:categories, [%{category_id: 1}, %{category_id: 2}])
    |> Ecto.Changeset.put_assoc(:categories, attrs.categories)
    # |> Ecto.Changeset.put_assoc(:variants, attrs.variants)
    |> Repo.insert()

    # {:ok, item} =
    #   %Item{}
    #   |> Item.changeset(attrs)
    #   |> Repo.insert()

    # Eshop.Components.create_item_category(%{
    #   item_id: item.id,
    #   category_id: attrs.category_id
    # })

    # {:ok, item}

    # {:ok, item} =
    # %Item{}
    # |> Item.changeset(attrs)
    # |> Repo.insert()

    #   # IO.inspect(attrs.categories)
    # # Eshop.Components.create_item_category(%{
    # #   item_id: item.id,
    # #   category_id: attrs.category_id
    # # })

    # {:ok, item}

    # %Item{
    #   title: "Hello world bangladesh",
    #   unit_price: 100,
    #   cost_price: 100,
    #   sale_price: 100,
    #   shop_id: 1,
    #   # categories: [
    #   #   %Eshop.Components.ItemCategory{category_id: 1},
    #   #   %Eshop.Components.ItemCategory{category_id: 1},
    #   #   %Eshop.Components.ItemCategory{category_id: 1}
    #   # ]
    # } |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end

  alias Eshop.Objects.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  # def list_products do
  #   Repo.all(Product)
  # end
  def list_products(args) do
    if Map.has_key?(args.filter, :categories) do
      query =
        from(m in Eshop.Components.ItemCategory,
          join: c in Item,
          on: m.item_id == c.id,
          where: ^filter_where(args.filter),
          select: c
        )

      # IO.inspect(query)
      # args = Map.delete(args.filter, :categories)
      # hello = filter_with(query, args)
      # IO.inspect(hello)
    else
      from(p in Item) |> filter_with(args.filter)
    end
  end

  def filter_where(params) do
    Enum.reduce(params, dynamic(true), fn
      {:id, id}, dynamic ->
        dynamic([m, c], ^dynamic and c.id == ^id)

      {:brands, brands}, dynamic ->
        dynamic([m, c], ^dynamic and c.brand_id in ^brands)

      {:shops, shops}, dynamic ->
        dynamic([m, c], ^dynamic and c.shop_id in ^shops)

      {:inserted_before, date}, dynamic ->
        dynamic([m, c], ^dynamic and c.inserted_at <= ^date)

      {:inserted_after, date}, dynamic ->
        dynamic([m, c], ^dynamic and c.inserted_at >= ^date)

      {_, _}, dynamic ->
        # Not a where parameter
        dynamic
    end)
  end

  defp filter_with(query, filter) do
    Enum.reduce(filter, query, fn
      {:id, id}, query ->
        from q in query, where: q.id == ^id

      {:brands, brands}, query ->
        from q in query, where: q.brand_id in ^brands

      {:shops, shops}, query ->
        from q in query, where: q.shop_id in ^shops

      {:title, title}, query ->
        from q in query, where: ilike(q.title, ^"%#{title}%")

      {:inserted_before, date}, query ->
        from q in query, where: q.inserted_at <= ^date

      {:inserted_after, date}, query ->
        from q in query, where: q.inserted_at >= ^date

      {_, _}, query ->
        # Not a where parameter
        query
    end)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

  def create_product(attrs \\ %{}) do
    # %Product{}
    # |> Product.changeset(attrs)
    # |> Repo.insert()
    shop = Eshop.Companies.get_shop!(attrs.type_id)

    %Item{}
    |> Item.changeset(Map.put(attrs.item, :type, 1))
    |> Ecto.Changeset.put_assoc(:shop, shop)
    |> Ecto.Changeset.put_assoc(:product, attrs.product)
    |> Ecto.Changeset.put_assoc(:categories, attrs.categories)
    |> attachments(Map.get(attrs, :attachments))
    |> variants(Map.get(attrs, :variants))
    |> packages(Map.get(attrs, :packages))
    |> warehouses(Map.get(attrs, :warehouses))
    |> Repo.insert()
  end

  defp attachments(query, nil), do: query

  defp attachments(query, attachments) do
    attachments = Enum.map(attachments, fn x -> Map.put(x, :type, 1) end)
    query |> Ecto.Changeset.put_assoc(:attachments, attachments)
  end

  defp variants(query, nil), do: query

  defp variants(query, variants),
    do: query |> Ecto.Changeset.put_assoc(:variants, variants)

  defp packages(query, nil), do: query

  defp packages(query, packages),
    do: query |> Ecto.Changeset.put_assoc(:packages, packages)

  defp warehouses(query, nil), do: query

  defp warehouses(query, warehouses),
    do: query |> Ecto.Changeset.put_assoc(:warehouse_variants, warehouses)

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end
end
