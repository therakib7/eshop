defmodule EshopWeb.Schema.Queries.Faq do
  use Absinthe.Schema.Notation
  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.Faq, as: Faq

  object :faq_queries do
    @desc "Get all faqs"
    field :faqs, list_of(:faq) do
      resolve(&Faq.list_faqs/3)
    end

    @desc "Get a faq by its id"
    field :faq, :faq do
      arg(:id, non_null(:id))
      resolve(&Faq.get_faq/3)
    end
  end
end
