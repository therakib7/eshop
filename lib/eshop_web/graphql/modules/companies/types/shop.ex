defmodule EshopWeb.Schema.Types.Shop do
  use Absinthe.Schema.Notation

  @desc "A shop"
  object :shop do
    field :id, :integer
    field :created_at, :datetime
    field :golden_supplier, :boolean
    field :highest_assurance, :decimal
    field :is_active, :boolean
    field :is_verifed, :boolean
    field :name, :string
    field :native_name, :string
    field :trade_assurance, :boolean
    field :company_id, :integer
    field :user_id, :integer
    field :location_id, :integer
    field :attachment_id, :integer
    field :term_condition_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A shop update"
  input_object :shop_params do
    field :created_at, :datetime
    field :golden_supplier, :boolean
    field :highest_assurance, :decimal
    field :is_active, :boolean
    field :is_verifed, :boolean
    field :name, :string
    field :native_name, :string
    field :trade_assurance, :boolean
    field :company_id, :integer
    field :user_id, :integer
    field :location_id, :integer
    field :attachment_id, :integer
    field :term_condition_id, :integer
  end
end
