defmodule Eshop.OrdersTest do
  use Eshop.DataCase

  alias Eshop.Orders

  describe "invoices" do
    alias Eshop.Orders.Invoice

    @valid_attrs %{discount: "120.5", note: "some note", paid: "120.5", total: "120.5", type: 42}
    @update_attrs %{
      discount: "456.7",
      note: "some updated note",
      paid: "456.7",
      total: "456.7",
      type: 43
    }
    @invalid_attrs %{discount: nil, note: nil, paid: nil, total: nil, type: nil}

    def invoice_fixture(attrs \\ %{}) do
      {:ok, invoice} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_invoice()

      invoice
    end

    test "list_invoices/0 returns all invoices" do
      invoice = invoice_fixture()
      assert Orders.list_invoices() == [invoice]
    end

    test "get_invoice!/1 returns the invoice with given id" do
      invoice = invoice_fixture()
      assert Orders.get_invoice!(invoice.id) == invoice
    end

    test "create_invoice/1 with valid data creates a invoice" do
      assert {:ok, %Invoice{} = invoice} = Orders.create_invoice(@valid_attrs)
      assert invoice.discount == Decimal.new("120.5")
      assert invoice.note == "some note"
      assert invoice.paid == Decimal.new("120.5")
      assert invoice.total == Decimal.new("120.5")
      assert invoice.type == 42
    end

    test "create_invoice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_invoice(@invalid_attrs)
    end

    test "update_invoice/2 with valid data updates the invoice" do
      invoice = invoice_fixture()
      assert {:ok, %Invoice{} = invoice} = Orders.update_invoice(invoice, @update_attrs)
      assert invoice.discount == Decimal.new("456.7")
      assert invoice.note == "some updated note"
      assert invoice.paid == Decimal.new("456.7")
      assert invoice.total == Decimal.new("456.7")
      assert invoice.type == 43
    end

    test "update_invoice/2 with invalid data returns error changeset" do
      invoice = invoice_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_invoice(invoice, @invalid_attrs)
      assert invoice == Orders.get_invoice!(invoice.id)
    end

    test "delete_invoice/1 deletes the invoice" do
      invoice = invoice_fixture()
      assert {:ok, %Invoice{}} = Orders.delete_invoice(invoice)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_invoice!(invoice.id) end
    end

    test "change_invoice/1 returns a invoice changeset" do
      invoice = invoice_fixture()
      assert %Ecto.Changeset{} = Orders.change_invoice(invoice)
    end
  end

  describe "invoice_items" do
    alias Eshop.Orders.InvoiceItem

    @valid_attrs %{
      price: "120.5",
      qty: 42,
      shipping_charge: "120.5",
      status: 42,
      vat: "120.5",
      vat_type: 42
    }
    @update_attrs %{
      price: "456.7",
      qty: 43,
      shipping_charge: "456.7",
      status: 43,
      vat: "456.7",
      vat_type: 43
    }
    @invalid_attrs %{
      price: nil,
      qty: nil,
      shipping_charge: nil,
      status: nil,
      vat: nil,
      vat_type: nil
    }

    def invoice_item_fixture(attrs \\ %{}) do
      {:ok, invoice_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_invoice_item()

      invoice_item
    end

    test "list_invoice_items/0 returns all invoice_items" do
      invoice_item = invoice_item_fixture()
      assert Orders.list_invoice_items() == [invoice_item]
    end

    test "get_invoice_item!/1 returns the invoice_item with given id" do
      invoice_item = invoice_item_fixture()
      assert Orders.get_invoice_item!(invoice_item.id) == invoice_item
    end

    test "create_invoice_item/1 with valid data creates a invoice_item" do
      assert {:ok, %InvoiceItem{} = invoice_item} = Orders.create_invoice_item(@valid_attrs)
      assert invoice_item.price == Decimal.new("120.5")
      assert invoice_item.qty == 42
      assert invoice_item.shipping_charge == Decimal.new("120.5")
      assert invoice_item.status == 42
      assert invoice_item.vat == Decimal.new("120.5")
      assert invoice_item.vat_type == 42
    end

    test "create_invoice_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_invoice_item(@invalid_attrs)
    end

    test "update_invoice_item/2 with valid data updates the invoice_item" do
      invoice_item = invoice_item_fixture()

      assert {:ok, %InvoiceItem{} = invoice_item} =
               Orders.update_invoice_item(invoice_item, @update_attrs)

      assert invoice_item.price == Decimal.new("456.7")
      assert invoice_item.qty == 43
      assert invoice_item.shipping_charge == Decimal.new("456.7")
      assert invoice_item.status == 43
      assert invoice_item.vat == Decimal.new("456.7")
      assert invoice_item.vat_type == 43
    end

    test "update_invoice_item/2 with invalid data returns error changeset" do
      invoice_item = invoice_item_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Orders.update_invoice_item(invoice_item, @invalid_attrs)

      assert invoice_item == Orders.get_invoice_item!(invoice_item.id)
    end

    test "delete_invoice_item/1 deletes the invoice_item" do
      invoice_item = invoice_item_fixture()
      assert {:ok, %InvoiceItem{}} = Orders.delete_invoice_item(invoice_item)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_invoice_item!(invoice_item.id) end
    end

    test "change_invoice_item/1 returns a invoice_item changeset" do
      invoice_item = invoice_item_fixture()
      assert %Ecto.Changeset{} = Orders.change_invoice_item(invoice_item)
    end
  end

  describe "invoice_item_variants" do
    alias Eshop.Orders.InvoiceItemVariant

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def invoice_item_variant_fixture(attrs \\ %{}) do
      {:ok, invoice_item_variant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_invoice_item_variant()

      invoice_item_variant
    end

    test "list_invoice_item_variants/0 returns all invoice_item_variants" do
      invoice_item_variant = invoice_item_variant_fixture()
      assert Orders.list_invoice_item_variants() == [invoice_item_variant]
    end

    test "get_invoice_item_variant!/1 returns the invoice_item_variant with given id" do
      invoice_item_variant = invoice_item_variant_fixture()
      assert Orders.get_invoice_item_variant!(invoice_item_variant.id) == invoice_item_variant
    end

    test "create_invoice_item_variant/1 with valid data creates a invoice_item_variant" do
      assert {:ok, %InvoiceItemVariant{} = invoice_item_variant} =
               Orders.create_invoice_item_variant(@valid_attrs)
    end

    test "create_invoice_item_variant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_invoice_item_variant(@invalid_attrs)
    end

    test "update_invoice_item_variant/2 with valid data updates the invoice_item_variant" do
      invoice_item_variant = invoice_item_variant_fixture()

      assert {:ok, %InvoiceItemVariant{} = invoice_item_variant} =
               Orders.update_invoice_item_variant(invoice_item_variant, @update_attrs)
    end

    test "update_invoice_item_variant/2 with invalid data returns error changeset" do
      invoice_item_variant = invoice_item_variant_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Orders.update_invoice_item_variant(invoice_item_variant, @invalid_attrs)

      assert invoice_item_variant == Orders.get_invoice_item_variant!(invoice_item_variant.id)
    end

    test "delete_invoice_item_variant/1 deletes the invoice_item_variant" do
      invoice_item_variant = invoice_item_variant_fixture()

      assert {:ok, %InvoiceItemVariant{}} =
               Orders.delete_invoice_item_variant(invoice_item_variant)

      assert_raise Ecto.NoResultsError, fn ->
        Orders.get_invoice_item_variant!(invoice_item_variant.id)
      end
    end

    test "change_invoice_item_variant/1 returns a invoice_item_variant changeset" do
      invoice_item_variant = invoice_item_variant_fixture()
      assert %Ecto.Changeset{} = Orders.change_invoice_item_variant(invoice_item_variant)
    end
  end
end
