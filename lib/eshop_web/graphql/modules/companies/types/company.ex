defmodule EshopWeb.Schema.Types.Company do
  use Absinthe.Schema.Notation

  @desc "A company"
  object :company do
    field :id, :integer
    field :created_at, :datetime
    field :golden_supplier, :boolean
    field :highest_assurance, :decimal
    field :is_active, :boolean
    field :is_verifed, :boolean
    field :name, :string
    field :trade_assurance, :boolean
    field :user_id, :id
    field :location_id, :id
    field :attachment_id, :id
    field :term_condition_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A company update"
  input_object :company_params do
    field :created_at, :datetime
    field :golden_supplier, :boolean
    field :highest_assurance, :decimal
    field :is_active, :boolean
    field :is_verifed, :boolean
    field :name, :string
    field :trade_assurance, :boolean
    field :user_id, :id
    field :location_id, :id
    field :attachment_id, :id
    field :term_condition_id, :id
  end
end
