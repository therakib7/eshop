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
    belongs_to :company, Eshop.Companies.Company 
    belongs_to :user, Eshop.Users.User
    belongs_to :location, Eshop.Geo.Location
    belongs_to :attachment, Eshop.Attachments.Attachment
    belongs_to :term_condition, Eshop.Conditions.TermCondition 

    timestamps()
  end

  @doc false
  def changeset(shop, attrs) do
    shop
    |> cast(attrs, [:is_active, :is_verifed, :name, :native_name, :trade_assurance, :highest_assurance, :golden_supplier, :created_at])
    |> validate_required([:is_active, :is_verifed, :name, :native_name, :trade_assurance, :highest_assurance, :golden_supplier, :created_at])
    |> validate_length(:name, min: 2, max: 200)
    |> validate_length(:native_name, min: 2, max: 200)
  end
end
