defmodule EshopWeb.Schema.Resolvers.Faq do

    def list_faqs(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_faqs()}
    end

end
