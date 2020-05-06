defmodule EshopWeb.PrivacyPolicyView do
  use EshopWeb, :view
  alias EshopWeb.PrivacyPolicyView

  def render("index.json", %{privacy_policies: privacy_policies}) do
    %{data: render_many(privacy_policies, PrivacyPolicyView, "privacy_policy.json")}
  end

  def render("show.json", %{privacy_policy: privacy_policy}) do
    %{data: render_one(privacy_policy, PrivacyPolicyView, "privacy_policy.json")}
  end

  def render("privacy_policy.json", %{privacy_policy: privacy_policy}) do
    %{id: privacy_policy.id,
      content: privacy_policy.content,
      native_content: privacy_policy.native_content}
  end
end
