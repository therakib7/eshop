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
    field :user_id, :integer
    field :location_id, :integer
    field :attachment_id, :integer
    field :term_condition_id, :integer
    # field :inserted_at, :naive_datetime
    # field :updated_at, :naive_datetime
  end

  @desc "A company update"
  input_object :company_params do
    field :golden_supplier, :boolean
    field :highest_assurance, :decimal
    field :is_active, :boolean
    field :is_verifed, :boolean
    field :name, :string
    field :trade_assurance, :boolean
    field :location_id, :integer
    field :attachment_id, :integer
    field :term_condition_id, :integer
  end
end
