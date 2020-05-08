defmodule EshopWeb.Schema.Types.TermCondition do
  use Absinthe.Schema.Notation
  
  object "term_condition" do
    field :id, :integer
    field :content, :string
    field :native_content, :string
    field :type, :integer
    field :type_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
