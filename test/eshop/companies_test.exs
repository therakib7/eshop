defmodule Eshop.CompaniesTest do
  use Eshop.DataCase

  alias Eshop.Companies

  describe "companies" do
    alias Eshop.Companies.Company

    @valid_attrs %{created_at: "2010-04-17T14:00:00Z", golden_supplier: true, highest_assurance: "120.5", is_active: true, is_verifed: true, name: "some name", trade_assurance: true}
    @update_attrs %{created_at: "2011-05-18T15:01:01Z", golden_supplier: false, highest_assurance: "456.7", is_active: false, is_verifed: false, name: "some updated name", trade_assurance: false}
    @invalid_attrs %{created_at: nil, golden_supplier: nil, highest_assurance: nil, is_active: nil, is_verifed: nil, name: nil, trade_assurance: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Companies.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Companies.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Companies.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Companies.create_company(@valid_attrs)
      assert company.created_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert company.golden_supplier == true
      assert company.highest_assurance == Decimal.new("120.5")
      assert company.is_active == true
      assert company.is_verifed == true
      assert company.name == "some name"
      assert company.trade_assurance == true
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companies.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, %Company{} = company} = Companies.update_company(company, @update_attrs)
      assert company.created_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert company.golden_supplier == false
      assert company.highest_assurance == Decimal.new("456.7")
      assert company.is_active == false
      assert company.is_verifed == false
      assert company.name == "some updated name"
      assert company.trade_assurance == false
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Companies.update_company(company, @invalid_attrs)
      assert company == Companies.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Companies.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Companies.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Companies.change_company(company)
    end
  end

  describe "shops" do
    alias Eshop.Companies.Shop

    @valid_attrs %{created_at: "2010-04-17T14:00:00Z", golden_supplier: true, highest_assurance: "120.5", is_active: true, is_verifed: true, name: "some name", native_name: "some native_name", trade_assurance: true}
    @update_attrs %{created_at: "2011-05-18T15:01:01Z", golden_supplier: false, highest_assurance: "456.7", is_active: false, is_verifed: false, name: "some updated name", native_name: "some updated native_name", trade_assurance: false}
    @invalid_attrs %{created_at: nil, golden_supplier: nil, highest_assurance: nil, is_active: nil, is_verifed: nil, name: nil, native_name: nil, trade_assurance: nil}

    def shop_fixture(attrs \\ %{}) do
      {:ok, shop} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Companies.create_shop()

      shop
    end

    test "list_shops/0 returns all shops" do
      shop = shop_fixture()
      assert Companies.list_shops() == [shop]
    end

    test "get_shop!/1 returns the shop with given id" do
      shop = shop_fixture()
      assert Companies.get_shop!(shop.id) == shop
    end

    test "create_shop/1 with valid data creates a shop" do
      assert {:ok, %Shop{} = shop} = Companies.create_shop(@valid_attrs)
      assert shop.created_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert shop.golden_supplier == true
      assert shop.highest_assurance == Decimal.new("120.5")
      assert shop.is_active == true
      assert shop.is_verifed == true
      assert shop.name == "some name"
      assert shop.native_name == "some native_name"
      assert shop.trade_assurance == true
    end

    test "create_shop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companies.create_shop(@invalid_attrs)
    end

    test "update_shop/2 with valid data updates the shop" do
      shop = shop_fixture()
      assert {:ok, %Shop{} = shop} = Companies.update_shop(shop, @update_attrs)
      assert shop.created_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert shop.golden_supplier == false
      assert shop.highest_assurance == Decimal.new("456.7")
      assert shop.is_active == false
      assert shop.is_verifed == false
      assert shop.name == "some updated name"
      assert shop.native_name == "some updated native_name"
      assert shop.trade_assurance == false
    end

    test "update_shop/2 with invalid data returns error changeset" do
      shop = shop_fixture()
      assert {:error, %Ecto.Changeset{}} = Companies.update_shop(shop, @invalid_attrs)
      assert shop == Companies.get_shop!(shop.id)
    end

    test "delete_shop/1 deletes the shop" do
      shop = shop_fixture()
      assert {:ok, %Shop{}} = Companies.delete_shop(shop)
      assert_raise Ecto.NoResultsError, fn -> Companies.get_shop!(shop.id) end
    end

    test "change_shop/1 returns a shop changeset" do
      shop = shop_fixture()
      assert %Ecto.Changeset{} = Companies.change_shop(shop)
    end
  end

  describe "type_user_roles" do
    alias Eshop.Companies.TypeUserRole

    @valid_attrs %{type: 42, type_id: 42}
    @update_attrs %{type: 43, type_id: 43}
    @invalid_attrs %{type: nil, type_id: nil}

    def type_user_role_fixture(attrs \\ %{}) do
      {:ok, type_user_role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Companies.create_type_user_role()

      type_user_role
    end

    test "list_type_user_roles/0 returns all type_user_roles" do
      type_user_role = type_user_role_fixture()
      assert Companies.list_type_user_roles() == [type_user_role]
    end

    test "get_type_user_role!/1 returns the type_user_role with given id" do
      type_user_role = type_user_role_fixture()
      assert Companies.get_type_user_role!(type_user_role.id) == type_user_role
    end

    test "create_type_user_role/1 with valid data creates a type_user_role" do
      assert {:ok, %TypeUserRole{} = type_user_role} = Companies.create_type_user_role(@valid_attrs)
      assert type_user_role.type == 42
      assert type_user_role.type_id == 42
    end

    test "create_type_user_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companies.create_type_user_role(@invalid_attrs)
    end

    test "update_type_user_role/2 with valid data updates the type_user_role" do
      type_user_role = type_user_role_fixture()
      assert {:ok, %TypeUserRole{} = type_user_role} = Companies.update_type_user_role(type_user_role, @update_attrs)
      assert type_user_role.type == 43
      assert type_user_role.type_id == 43
    end

    test "update_type_user_role/2 with invalid data returns error changeset" do
      type_user_role = type_user_role_fixture()
      assert {:error, %Ecto.Changeset{}} = Companies.update_type_user_role(type_user_role, @invalid_attrs)
      assert type_user_role == Companies.get_type_user_role!(type_user_role.id)
    end

    test "delete_type_user_role/1 deletes the type_user_role" do
      type_user_role = type_user_role_fixture()
      assert {:ok, %TypeUserRole{}} = Companies.delete_type_user_role(type_user_role)
      assert_raise Ecto.NoResultsError, fn -> Companies.get_type_user_role!(type_user_role.id) end
    end

    test "change_type_user_role/1 returns a type_user_role changeset" do
      type_user_role = type_user_role_fixture()
      assert %Ecto.Changeset{} = Companies.change_type_user_role(type_user_role)
    end
  end

  describe "warehouses" do
    alias Eshop.Companies.Warehouse

    @valid_attrs %{is_active: true, name: "some name", native_name: "some native_name"}
    @update_attrs %{is_active: false, name: "some updated name", native_name: "some updated native_name"}
    @invalid_attrs %{is_active: nil, name: nil, native_name: nil}

    def warehouse_fixture(attrs \\ %{}) do
      {:ok, warehouse} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Companies.create_warehouse()

      warehouse
    end

    test "list_warehouses/0 returns all warehouses" do
      warehouse = warehouse_fixture()
      assert Companies.list_warehouses() == [warehouse]
    end

    test "get_warehouse!/1 returns the warehouse with given id" do
      warehouse = warehouse_fixture()
      assert Companies.get_warehouse!(warehouse.id) == warehouse
    end

    test "create_warehouse/1 with valid data creates a warehouse" do
      assert {:ok, %Warehouse{} = warehouse} = Companies.create_warehouse(@valid_attrs)
      assert warehouse.is_active == true
      assert warehouse.name == "some name"
      assert warehouse.native_name == "some native_name"
    end

    test "create_warehouse/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companies.create_warehouse(@invalid_attrs)
    end

    test "update_warehouse/2 with valid data updates the warehouse" do
      warehouse = warehouse_fixture()
      assert {:ok, %Warehouse{} = warehouse} = Companies.update_warehouse(warehouse, @update_attrs)
      assert warehouse.is_active == false
      assert warehouse.name == "some updated name"
      assert warehouse.native_name == "some updated native_name"
    end

    test "update_warehouse/2 with invalid data returns error changeset" do
      warehouse = warehouse_fixture()
      assert {:error, %Ecto.Changeset{}} = Companies.update_warehouse(warehouse, @invalid_attrs)
      assert warehouse == Companies.get_warehouse!(warehouse.id)
    end

    test "delete_warehouse/1 deletes the warehouse" do
      warehouse = warehouse_fixture()
      assert {:ok, %Warehouse{}} = Companies.delete_warehouse(warehouse)
      assert_raise Ecto.NoResultsError, fn -> Companies.get_warehouse!(warehouse.id) end
    end

    test "change_warehouse/1 returns a warehouse changeset" do
      warehouse = warehouse_fixture()
      assert %Ecto.Changeset{} = Companies.change_warehouse(warehouse)
    end
  end

  describe "warehouse_variants" do
    alias Eshop.Companies.WarehouseVariant

    @valid_attrs %{name: "some name", native_name: "some native_name", type: 42}
    @update_attrs %{name: "some updated name", native_name: "some updated native_name", type: 43}
    @invalid_attrs %{name: nil, native_name: nil, type: nil}

    def warehouse_variant_fixture(attrs \\ %{}) do
      {:ok, warehouse_variant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Companies.create_warehouse_variant()

      warehouse_variant
    end

    test "list_warehouse_variants/0 returns all warehouse_variants" do
      warehouse_variant = warehouse_variant_fixture()
      assert Companies.list_warehouse_variants() == [warehouse_variant]
    end

    test "get_warehouse_variant!/1 returns the warehouse_variant with given id" do
      warehouse_variant = warehouse_variant_fixture()
      assert Companies.get_warehouse_variant!(warehouse_variant.id) == warehouse_variant
    end

    test "create_warehouse_variant/1 with valid data creates a warehouse_variant" do
      assert {:ok, %WarehouseVariant{} = warehouse_variant} = Companies.create_warehouse_variant(@valid_attrs)
      assert warehouse_variant.name == "some name"
      assert warehouse_variant.native_name == "some native_name"
      assert warehouse_variant.type == 42
    end

    test "create_warehouse_variant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companies.create_warehouse_variant(@invalid_attrs)
    end

    test "update_warehouse_variant/2 with valid data updates the warehouse_variant" do
      warehouse_variant = warehouse_variant_fixture()
      assert {:ok, %WarehouseVariant{} = warehouse_variant} = Companies.update_warehouse_variant(warehouse_variant, @update_attrs)
      assert warehouse_variant.name == "some updated name"
      assert warehouse_variant.native_name == "some updated native_name"
      assert warehouse_variant.type == 43
    end

    test "update_warehouse_variant/2 with invalid data returns error changeset" do
      warehouse_variant = warehouse_variant_fixture()
      assert {:error, %Ecto.Changeset{}} = Companies.update_warehouse_variant(warehouse_variant, @invalid_attrs)
      assert warehouse_variant == Companies.get_warehouse_variant!(warehouse_variant.id)
    end

    test "delete_warehouse_variant/1 deletes the warehouse_variant" do
      warehouse_variant = warehouse_variant_fixture()
      assert {:ok, %WarehouseVariant{}} = Companies.delete_warehouse_variant(warehouse_variant)
      assert_raise Ecto.NoResultsError, fn -> Companies.get_warehouse_variant!(warehouse_variant.id) end
    end

    test "change_warehouse_variant/1 returns a warehouse_variant changeset" do
      warehouse_variant = warehouse_variant_fixture()
      assert %Ecto.Changeset{} = Companies.change_warehouse_variant(warehouse_variant)
    end
  end

  describe "warehouse_variant_values" do
    alias Eshop.Companies.WarehouseVariantValue

    @valid_attrs %{native_value: "some native_value", value: "some value"}
    @update_attrs %{native_value: "some updated native_value", value: "some updated value"}
    @invalid_attrs %{native_value: nil, value: nil}

    def warehouse_variant_value_fixture(attrs \\ %{}) do
      {:ok, warehouse_variant_value} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Companies.create_warehouse_variant_value()

      warehouse_variant_value
    end

    test "list_warehouse_variant_values/0 returns all warehouse_variant_values" do
      warehouse_variant_value = warehouse_variant_value_fixture()
      assert Companies.list_warehouse_variant_values() == [warehouse_variant_value]
    end

    test "get_warehouse_variant_value!/1 returns the warehouse_variant_value with given id" do
      warehouse_variant_value = warehouse_variant_value_fixture()
      assert Companies.get_warehouse_variant_value!(warehouse_variant_value.id) == warehouse_variant_value
    end

    test "create_warehouse_variant_value/1 with valid data creates a warehouse_variant_value" do
      assert {:ok, %WarehouseVariantValue{} = warehouse_variant_value} = Companies.create_warehouse_variant_value(@valid_attrs)
      assert warehouse_variant_value.native_value == "some native_value"
      assert warehouse_variant_value.value == "some value"
    end

    test "create_warehouse_variant_value/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companies.create_warehouse_variant_value(@invalid_attrs)
    end

    test "update_warehouse_variant_value/2 with valid data updates the warehouse_variant_value" do
      warehouse_variant_value = warehouse_variant_value_fixture()
      assert {:ok, %WarehouseVariantValue{} = warehouse_variant_value} = Companies.update_warehouse_variant_value(warehouse_variant_value, @update_attrs)
      assert warehouse_variant_value.native_value == "some updated native_value"
      assert warehouse_variant_value.value == "some updated value"
    end

    test "update_warehouse_variant_value/2 with invalid data returns error changeset" do
      warehouse_variant_value = warehouse_variant_value_fixture()
      assert {:error, %Ecto.Changeset{}} = Companies.update_warehouse_variant_value(warehouse_variant_value, @invalid_attrs)
      assert warehouse_variant_value == Companies.get_warehouse_variant_value!(warehouse_variant_value.id)
    end

    test "delete_warehouse_variant_value/1 deletes the warehouse_variant_value" do
      warehouse_variant_value = warehouse_variant_value_fixture()
      assert {:ok, %WarehouseVariantValue{}} = Companies.delete_warehouse_variant_value(warehouse_variant_value)
      assert_raise Ecto.NoResultsError, fn -> Companies.get_warehouse_variant_value!(warehouse_variant_value.id) end
    end

    test "change_warehouse_variant_value/1 returns a warehouse_variant_value changeset" do
      warehouse_variant_value = warehouse_variant_value_fixture()
      assert %Ecto.Changeset{} = Companies.change_warehouse_variant_value(warehouse_variant_value)
    end
  end
end
