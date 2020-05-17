defmodule EshopWeb.CountryStageControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Geo
  alias Eshop.Geo.CountryStage

  @create_attrs %{
    country_id: 42,
    name: "some name",
    native_name: "some native_name",
    stage: 42,
    user_id: 42
  }
  @update_attrs %{
    country_id: 43,
    name: "some updated name",
    native_name: "some updated native_name",
    stage: 43,
    user_id: 43
  }
  @invalid_attrs %{country_id: nil, name: nil, native_name: nil, stage: nil, user_id: nil}

  def fixture(:country_stage) do
    {:ok, country_stage} = Geo.create_country_stage(@create_attrs)
    country_stage
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all country_stages", %{conn: conn} do
      conn = get(conn, Routes.country_stage_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create country_stage" do
    test "renders country_stage when data is valid", %{conn: conn} do
      conn = post(conn, Routes.country_stage_path(conn, :create), country_stage: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.country_stage_path(conn, :show, id))

      assert %{
               "id" => id,
               "country_id" => 42,
               "name" => "some name",
               "native_name" => "some native_name",
               "stage" => 42,
               "user_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.country_stage_path(conn, :create), country_stage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update country_stage" do
    setup [:create_country_stage]

    test "renders country_stage when data is valid", %{
      conn: conn,
      country_stage: %CountryStage{id: id} = country_stage
    } do
      conn =
        put(conn, Routes.country_stage_path(conn, :update, country_stage),
          country_stage: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.country_stage_path(conn, :show, id))

      assert %{
               "id" => id,
               "country_id" => 43,
               "name" => "some updated name",
               "native_name" => "some updated native_name",
               "stage" => 43,
               "user_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, country_stage: country_stage} do
      conn =
        put(conn, Routes.country_stage_path(conn, :update, country_stage),
          country_stage: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete country_stage" do
    setup [:create_country_stage]

    test "deletes chosen country_stage", %{conn: conn, country_stage: country_stage} do
      conn = delete(conn, Routes.country_stage_path(conn, :delete, country_stage))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.country_stage_path(conn, :show, country_stage))
      end
    end
  end

  defp create_country_stage(_) do
    country_stage = fixture(:country_stage)
    %{country_stage: country_stage}
  end
end
