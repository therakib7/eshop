defmodule EshopWeb.GuaranteeView do
  use EshopWeb, :view
  alias EshopWeb.GuaranteeView

  def render("index.json", %{guarantees: guarantees}) do
    %{data: render_many(guarantees, GuaranteeView, "guarantee.json")}
  end

  def render("show.json", %{guarantee: guarantee}) do
    %{data: render_one(guarantee, GuaranteeView, "guarantee.json")}
  end

  def render("guarantee.json", %{guarantee: guarantee}) do
    %{
      id: guarantee.id,
      content: guarantee.content,
      native_content: guarantee.native_content,
      duration: guarantee.duration,
      gurantee_type: guarantee.gurantee_type
    }
  end
end
