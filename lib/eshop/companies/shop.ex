defmodule Eshop.Companies.Shop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shops" do
    field :created_at, :utc_datetime
    field :golden_supplier, :boolean, default: false
    field :highest_assurance, :decimal
    field :is_active, :boolean, default: false
    field :is_verifed, :boolean, default: false
    field :name, :string
    field :native_name, :string
    field :trade_assurance, :boolean, default: false
    field :company_id, :id
    field :user_id, :id
    field :location_id, :id
    field :attachment_id, :id
    field :term_condition_id, :id

    timestamps()
  end

  @doc false
  def changeset(shop, attrs) do
    shop
    |> cast(attrs, [:is_active, :is_verifed, :name, :native_name, :trade_assurance, :highest_assurance, :golden_supplier, :created_at])
    |> validate_required([:is_active, :is_verifed, :name, :native_name, :trade_assurance, :highest_assurance, :golden_supplier, :created_at])
  end
end
