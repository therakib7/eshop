defmodule Eshop.Conditions.PrivacyPolicy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "privacy_policies" do
    field :content, :string
    field :native_content, :string
    belongs_to :shop, Eshop.Companies.Shop

    timestamps()
  end

  @doc false
  def changeset(privacy_policy, attrs) do
    privacy_policy
    |> cast(attrs, [:content, :native_content])
    |> validate_required([:content, :native_content])
    |> validate_length(:content, min: 2, max: 5000)
    |> validate_length(:native_content, min: 2, max: 5000)
  end
end
