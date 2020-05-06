defmodule Eshop.ShipmentsTest do
  use Eshop.DataCase

  alias Eshop.Shipments

  describe "shipping_methods" do
    alias Eshop.Shipments.ShippingMethod

    @valid_attrs %{is_active: true, name: "some name", native_name: "some native_name"}
    @update_attrs %{is_active: false, name: "some updated name", native_name: "some updated native_name"}
    @invalid_attrs %{is_active: nil, name: nil, native_name: nil}

    def shipping_method_fixture(attrs \\ %{}) do
      {:ok, shipping_method} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shipments.create_shipping_method()

      shipping_method
    end

    test "list_shipping_methods/0 returns all shipping_methods" do
      shipping_method = shipping_method_fixture()
      assert Shipments.list_shipping_methods() == [shipping_method]
    end

    test "get_shipping_method!/1 returns the shipping_method with given id" do
      shipping_method = shipping_method_fixture()
      assert Shipments.get_shipping_method!(shipping_method.id) == shipping_method
    end

    test "create_shipping_method/1 with valid data creates a shipping_method" do
      assert {:ok, %ShippingMethod{} = shipping_method} = Shipments.create_shipping_method(@valid_attrs)
      assert shipping_method.is_active == true
      assert shipping_method.name == "some name"
      assert shipping_method.native_name == "some native_name"
    end

    test "create_shipping_method/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shipments.create_shipping_method(@invalid_attrs)
    end

    test "update_shipping_method/2 with valid data updates the shipping_method" do
      shipping_method = shipping_method_fixture()
      assert {:ok, %ShippingMethod{} = shipping_method} = Shipments.update_shipping_method(shipping_method, @update_attrs)
      assert shipping_method.is_active == false
      assert shipping_method.name == "some updated name"
      assert shipping_method.native_name == "some updated native_name"
    end

    test "update_shipping_method/2 with invalid data returns error changeset" do
      shipping_method = shipping_method_fixture()
      assert {:error, %Ecto.Changeset{}} = Shipments.update_shipping_method(shipping_method, @invalid_attrs)
      assert shipping_method == Shipments.get_shipping_method!(shipping_method.id)
    end

    test "delete_shipping_method/1 deletes the shipping_method" do
      shipping_method = shipping_method_fixture()
      assert {:ok, %ShippingMethod{}} = Shipments.delete_shipping_method(shipping_method)
      assert_raise Ecto.NoResultsError, fn -> Shipments.get_shipping_method!(shipping_method.id) end
    end

    test "change_shipping_method/1 returns a shipping_method changeset" do
      shipping_method = shipping_method_fixture()
      assert %Ecto.Changeset{} = Shipments.change_shipping_method(shipping_method)
    end
  end

  describe "shop_shipping_methods" do
    alias Eshop.Shipments.ShopShippingMethod

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def shop_shipping_method_fixture(attrs \\ %{}) do
      {:ok, shop_shipping_method} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shipments.create_shop_shipping_method()

      shop_shipping_method
    end

    test "list_shop_shipping_methods/0 returns all shop_shipping_methods" do
      shop_shipping_method = shop_shipping_method_fixture()
      assert Shipments.list_shop_shipping_methods() == [shop_shipping_method]
    end

    test "get_shop_shipping_method!/1 returns the shop_shipping_method with given id" do
      shop_shipping_method = shop_shipping_method_fixture()
      assert Shipments.get_shop_shipping_method!(shop_shipping_method.id) == shop_shipping_method
    end

    test "create_shop_shipping_method/1 with valid data creates a shop_shipping_method" do
      assert {:ok, %ShopShippingMethod{} = shop_shipping_method} = Shipments.create_shop_shipping_method(@valid_attrs)
    end

    test "create_shop_shipping_method/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shipments.create_shop_shipping_method(@invalid_attrs)
    end

    test "update_shop_shipping_method/2 with valid data updates the shop_shipping_method" do
      shop_shipping_method = shop_shipping_method_fixture()
      assert {:ok, %ShopShippingMethod{} = shop_shipping_method} = Shipments.update_shop_shipping_method(shop_shipping_method, @update_attrs)
    end

    test "update_shop_shipping_method/2 with invalid data returns error changeset" do
      shop_shipping_method = shop_shipping_method_fixture()
      assert {:error, %Ecto.Changeset{}} = Shipments.update_shop_shipping_method(shop_shipping_method, @invalid_attrs)
      assert shop_shipping_method == Shipments.get_shop_shipping_method!(shop_shipping_method.id)
    end

    test "delete_shop_shipping_method/1 deletes the shop_shipping_method" do
      shop_shipping_method = shop_shipping_method_fixture()
      assert {:ok, %ShopShippingMethod{}} = Shipments.delete_shop_shipping_method(shop_shipping_method)
      assert_raise Ecto.NoResultsError, fn -> Shipments.get_shop_shipping_method!(shop_shipping_method.id) end
    end

    test "change_shop_shipping_method/1 returns a shop_shipping_method changeset" do
      shop_shipping_method = shop_shipping_method_fixture()
      assert %Ecto.Changeset{} = Shipments.change_shop_shipping_method(shop_shipping_method)
    end
  end

  describe "shipping_addresses" do
    alias Eshop.Shipments.ShippingAddress

    @valid_attrs %{address: "some address", lat: 120.5, long: 120.5}
    @update_attrs %{address: "some updated address", lat: 456.7, long: 456.7}
    @invalid_attrs %{address: nil, lat: nil, long: nil}

    def shipping_address_fixture(attrs \\ %{}) do
      {:ok, shipping_address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shipments.create_shipping_address()

      shipping_address
    end

    test "list_shipping_addresses/0 returns all shipping_addresses" do
      shipping_address = shipping_address_fixture()
      assert Shipments.list_shipping_addresses() == [shipping_address]
    end

    test "get_shipping_address!/1 returns the shipping_address with given id" do
      shipping_address = shipping_address_fixture()
      assert Shipments.get_shipping_address!(shipping_address.id) == shipping_address
    end

    test "create_shipping_address/1 with valid data creates a shipping_address" do
      assert {:ok, %ShippingAddress{} = shipping_address} = Shipments.create_shipping_address(@valid_attrs)
      assert shipping_address.address == "some address"
      assert shipping_address.lat == 120.5
      assert shipping_address.long == 120.5
    end

    test "create_shipping_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shipments.create_shipping_address(@invalid_attrs)
    end

    test "update_shipping_address/2 with valid data updates the shipping_address" do
      shipping_address = shipping_address_fixture()
      assert {:ok, %ShippingAddress{} = shipping_address} = Shipments.update_shipping_address(shipping_address, @update_attrs)
      assert shipping_address.address == "some updated address"
      assert shipping_address.lat == 456.7
      assert shipping_address.long == 456.7
    end

    test "update_shipping_address/2 with invalid data returns error changeset" do
      shipping_address = shipping_address_fixture()
      assert {:error, %Ecto.Changeset{}} = Shipments.update_shipping_address(shipping_address, @invalid_attrs)
      assert shipping_address == Shipments.get_shipping_address!(shipping_address.id)
    end

    test "delete_shipping_address/1 deletes the shipping_address" do
      shipping_address = shipping_address_fixture()
      assert {:ok, %ShippingAddress{}} = Shipments.delete_shipping_address(shipping_address)
      assert_raise Ecto.NoResultsError, fn -> Shipments.get_shipping_address!(shipping_address.id) end
    end

    test "change_shipping_address/1 returns a shipping_address changeset" do
      shipping_address = shipping_address_fixture()
      assert %Ecto.Changeset{} = Shipments.change_shipping_address(shipping_address)
    end
  end

  describe "tracking_invoices" do
    alias Eshop.Shipments.TrackingInvoice

    @valid_attrs %{tracking_id: "some tracking_id"}
    @update_attrs %{tracking_id: "some updated tracking_id"}
    @invalid_attrs %{tracking_id: nil}

    def tracking_invoice_fixture(attrs \\ %{}) do
      {:ok, tracking_invoice} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shipments.create_tracking_invoice()

      tracking_invoice
    end

    test "list_tracking_invoices/0 returns all tracking_invoices" do
      tracking_invoice = tracking_invoice_fixture()
      assert Shipments.list_tracking_invoices() == [tracking_invoice]
    end

    test "get_tracking_invoice!/1 returns the tracking_invoice with given id" do
      tracking_invoice = tracking_invoice_fixture()
      assert Shipments.get_tracking_invoice!(tracking_invoice.id) == tracking_invoice
    end

    test "create_tracking_invoice/1 with valid data creates a tracking_invoice" do
      assert {:ok, %TrackingInvoice{} = tracking_invoice} = Shipments.create_tracking_invoice(@valid_attrs)
      assert tracking_invoice.tracking_id == "some tracking_id"
    end

    test "create_tracking_invoice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shipments.create_tracking_invoice(@invalid_attrs)
    end

    test "update_tracking_invoice/2 with valid data updates the tracking_invoice" do
      tracking_invoice = tracking_invoice_fixture()
      assert {:ok, %TrackingInvoice{} = tracking_invoice} = Shipments.update_tracking_invoice(tracking_invoice, @update_attrs)
      assert tracking_invoice.tracking_id == "some updated tracking_id"
    end

    test "update_tracking_invoice/2 with invalid data returns error changeset" do
      tracking_invoice = tracking_invoice_fixture()
      assert {:error, %Ecto.Changeset{}} = Shipments.update_tracking_invoice(tracking_invoice, @invalid_attrs)
      assert tracking_invoice == Shipments.get_tracking_invoice!(tracking_invoice.id)
    end

    test "delete_tracking_invoice/1 deletes the tracking_invoice" do
      tracking_invoice = tracking_invoice_fixture()
      assert {:ok, %TrackingInvoice{}} = Shipments.delete_tracking_invoice(tracking_invoice)
      assert_raise Ecto.NoResultsError, fn -> Shipments.get_tracking_invoice!(tracking_invoice.id) end
    end

    test "change_tracking_invoice/1 returns a tracking_invoice changeset" do
      tracking_invoice = tracking_invoice_fixture()
      assert %Ecto.Changeset{} = Shipments.change_tracking_invoice(tracking_invoice)
    end
  end
end
