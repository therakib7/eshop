defmodule EshopWeb.DiscountCodeController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.DiscountCode

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    discount_codes = Components.list_discount_codes()
    render(conn, "index.json", discount_codes: discount_codes)
  end

  def create(conn, %{"discount_code" => discount_code_params}) do
    with {:ok, %DiscountCode{} = discount_code} <- Components.create_discount_code(discount_code_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.discount_code_path(conn, :show, discount_code))
      |> render("show.json", discount_code: discount_code)
    end
  end

  def show(conn, %{"id" => id}) do
    discount_code = Components.get_discount_code!(id)
    render(conn, "show.json", discount_code: discount_code)
  end

  def update(conn, %{"id" => id, "discount_code" => discount_code_params}) do
    discount_code = Components.get_discount_code!(id)

    with {:ok, %DiscountCode{} = discount_code} <- Components.update_discount_code(discount_code, discount_code_params) do
      render(conn, "show.json", discount_code: discount_code)
    end
  end

  def delete(conn, %{"id" => id}) do
    discount_code = Components.get_discount_code!(id)

    with {:ok, %DiscountCode{}} <- Components.delete_discount_code(discount_code) do
      send_resp(conn, :no_content, "")
    end
  end
end
