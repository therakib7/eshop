defmodule Eshop.ObjectsTest do
  use Eshop.DataCase

  alias Eshop.Objects

  describe "items" do
    alias Eshop.Objects.Item

    @valid_attrs %{
      asin_id: 42,
      cost_price: "120.5",
      desc: "some desc",
      extra_fields: %{},
      has_package: true,
      has_variant: true,
      has_warehouse: true,
      is_active: true,
      loves: 42,
      low_stock: 42,
      name: "some name",
      native_desc: "some native_desc",
      native_name: "some native_name",
      sell_price: "120.5",
      total_order: 42,
      type: 42,
      type_id: 42,
      unit: 42,
      unit_price: "120.5",
      vat: 42,
      vat_type: 42,
      views: 42
    }
    @update_attrs %{
      asin_id: 43,
      cost_price: "456.7",
      desc: "some updated desc",
      extra_fields: %{},
      has_package: false,
      has_variant: false,
      has_warehouse: false,
      is_active: false,
      loves: 43,
      low_stock: 43,
      name: "some updated name",
      native_desc: "some updated native_desc",
      native_name: "some updated native_name",
      sell_price: "456.7",
      total_order: 43,
      type: 43,
      type_id: 43,
      unit: 43,
      unit_price: "456.7",
      vat: 43,
      vat_type: 43,
      views: 43
    }
    @invalid_attrs %{
      asin_id: nil,
      cost_price: nil,
      desc: nil,
      extra_fields: nil,
      has_package: nil,
      has_variant: nil,
      has_warehouse: nil,
      is_active: nil,
      loves: nil,
      low_stock: nil,
      name: nil,
      native_desc: nil,
      native_name: nil,
      sell_price: nil,
      total_order: nil,
      type: nil,
      type_id: nil,
      unit: nil,
      unit_price: nil,
      vat: nil,
      vat_type: nil,
      views: nil
    }

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Objects.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Objects.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Objects.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Objects.create_item(@valid_attrs)
      assert item.asin_id == 42
      assert item.cost_price == Decimal.new("120.5")
      assert item.desc == "some desc"
      assert item.extra_fields == %{}
      assert item.has_package == true
      assert item.has_variant == true
      assert item.has_warehouse == true
      assert item.is_active == true
      assert item.loves == 42
      assert item.low_stock == 42
      assert item.name == "some name"
      assert item.native_desc == "some native_desc"
      assert item.native_name == "some native_name"
      assert item.sell_price == Decimal.new("120.5")
      assert item.total_order == 42
      assert item.type == 42
      assert item.type_id == 42
      assert item.unit == 42
      assert item.unit_price == Decimal.new("120.5")
      assert item.vat == 42
      assert item.vat_type == 42
      assert item.views == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Objects.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Objects.update_item(item, @update_attrs)
      assert item.asin_id == 43
      assert item.cost_price == Decimal.new("456.7")
      assert item.desc == "some updated desc"
      assert item.extra_fields == %{}
      assert item.has_package == false
      assert item.has_variant == false
      assert item.has_warehouse == false
      assert item.is_active == false
      assert item.loves == 43
      assert item.low_stock == 43
      assert item.name == "some updated name"
      assert item.native_desc == "some updated native_desc"
      assert item.native_name == "some updated native_name"
      assert item.sell_price == Decimal.new("456.7")
      assert item.total_order == 43
      assert item.type == 43
      assert item.type_id == 43
      assert item.unit == 43
      assert item.unit_price == Decimal.new("456.7")
      assert item.vat == 43
      assert item.vat_type == 43
      assert item.views == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Objects.update_item(item, @invalid_attrs)
      assert item == Objects.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Objects.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Objects.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Objects.change_item(item)
    end
  end

  describe "products" do
    alias Eshop.Objects.Product

    @valid_attrs %{
      barcode: "some barcode",
      exp_date: ~N[2010-04-17 14:00:00],
      mfg_date: ~N[2010-04-17 14:00:00],
      sku: "some sku"
    }
    @update_attrs %{
      barcode: "some updated barcode",
      exp_date: ~N[2011-05-18 15:01:01],
      mfg_date: ~N[2011-05-18 15:01:01],
      sku: "some updated sku"
    }
    @invalid_attrs %{barcode: nil, exp_date: nil, mfg_date: nil, sku: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Objects.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Objects.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Objects.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Objects.create_product(@valid_attrs)
      assert product.barcode == "some barcode"
      assert product.exp_date == ~N[2010-04-17 14:00:00]
      assert product.mfg_date == ~N[2010-04-17 14:00:00]
      assert product.sku == "some sku"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Objects.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Objects.update_product(product, @update_attrs)
      assert product.barcode == "some updated barcode"
      assert product.exp_date == ~N[2011-05-18 15:01:01]
      assert product.mfg_date == ~N[2011-05-18 15:01:01]
      assert product.sku == "some updated sku"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Objects.update_product(product, @invalid_attrs)
      assert product == Objects.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Objects.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Objects.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Objects.change_product(product)
    end
  end
end
