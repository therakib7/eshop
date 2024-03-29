defmodule EshopWeb.Schema.Mutations.Faq do
  use Absinthe.Schema.Notation

  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.Faq, as: Faq

  object :faq_mutations do
    @desc "Create a faq"
    field :create_faq, type: :faq do
      middleware(Auth, %{per: "product_create", context: "components", model: "faq"})
      arg(:answer, :string)
      arg(:native_answer, :string)
      arg(:native_question, :string)
      arg(:question, :string)
      arg(:item_id, :integer)
      arg(:user_id, :integer)

      resolve(&Faq.create_faq/3)
    end

    @desc "Update a faq"
    field :update_faq, type: :faq do
      arg(:id, non_null(:id))
      arg(:faq_params, :faq_params)

      resolve(&Faq.update_faq/2)
    end

    @desc "Delete a faq"
    field :delete_faq, type: :faq do
      arg(:id, non_null(:id))
      resolve(&Faq.delete_faq/2)
    end
  end
end
