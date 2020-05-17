defmodule EshopWeb.BankingProviderControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Payments
  alias Eshop.Payments.BankingProvider

  @create_attrs %{
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

  def fixture(:banking_provider) do
    {:ok, banking_provider} = Payments.create_banking_provider(@create_attrs)
    banking_provider
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all banking_providers", %{conn: conn} do
      conn = get(conn, Routes.banking_provider_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create banking_provider" do
    test "renders banking_provider when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.banking_provider_path(conn, :create), banking_provider: @create_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.banking_provider_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_active" => true,
               "name" => "some name",
               "native_name" => "some native_name",
               "order" => 42,
               "type" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.banking_provider_path(conn, :create), banking_provider: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update banking_provider" do
    setup [:create_banking_provider]

    test "renders banking_provider when data is valid", %{
      conn: conn,
      banking_provider: %BankingProvider{id: id} = banking_provider
    } do
      conn =
        put(conn, Routes.banking_provider_path(conn, :update, banking_provider),
          banking_provider: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.banking_provider_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_active" => false,
               "name" => "some updated name",
               "native_name" => "some updated native_name",
               "order" => 43,
               "type" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, banking_provider: banking_provider} do
      conn =
        put(conn, Routes.banking_provider_path(conn, :update, banking_provider),
          banking_provider: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete banking_provider" do
    setup [:create_banking_provider]

    test "deletes chosen banking_provider", %{conn: conn, banking_provider: banking_provider} do
      conn = delete(conn, Routes.banking_provider_path(conn, :delete, banking_provider))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.banking_provider_path(conn, :show, banking_provider))
      end
    end
  end

  defp create_banking_provider(_) do
    banking_provider = fixture(:banking_provider)
    %{banking_provider: banking_provider}
  end
end
