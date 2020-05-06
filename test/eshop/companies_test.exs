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
end
