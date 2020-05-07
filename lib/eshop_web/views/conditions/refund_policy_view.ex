defmodule EshopWeb.RefundPolicyView do
  use EshopWeb, :view
  alias EshopWeb.RefundPolicyView

  def render("index.json", %{refund_policies: refund_policies}) do
    %{data: render_many(refund_policies, RefundPolicyView, "refund_policy.json")}
  end

  def render("show.json", %{refund_policy: refund_policy}) do
    %{data: render_one(refund_policy, RefundPolicyView, "refund_policy.json")}
  end

  def render("refund_policy.json", %{refund_policy: refund_policy}) do
    %{id: refund_policy.id,
      type: refund_policy.type,
      type_id: refund_policy.type_id,
      content: refund_policy.content,
      native_content: refund_policy.native_content}
  end
end
