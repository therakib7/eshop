defmodule Eshop.ComponentsTest do
  use Eshop.DataCase

  alias Eshop.Components

  describe "categories" do
    alias Eshop.Components.Category

    @valid_attrs %{
      is_active: true,
      name: "some name",
      native_name: "some native_name",
      slug: "some slug"
    }
    @update_attrs %{
      is_active: false,
      name: "some updated name",
      native_name: "some updated native_name",
      slug: "some updated slug"
    }
    @invalid_attrs %{is_active: nil, name: nil, native_name: nil, slug: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Components.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Components.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Components.create_category(@valid_attrs)
      assert category.is_active == true
      assert category.name == "some name"
      assert category.native_name == "some native_name"
      assert category.slug == "some slug"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Components.update_category(category, @update_attrs)
      assert category.is_active == false
      assert category.name == "some updated name"
      assert category.native_name == "some updated native_name"
      assert category.slug == "some updated slug"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Components.update_category(category, @invalid_attrs)
      assert category == Components.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Components.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Components.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Components.change_category(category)
    end
  end

  describe "brands" do
    alias Eshop.Components.Brand

    @valid_attrs %{
      is_active: true,
      loves: 42,
      name: "some name",
      native_name: "some native_name",
      slug: "some slug"
    }
    @update_attrs %{
      is_active: false,
      loves: 43,
      name: "some updated name",
      native_name: "some updated native_name",
      slug: "some updated slug"
    }
    @invalid_attrs %{is_active: nil, loves: nil, name: nil, native_name: nil, slug: nil}

    def brand_fixture(attrs \\ %{}) do
      {:ok, brand} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_brand()

      brand
    end

    test "list_brands/0 returns all brands" do
      brand = brand_fixture()
      assert Components.list_brands() == [brand]
    end

    test "get_brand!/1 returns the brand with given id" do
      brand = brand_fixture()
      assert Components.get_brand!(brand.id) == brand
    end

    test "create_brand/1 with valid data creates a brand" do
      assert {:ok, %Brand{} = brand} = Components.create_brand(@valid_attrs)
      assert brand.is_active == true
      assert brand.loves == 42
      assert brand.name == "some name"
      assert brand.native_name == "some native_name"
      assert brand.slug == "some slug"
    end

    test "create_brand/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_brand(@invalid_attrs)
    end

    test "update_brand/2 with valid data updates the brand" do
      brand = brand_fixture()
      assert {:ok, %Brand{} = brand} = Components.update_brand(brand, @update_attrs)
      assert brand.is_active == false
      assert brand.loves == 43
      assert brand.name == "some updated name"
      assert brand.native_name == "some updated native_name"
      assert brand.slug == "some updated slug"
    end

    test "update_brand/2 with invalid data returns error changeset" do
      brand = brand_fixture()
      assert {:error, %Ecto.Changeset{}} = Components.update_brand(brand, @invalid_attrs)
      assert brand == Components.get_brand!(brand.id)
    end

    test "delete_brand/1 deletes the brand" do
      brand = brand_fixture()
      assert {:ok, %Brand{}} = Components.delete_brand(brand)
      assert_raise Ecto.NoResultsError, fn -> Components.get_brand!(brand.id) end
    end

    test "change_brand/1 returns a brand changeset" do
      brand = brand_fixture()
      assert %Ecto.Changeset{} = Components.change_brand(brand)
    end
  end

  describe "unit_types" do
    alias Eshop.Components.UnitType

    @valid_attrs %{name: "some name", native_name: "some native_name"}
    @update_attrs %{name: "some updated name", native_name: "some updated native_name"}
    @invalid_attrs %{name: nil, native_name: nil}

    def unit_type_fixture(attrs \\ %{}) do
      {:ok, unit_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_unit_type()

      unit_type
    end

    test "list_unit_types/0 returns all unit_types" do
      unit_type = unit_type_fixture()
      assert Components.list_unit_types() == [unit_type]
    end

    test "get_unit_type!/1 returns the unit_type with given id" do
      unit_type = unit_type_fixture()
      assert Components.get_unit_type!(unit_type.id) == unit_type
    end

    test "create_unit_type/1 with valid data creates a unit_type" do
      assert {:ok, %UnitType{} = unit_type} = Components.create_unit_type(@valid_attrs)
      assert unit_type.name == "some name"
      assert unit_type.native_name == "some native_name"
    end

    test "create_unit_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_unit_type(@invalid_attrs)
    end

    test "update_unit_type/2 with valid data updates the unit_type" do
      unit_type = unit_type_fixture()

      assert {:ok, %UnitType{} = unit_type} =
               Components.update_unit_type(unit_type, @update_attrs)

      assert unit_type.name == "some updated name"
      assert unit_type.native_name == "some updated native_name"
    end

    test "update_unit_type/2 with invalid data returns error changeset" do
      unit_type = unit_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Components.update_unit_type(unit_type, @invalid_attrs)
      assert unit_type == Components.get_unit_type!(unit_type.id)
    end

    test "delete_unit_type/1 deletes the unit_type" do
      unit_type = unit_type_fixture()
      assert {:ok, %UnitType{}} = Components.delete_unit_type(unit_type)
      assert_raise Ecto.NoResultsError, fn -> Components.get_unit_type!(unit_type.id) end
    end

    test "change_unit_type/1 returns a unit_type changeset" do
      unit_type = unit_type_fixture()
      assert %Ecto.Changeset{} = Components.change_unit_type(unit_type)
    end
  end

  describe "type_categories" do
    alias Eshop.Components.TypeCategory

    @valid_attrs %{type: 42, type_id: 42}
    @update_attrs %{type: 43, type_id: 43}
    @invalid_attrs %{type: nil, type_id: nil}

    def type_category_fixture(attrs \\ %{}) do
      {:ok, type_category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_type_category()

      type_category
    end

    test "list_type_categories/0 returns all type_categories" do
      type_category = type_category_fixture()
      assert Components.list_type_categories() == [type_category]
    end

    test "get_type_category!/1 returns the type_category with given id" do
      type_category = type_category_fixture()
      assert Components.get_type_category!(type_category.id) == type_category
    end

    test "create_type_category/1 with valid data creates a type_category" do
      assert {:ok, %TypeCategory{} = type_category} =
               Components.create_type_category(@valid_attrs)

      assert type_category.type == 42
      assert type_category.type_id == 42
    end

    test "create_type_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_type_category(@invalid_attrs)
    end

    test "update_type_category/2 with valid data updates the type_category" do
      type_category = type_category_fixture()

      assert {:ok, %TypeCategory{} = type_category} =
               Components.update_type_category(type_category, @update_attrs)

      assert type_category.type == 43
      assert type_category.type_id == 43
    end

    test "update_type_category/2 with invalid data returns error changeset" do
      type_category = type_category_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Components.update_type_category(type_category, @invalid_attrs)

      assert type_category == Components.get_type_category!(type_category.id)
    end

    test "delete_type_category/1 deletes the type_category" do
      type_category = type_category_fixture()
      assert {:ok, %TypeCategory{}} = Components.delete_type_category(type_category)
      assert_raise Ecto.NoResultsError, fn -> Components.get_type_category!(type_category.id) end
    end

    test "change_type_category/1 returns a type_category changeset" do
      type_category = type_category_fixture()
      assert %Ecto.Changeset{} = Components.change_type_category(type_category)
    end
  end

  describe "variants" do
    alias Eshop.Components.Variant

    @valid_attrs %{name: "some name", native_name: "some native_name", type: 42}
    @update_attrs %{name: "some updated name", native_name: "some updated native_name", type: 43}
    @invalid_attrs %{name: nil, native_name: nil, type: nil}

    def variant_fixture(attrs \\ %{}) do
      {:ok, variant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_variant()

      variant
    end

    test "list_variants/0 returns all variants" do
      variant = variant_fixture()
      assert Components.list_variants() == [variant]
    end

    test "get_variant!/1 returns the variant with given id" do
      variant = variant_fixture()
      assert Components.get_variant!(variant.id) == variant
    end

    test "create_variant/1 with valid data creates a variant" do
      assert {:ok, %Variant{} = variant} = Components.create_variant(@valid_attrs)
      assert variant.name == "some name"
      assert variant.native_name == "some native_name"
      assert variant.type == 42
    end

    test "create_variant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_variant(@invalid_attrs)
    end

    test "update_variant/2 with valid data updates the variant" do
      variant = variant_fixture()
      assert {:ok, %Variant{} = variant} = Components.update_variant(variant, @update_attrs)
      assert variant.name == "some updated name"
      assert variant.native_name == "some updated native_name"
      assert variant.type == 43
    end

    test "update_variant/2 with invalid data returns error changeset" do
      variant = variant_fixture()
      assert {:error, %Ecto.Changeset{}} = Components.update_variant(variant, @invalid_attrs)
      assert variant == Components.get_variant!(variant.id)
    end

    test "delete_variant/1 deletes the variant" do
      variant = variant_fixture()
      assert {:ok, %Variant{}} = Components.delete_variant(variant)
      assert_raise Ecto.NoResultsError, fn -> Components.get_variant!(variant.id) end
    end

    test "change_variant/1 returns a variant changeset" do
      variant = variant_fixture()
      assert %Ecto.Changeset{} = Components.change_variant(variant)
    end
  end

  describe "variant_values" do
    alias Eshop.Components.VariantValue

    @valid_attrs %{native_value: "some native_value", value: "some value"}
    @update_attrs %{native_value: "some updated native_value", value: "some updated value"}
    @invalid_attrs %{native_value: nil, value: nil}

    def variant_value_fixture(attrs \\ %{}) do
      {:ok, variant_value} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_variant_value()

      variant_value
    end

    test "list_variant_values/0 returns all variant_values" do
      variant_value = variant_value_fixture()
      assert Components.list_variant_values() == [variant_value]
    end

    test "get_variant_value!/1 returns the variant_value with given id" do
      variant_value = variant_value_fixture()
      assert Components.get_variant_value!(variant_value.id) == variant_value
    end

    test "create_variant_value/1 with valid data creates a variant_value" do
      assert {:ok, %VariantValue{} = variant_value} =
               Components.create_variant_value(@valid_attrs)

      assert variant_value.native_value == "some native_value"
      assert variant_value.value == "some value"
    end

    test "create_variant_value/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_variant_value(@invalid_attrs)
    end

    test "update_variant_value/2 with valid data updates the variant_value" do
      variant_value = variant_value_fixture()

      assert {:ok, %VariantValue{} = variant_value} =
               Components.update_variant_value(variant_value, @update_attrs)

      assert variant_value.native_value == "some updated native_value"
      assert variant_value.value == "some updated value"
    end

    test "update_variant_value/2 with invalid data returns error changeset" do
      variant_value = variant_value_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Components.update_variant_value(variant_value, @invalid_attrs)

      assert variant_value == Components.get_variant_value!(variant_value.id)
    end

    test "delete_variant_value/1 deletes the variant_value" do
      variant_value = variant_value_fixture()
      assert {:ok, %VariantValue{}} = Components.delete_variant_value(variant_value)
      assert_raise Ecto.NoResultsError, fn -> Components.get_variant_value!(variant_value.id) end
    end

    test "change_variant_value/1 returns a variant_value changeset" do
      variant_value = variant_value_fixture()
      assert %Ecto.Changeset{} = Components.change_variant_value(variant_value)
    end
  end

  describe "item_categories" do
    alias Eshop.Components.ItemCategory

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def item_category_fixture(attrs \\ %{}) do
      {:ok, item_category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_item_category()

      item_category
    end

    test "list_item_categories/0 returns all item_categories" do
      item_category = item_category_fixture()
      assert Components.list_item_categories() == [item_category]
    end

    test "get_item_category!/1 returns the item_category with given id" do
      item_category = item_category_fixture()
      assert Components.get_item_category!(item_category.id) == item_category
    end

    test "create_item_category/1 with valid data creates a item_category" do
      assert {:ok, %ItemCategory{} = item_category} =
               Components.create_item_category(@valid_attrs)
    end

    test "create_item_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_item_category(@invalid_attrs)
    end

    test "update_item_category/2 with valid data updates the item_category" do
      item_category = item_category_fixture()

      assert {:ok, %ItemCategory{} = item_category} =
               Components.update_item_category(item_category, @update_attrs)
    end

    test "update_item_category/2 with invalid data returns error changeset" do
      item_category = item_category_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Components.update_item_category(item_category, @invalid_attrs)

      assert item_category == Components.get_item_category!(item_category.id)
    end

    test "delete_item_category/1 deletes the item_category" do
      item_category = item_category_fixture()
      assert {:ok, %ItemCategory{}} = Components.delete_item_category(item_category)
      assert_raise Ecto.NoResultsError, fn -> Components.get_item_category!(item_category.id) end
    end

    test "change_item_category/1 returns a item_category changeset" do
      item_category = item_category_fixture()
      assert %Ecto.Changeset{} = Components.change_item_category(item_category)
    end
  end

  describe "packages" do
    alias Eshop.Components.Package

    @valid_attrs %{cost_price: "120.5", sale_price: "120.5", unit_price: "120.5"}
    @update_attrs %{cost_price: "456.7", sale_price: "456.7", unit_price: "456.7"}
    @invalid_attrs %{cost_price: nil, sale_price: nil, unit_price: nil}

    def package_fixture(attrs \\ %{}) do
      {:ok, package} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_package()

      package
    end

    test "list_packages/0 returns all packages" do
      package = package_fixture()
      assert Components.list_packages() == [package]
    end

    test "get_package!/1 returns the package with given id" do
      package = package_fixture()
      assert Components.get_package!(package.id) == package
    end

    test "create_package/1 with valid data creates a package" do
      assert {:ok, %Package{} = package} = Components.create_package(@valid_attrs)
      assert package.cost_price == Decimal.new("120.5")
      assert package.sale_price == Decimal.new("120.5")
      assert package.unit_price == Decimal.new("120.5")
    end

    test "create_package/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_package(@invalid_attrs)
    end

    test "update_package/2 with valid data updates the package" do
      package = package_fixture()
      assert {:ok, %Package{} = package} = Components.update_package(package, @update_attrs)
      assert package.cost_price == Decimal.new("456.7")
      assert package.sale_price == Decimal.new("456.7")
      assert package.unit_price == Decimal.new("456.7")
    end

    test "update_package/2 with invalid data returns error changeset" do
      package = package_fixture()
      assert {:error, %Ecto.Changeset{}} = Components.update_package(package, @invalid_attrs)
      assert package == Components.get_package!(package.id)
    end

    test "delete_package/1 deletes the package" do
      package = package_fixture()
      assert {:ok, %Package{}} = Components.delete_package(package)
      assert_raise Ecto.NoResultsError, fn -> Components.get_package!(package.id) end
    end

    test "change_package/1 returns a package changeset" do
      package = package_fixture()
      assert %Ecto.Changeset{} = Components.change_package(package)
    end
  end

  describe "package_items" do
    alias Eshop.Components.PackageItem

    @valid_attrs %{name: "some name", native_name: "some native_name"}
    @update_attrs %{name: "some updated name", native_name: "some updated native_name"}
    @invalid_attrs %{name: nil, native_name: nil}

    def package_item_fixture(attrs \\ %{}) do
      {:ok, package_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_package_item()

      package_item
    end

    test "list_package_items/0 returns all package_items" do
      package_item = package_item_fixture()
      assert Components.list_package_items() == [package_item]
    end

    test "get_package_item!/1 returns the package_item with given id" do
      package_item = package_item_fixture()
      assert Components.get_package_item!(package_item.id) == package_item
    end

    test "create_package_item/1 with valid data creates a package_item" do
      assert {:ok, %PackageItem{} = package_item} = Components.create_package_item(@valid_attrs)
      assert package_item.name == "some name"
      assert package_item.native_name == "some native_name"
    end

    test "create_package_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_package_item(@invalid_attrs)
    end

    test "update_package_item/2 with valid data updates the package_item" do
      package_item = package_item_fixture()

      assert {:ok, %PackageItem{} = package_item} =
               Components.update_package_item(package_item, @update_attrs)

      assert package_item.name == "some updated name"
      assert package_item.native_name == "some updated native_name"
    end

    test "update_package_item/2 with invalid data returns error changeset" do
      package_item = package_item_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Components.update_package_item(package_item, @invalid_attrs)

      assert package_item == Components.get_package_item!(package_item.id)
    end

    test "delete_package_item/1 deletes the package_item" do
      package_item = package_item_fixture()
      assert {:ok, %PackageItem{}} = Components.delete_package_item(package_item)
      assert_raise Ecto.NoResultsError, fn -> Components.get_package_item!(package_item.id) end
    end

    test "change_package_item/1 returns a package_item changeset" do
      package_item = package_item_fixture()
      assert %Ecto.Changeset{} = Components.change_package_item(package_item)
    end
  end

  describe "item_variants" do
    alias Eshop.Components.ItemVariant

    @valid_attrs %{cost_price: "120.5", sale_price: "120.5", unit_price: "120.5"}
    @update_attrs %{cost_price: "456.7", sale_price: "456.7", unit_price: "456.7"}
    @invalid_attrs %{cost_price: nil, sale_price: nil, unit_price: nil}

    def item_variant_fixture(attrs \\ %{}) do
      {:ok, item_variant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_item_variant()

      item_variant
    end

    test "list_item_variants/0 returns all item_variants" do
      item_variant = item_variant_fixture()
      assert Components.list_item_variants() == [item_variant]
    end

    test "get_item_variant!/1 returns the item_variant with given id" do
      item_variant = item_variant_fixture()
      assert Components.get_item_variant!(item_variant.id) == item_variant
    end

    test "create_item_variant/1 with valid data creates a item_variant" do
      assert {:ok, %ItemVariant{} = item_variant} = Components.create_item_variant(@valid_attrs)
      assert item_variant.cost_price == Decimal.new("120.5")
      assert item_variant.sale_price == Decimal.new("120.5")
      assert item_variant.unit_price == Decimal.new("120.5")
    end

    test "create_item_variant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_item_variant(@invalid_attrs)
    end

    test "update_item_variant/2 with valid data updates the item_variant" do
      item_variant = item_variant_fixture()

      assert {:ok, %ItemVariant{} = item_variant} =
               Components.update_item_variant(item_variant, @update_attrs)

      assert item_variant.cost_price == Decimal.new("456.7")
      assert item_variant.sale_price == Decimal.new("456.7")
      assert item_variant.unit_price == Decimal.new("456.7")
    end

    test "update_item_variant/2 with invalid data returns error changeset" do
      item_variant = item_variant_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Components.update_item_variant(item_variant, @invalid_attrs)

      assert item_variant == Components.get_item_variant!(item_variant.id)
    end

    test "delete_item_variant/1 deletes the item_variant" do
      item_variant = item_variant_fixture()
      assert {:ok, %ItemVariant{}} = Components.delete_item_variant(item_variant)
      assert_raise Ecto.NoResultsError, fn -> Components.get_item_variant!(item_variant.id) end
    end

    test "change_item_variant/1 returns a item_variant changeset" do
      item_variant = item_variant_fixture()
      assert %Ecto.Changeset{} = Components.change_item_variant(item_variant)
    end
  end

  describe "item_warehouse_variants" do
    alias Eshop.Components.ItemWarehouseVariant

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def item_warehouse_variant_fixture(attrs \\ %{}) do
      {:ok, item_warehouse_variant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_item_warehouse_variant()

      item_warehouse_variant
    end

    test "list_item_warehouse_variants/0 returns all item_warehouse_variants" do
      item_warehouse_variant = item_warehouse_variant_fixture()
      assert Components.list_item_warehouse_variants() == [item_warehouse_variant]
    end

    test "get_item_warehouse_variant!/1 returns the item_warehouse_variant with given id" do
      item_warehouse_variant = item_warehouse_variant_fixture()

      assert Components.get_item_warehouse_variant!(item_warehouse_variant.id) ==
               item_warehouse_variant
    end

    test "create_item_warehouse_variant/1 with valid data creates a item_warehouse_variant" do
      assert {:ok, %ItemWarehouseVariant{} = item_warehouse_variant} =
               Components.create_item_warehouse_variant(@valid_attrs)
    end

    test "create_item_warehouse_variant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               Components.create_item_warehouse_variant(@invalid_attrs)
    end

    test "update_item_warehouse_variant/2 with valid data updates the item_warehouse_variant" do
      item_warehouse_variant = item_warehouse_variant_fixture()

      assert {:ok, %ItemWarehouseVariant{} = item_warehouse_variant} =
               Components.update_item_warehouse_variant(item_warehouse_variant, @update_attrs)
    end

    test "update_item_warehouse_variant/2 with invalid data returns error changeset" do
      item_warehouse_variant = item_warehouse_variant_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Components.update_item_warehouse_variant(item_warehouse_variant, @invalid_attrs)

      assert item_warehouse_variant ==
               Components.get_item_warehouse_variant!(item_warehouse_variant.id)
    end

    test "delete_item_warehouse_variant/1 deletes the item_warehouse_variant" do
      item_warehouse_variant = item_warehouse_variant_fixture()

      assert {:ok, %ItemWarehouseVariant{}} =
               Components.delete_item_warehouse_variant(item_warehouse_variant)

      assert_raise Ecto.NoResultsError, fn ->
        Components.get_item_warehouse_variant!(item_warehouse_variant.id)
      end
    end

    test "change_item_warehouse_variant/1 returns a item_warehouse_variant changeset" do
      item_warehouse_variant = item_warehouse_variant_fixture()
      assert %Ecto.Changeset{} = Components.change_item_warehouse_variant(item_warehouse_variant)
    end
  end

  describe "faqs" do
    alias Eshop.Components.Faq

    @valid_attrs %{
      content: "some content",
      native_content: "some native_content",
      native_question: "some native_question",
      question: "some question"
    }
    @update_attrs %{
      content: "some updated content",
      native_content: "some updated native_content",
      native_question: "some updated native_question",
      question: "some updated question"
    }
    @invalid_attrs %{content: nil, native_content: nil, native_question: nil, question: nil}

    def faq_fixture(attrs \\ %{}) do
      {:ok, faq} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_faq()

      faq
    end

    test "list_faqs/0 returns all faqs" do
      faq = faq_fixture()
      assert Components.list_faqs() == [faq]
    end

    test "get_faq!/1 returns the faq with given id" do
      faq = faq_fixture()
      assert Components.get_faq!(faq.id) == faq
    end

    test "create_faq/1 with valid data creates a faq" do
      assert {:ok, %Faq{} = faq} = Components.create_faq(@valid_attrs)
      assert faq.content == "some content"
      assert faq.native_content == "some native_content"
      assert faq.native_question == "some native_question"
      assert faq.question == "some question"
    end

    test "create_faq/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_faq(@invalid_attrs)
    end

    test "update_faq/2 with valid data updates the faq" do
      faq = faq_fixture()
      assert {:ok, %Faq{} = faq} = Components.update_faq(faq, @update_attrs)
      assert faq.content == "some updated content"
      assert faq.native_content == "some updated native_content"
      assert faq.native_question == "some updated native_question"
      assert faq.question == "some updated question"
    end

    test "update_faq/2 with invalid data returns error changeset" do
      faq = faq_fixture()
      assert {:error, %Ecto.Changeset{}} = Components.update_faq(faq, @invalid_attrs)
      assert faq == Components.get_faq!(faq.id)
    end

    test "delete_faq/1 deletes the faq" do
      faq = faq_fixture()
      assert {:ok, %Faq{}} = Components.delete_faq(faq)
      assert_raise Ecto.NoResultsError, fn -> Components.get_faq!(faq.id) end
    end

    test "change_faq/1 returns a faq changeset" do
      faq = faq_fixture()
      assert %Ecto.Changeset{} = Components.change_faq(faq)
    end
  end

  describe "discount_codes" do
    alias Eshop.Components.DiscountCode

    @valid_attrs %{
      amount: 42,
      code: "some code",
      created_at: "2010-04-17T14:00:00Z",
      is_active: true,
      used_at: "2010-04-17T14:00:00Z",
      validity: 42
    }
    @update_attrs %{
      amount: 43,
      code: "some updated code",
      created_at: "2011-05-18T15:01:01Z",
      is_active: false,
      used_at: "2011-05-18T15:01:01Z",
      validity: 43
    }
    @invalid_attrs %{
      amount: nil,
      code: nil,
      created_at: nil,
      is_active: nil,
      used_at: nil,
      validity: nil
    }

    def discount_code_fixture(attrs \\ %{}) do
      {:ok, discount_code} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_discount_code()

      discount_code
    end

    test "list_discount_codes/0 returns all discount_codes" do
      discount_code = discount_code_fixture()
      assert Components.list_discount_codes() == [discount_code]
    end

    test "get_discount_code!/1 returns the discount_code with given id" do
      discount_code = discount_code_fixture()
      assert Components.get_discount_code!(discount_code.id) == discount_code
    end

    test "create_discount_code/1 with valid data creates a discount_code" do
      assert {:ok, %DiscountCode{} = discount_code} =
               Components.create_discount_code(@valid_attrs)

      assert discount_code.amount == 42
      assert discount_code.code == "some code"
      assert discount_code.created_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert discount_code.is_active == true
      assert discount_code.used_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert discount_code.validity == 42
    end

    test "create_discount_code/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_discount_code(@invalid_attrs)
    end

    test "update_discount_code/2 with valid data updates the discount_code" do
      discount_code = discount_code_fixture()

      assert {:ok, %DiscountCode{} = discount_code} =
               Components.update_discount_code(discount_code, @update_attrs)

      assert discount_code.amount == 43
      assert discount_code.code == "some updated code"
      assert discount_code.created_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert discount_code.is_active == false
      assert discount_code.used_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert discount_code.validity == 43
    end

    test "update_discount_code/2 with invalid data returns error changeset" do
      discount_code = discount_code_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Components.update_discount_code(discount_code, @invalid_attrs)

      assert discount_code == Components.get_discount_code!(discount_code.id)
    end

    test "delete_discount_code/1 deletes the discount_code" do
      discount_code = discount_code_fixture()
      assert {:ok, %DiscountCode{}} = Components.delete_discount_code(discount_code)
      assert_raise Ecto.NoResultsError, fn -> Components.get_discount_code!(discount_code.id) end
    end

    test "change_discount_code/1 returns a discount_code changeset" do
      discount_code = discount_code_fixture()
      assert %Ecto.Changeset{} = Components.change_discount_code(discount_code)
    end
  end

  describe "type_statuses" do
    alias Eshop.Components.TypeStatus

    @valid_attrs %{
      is_active: true,
      name: "some name",
      native_name: "some native_name",
      order: 42,
      type: 42
    }
    @update_attrs %{
      is_active: false,
      name: "some updated name",
      native_name: "some updated native_name",
      order: 43,
      type: 43
    }
    @invalid_attrs %{is_active: nil, name: nil, native_name: nil, order: nil, type: nil}

    def type_status_fixture(attrs \\ %{}) do
      {:ok, type_status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_type_status()

      type_status
    end

    test "list_type_statuses/0 returns all type_statuses" do
      type_status = type_status_fixture()
      assert Components.list_type_statuses() == [type_status]
    end

    test "get_type_status!/1 returns the type_status with given id" do
      type_status = type_status_fixture()
      assert Components.get_type_status!(type_status.id) == type_status
    end

    test "create_type_status/1 with valid data creates a type_status" do
      assert {:ok, %TypeStatus{} = type_status} = Components.create_type_status(@valid_attrs)
      assert type_status.is_active == true
      assert type_status.name == "some name"
      assert type_status.native_name == "some native_name"
      assert type_status.order == 42
      assert type_status.type == 42
    end

    test "create_type_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_type_status(@invalid_attrs)
    end

    test "update_type_status/2 with valid data updates the type_status" do
      type_status = type_status_fixture()

      assert {:ok, %TypeStatus{} = type_status} =
               Components.update_type_status(type_status, @update_attrs)

      assert type_status.is_active == false
      assert type_status.name == "some updated name"
      assert type_status.native_name == "some updated native_name"
      assert type_status.order == 43
      assert type_status.type == 43
    end

    test "update_type_status/2 with invalid data returns error changeset" do
      type_status = type_status_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Components.update_type_status(type_status, @invalid_attrs)

      assert type_status == Components.get_type_status!(type_status.id)
    end

    test "delete_type_status/1 deletes the type_status" do
      type_status = type_status_fixture()
      assert {:ok, %TypeStatus{}} = Components.delete_type_status(type_status)
      assert_raise Ecto.NoResultsError, fn -> Components.get_type_status!(type_status.id) end
    end

    test "change_type_status/1 returns a type_status changeset" do
      type_status = type_status_fixture()
      assert %Ecto.Changeset{} = Components.change_type_status(type_status)
    end
  end

  describe "invoice_statuses" do
    alias Eshop.Components.InvoiceStatus

    @valid_attrs %{type: 42, type_id: 42}
    @update_attrs %{type: 43, type_id: 43}
    @invalid_attrs %{type: nil, type_id: nil}

    def invoice_status_fixture(attrs \\ %{}) do
      {:ok, invoice_status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components.create_invoice_status()

      invoice_status
    end

    test "list_invoice_statuses/0 returns all invoice_statuses" do
      invoice_status = invoice_status_fixture()
      assert Components.list_invoice_statuses() == [invoice_status]
    end

    test "get_invoice_status!/1 returns the invoice_status with given id" do
      invoice_status = invoice_status_fixture()
      assert Components.get_invoice_status!(invoice_status.id) == invoice_status
    end

    test "create_invoice_status/1 with valid data creates a invoice_status" do
      assert {:ok, %InvoiceStatus{} = invoice_status} =
               Components.create_invoice_status(@valid_attrs)

      assert invoice_status.type == 42
      assert invoice_status.type_id == 42
    end

    test "create_invoice_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components.create_invoice_status(@invalid_attrs)
    end

    test "update_invoice_status/2 with valid data updates the invoice_status" do
      invoice_status = invoice_status_fixture()

      assert {:ok, %InvoiceStatus{} = invoice_status} =
               Components.update_invoice_status(invoice_status, @update_attrs)

      assert invoice_status.type == 43
      assert invoice_status.type_id == 43
    end

    test "update_invoice_status/2 with invalid data returns error changeset" do
      invoice_status = invoice_status_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Components.update_invoice_status(invoice_status, @invalid_attrs)

      assert invoice_status == Components.get_invoice_status!(invoice_status.id)
    end

    test "delete_invoice_status/1 deletes the invoice_status" do
      invoice_status = invoice_status_fixture()
      assert {:ok, %InvoiceStatus{}} = Components.delete_invoice_status(invoice_status)

      assert_raise Ecto.NoResultsError, fn ->
        Components.get_invoice_status!(invoice_status.id)
      end
    end

    test "change_invoice_status/1 returns a invoice_status changeset" do
      invoice_status = invoice_status_fixture()
      assert %Ecto.Changeset{} = Components.change_invoice_status(invoice_status)
    end
  end
end
