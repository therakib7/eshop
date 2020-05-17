defmodule EshopWeb.DiscountCodeView do
  use EshopWeb, :view
  alias EshopWeb.DiscountCodeView

  def render("index.json", %{discount_codes: discount_codes}) do
    %{data: render_many(discount_codes, DiscountCodeView, "discount_code.json")}
  end

  def render("show.json", %{discount_code: discount_code}) do
    %{data: render_one(discount_code, DiscountCodeView, "discount_code.json")}
  end

  def render("discount_code.json", %{discount_code: discount_code}) do
    %{
      id: discount_code.id,
      is_active: discount_code.is_active,
      code: discount_code.code,
      amount: discount_code.amount,
      validity: discount_code.validity,
      created_at: discount_code.created_at,
      used_at: discount_code.used_at
    }
  end
end
