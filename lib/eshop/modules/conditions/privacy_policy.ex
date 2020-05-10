defmodule Eshop.Conditions.PrivacyPolicy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "privacy_policies" do
    field :content, :string
    field :native_content, :string
    field :shop_id, :id

    timestamps()
  end

  @doc false
  def changeset(privacy_policy, attrs) do
    privacy_policy
    |> cast(attrs, [:content, :native_content])
    |> validate_required([:content, :native_content])
  end
end
