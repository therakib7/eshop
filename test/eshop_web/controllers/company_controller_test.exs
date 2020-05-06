defmodule EshopWeb.CompanyControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Companies
  alias Eshop.Companies.Company

  @create_attrs %{
    created_at: "2010-04-17T14:00:00Z",
    golden_supplier: true,
    highest_assurance: "120.5",
    is_active: true,
    is_verifed: true,
    name: "some name",
    trade_assurance: true
  }
  @update_attrs %{
    created_at: "2011-05-18T15:01:01Z",
    golden_supplier: false,
    highest_assurance: "456.7",
    is_active: false,
    is_verifed: false,
    name: "some updated name",
    trade_assurance: false
  }
  @invalid_attrs %{created_at: nil, golden_supplier: nil, highest_assurance: nil, is_active: nil, is_verifed: nil, name: nil, trade_assurance: nil}

  def fixture(:company) do
    {:ok, company} = Companies.create_company(@create_attrs)
    company
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all companies", %{conn: conn} do
      conn = get(conn, Routes.company_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create company" do
    test "renders company when data is valid", %{conn: conn} do
      conn = post(conn, Routes.company_path(conn, :create), company: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.company_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2010-04-17T14:00:00Z",
               "golden_supplier" => true,
               "highest_assurance" => "120.5",
               "is_active" => true,
               "is_verifed" => true,
               "name" => "some name",
               "trade_assurance" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.company_path(conn, :create), company: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update company" do
    setup [:create_company]

    test "renders company when data is valid", %{conn: conn, company: %Company{id: id} = company} do
      conn = put(conn, Routes.company_path(conn, :update, company), company: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.company_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2011-05-18T15:01:01Z",
               "golden_supplier" => false,
               "highest_assurance" => "456.7",
               "is_active" => false,
               "is_verifed" => false,
               "name" => "some updated name",
               "trade_assurance" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, company: company} do
      conn = put(conn, Routes.company_path(conn, :update, company), company: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete company" do
    setup [:create_company]

    test "deletes chosen company", %{conn: conn, company: company} do
      conn = delete(conn, Routes.company_path(conn, :delete, company))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.company_path(conn, :show, company))
      end
    end
  end

  defp create_company(_) do
    company = fixture(:company)
    %{company: company}
  end
end
