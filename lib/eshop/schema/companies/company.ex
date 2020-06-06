defmodule Eshop.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :created_at, :utc_datetime
    field :golden_supplier, :boolean, default: false
    field :highest_assurance, :decimal
    field :is_active, :boolean, default: false
    field :is_verifed, :boolean, default: false
    field :name, :string
    field :trade_assurance, :boolean, default: false
    belongs_to :user, Eshop.Users.User
    belongs_to :location, Eshop.Geo.Location
    belongs_to :attachment, Eshop.Attachments.Attachment
    belongs_to :term_condition, Eshop.Conditions.TermCondition

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [
      :is_active,
      :is_verifed,
      :name,
      :trade_assurance,
      :highest_assurance,
      :golden_supplier,
      :created_at
    ])
    |> validate_required([ 
      :name, 
    ])
    |> validate_length(:name, min: 2, max: 200)
  end
end
