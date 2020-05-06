defmodule Eshop.PaymentsTest do
  use Eshop.DataCase

  alias Eshop.Payments

  describe "banking_providers" do
    alias Eshop.Payments.BankingProvider

    @valid_attrs %{is_active: true, name: "some name", native_name: "some native_name", order: 42, type: 42}
    @update_attrs %{is_active: false, name: "some updated name", native_name: "some updated native_name", order: 43, type: 43}
    @invalid_attrs %{is_active: nil, name: nil, native_name: nil, order: nil, type: nil}

    def banking_provider_fixture(attrs \\ %{}) do
      {:ok, banking_provider} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Payments.create_banking_provider()

      banking_provider
    end

    test "list_banking_providers/0 returns all banking_providers" do
      banking_provider = banking_provider_fixture()
      assert Payments.list_banking_providers() == [banking_provider]
    end

    test "get_banking_provider!/1 returns the banking_provider with given id" do
      banking_provider = banking_provider_fixture()
      assert Payments.get_banking_provider!(banking_provider.id) == banking_provider
    end

    test "create_banking_provider/1 with valid data creates a banking_provider" do
      assert {:ok, %BankingProvider{} = banking_provider} = Payments.create_banking_provider(@valid_attrs)
      assert banking_provider.is_active == true
      assert banking_provider.name == "some name"
      assert banking_provider.native_name == "some native_name"
      assert banking_provider.order == 42
      assert banking_provider.type == 42
    end

    test "create_banking_provider/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_banking_provider(@invalid_attrs)
    end

    test "update_banking_provider/2 with valid data updates the banking_provider" do
      banking_provider = banking_provider_fixture()
      assert {:ok, %BankingProvider{} = banking_provider} = Payments.update_banking_provider(banking_provider, @update_attrs)
      assert banking_provider.is_active == false
      assert banking_provider.name == "some updated name"
      assert banking_provider.native_name == "some updated native_name"
      assert banking_provider.order == 43
      assert banking_provider.type == 43
    end

    test "update_banking_provider/2 with invalid data returns error changeset" do
      banking_provider = banking_provider_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_banking_provider(banking_provider, @invalid_attrs)
      assert banking_provider == Payments.get_banking_provider!(banking_provider.id)
    end

    test "delete_banking_provider/1 deletes the banking_provider" do
      banking_provider = banking_provider_fixture()
      assert {:ok, %BankingProvider{}} = Payments.delete_banking_provider(banking_provider)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_banking_provider!(banking_provider.id) end
    end

    test "change_banking_provider/1 returns a banking_provider changeset" do
      banking_provider = banking_provider_fixture()
      assert %Ecto.Changeset{} = Payments.change_banking_provider(banking_provider)
    end
  end

  describe "shop_payment_methods" do
    alias Eshop.Payments.ShopPaymentMethod

    @valid_attrs %{ac_holder_name: "some ac_holder_name", ac_no: 42, account_type: "some account_type", is_active: true}
    @update_attrs %{ac_holder_name: "some updated ac_holder_name", ac_no: 43, account_type: "some updated account_type", is_active: false}
    @invalid_attrs %{ac_holder_name: nil, ac_no: nil, account_type: nil, is_active: nil}

    def shop_payment_method_fixture(attrs \\ %{}) do
      {:ok, shop_payment_method} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Payments.create_shop_payment_method()

      shop_payment_method
    end

    test "list_shop_payment_methods/0 returns all shop_payment_methods" do
      shop_payment_method = shop_payment_method_fixture()
      assert Payments.list_shop_payment_methods() == [shop_payment_method]
    end

    test "get_shop_payment_method!/1 returns the shop_payment_method with given id" do
      shop_payment_method = shop_payment_method_fixture()
      assert Payments.get_shop_payment_method!(shop_payment_method.id) == shop_payment_method
    end

    test "create_shop_payment_method/1 with valid data creates a shop_payment_method" do
      assert {:ok, %ShopPaymentMethod{} = shop_payment_method} = Payments.create_shop_payment_method(@valid_attrs)
      assert shop_payment_method.ac_holder_name == "some ac_holder_name"
      assert shop_payment_method.ac_no == 42
      assert shop_payment_method.account_type == "some account_type"
      assert shop_payment_method.is_active == true
    end

    test "create_shop_payment_method/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_shop_payment_method(@invalid_attrs)
    end

    test "update_shop_payment_method/2 with valid data updates the shop_payment_method" do
      shop_payment_method = shop_payment_method_fixture()
      assert {:ok, %ShopPaymentMethod{} = shop_payment_method} = Payments.update_shop_payment_method(shop_payment_method, @update_attrs)
      assert shop_payment_method.ac_holder_name == "some updated ac_holder_name"
      assert shop_payment_method.ac_no == 43
      assert shop_payment_method.account_type == "some updated account_type"
      assert shop_payment_method.is_active == false
    end

    test "update_shop_payment_method/2 with invalid data returns error changeset" do
      shop_payment_method = shop_payment_method_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_shop_payment_method(shop_payment_method, @invalid_attrs)
      assert shop_payment_method == Payments.get_shop_payment_method!(shop_payment_method.id)
    end

    test "delete_shop_payment_method/1 deletes the shop_payment_method" do
      shop_payment_method = shop_payment_method_fixture()
      assert {:ok, %ShopPaymentMethod{}} = Payments.delete_shop_payment_method(shop_payment_method)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_shop_payment_method!(shop_payment_method.id) end
    end

    test "change_shop_payment_method/1 returns a shop_payment_method changeset" do
      shop_payment_method = shop_payment_method_fixture()
      assert %Ecto.Changeset{} = Payments.change_shop_payment_method(shop_payment_method)
    end
  end
end
