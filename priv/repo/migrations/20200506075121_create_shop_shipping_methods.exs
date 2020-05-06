defmodule Eshop.Repo.Migrations.CreateShopShippingMethods do
  use Ecto.Migration

  def change do
    create table(:shop_shipping_methods) do
      add :shipping_method_id, references(:shipping_methods, on_delete: :nothing)
      add :shop_id, references(:shops, on_delete: :nothing)

      timestamps()
    end

    create index(:shop_shipping_methods, [:shipping_method_id])
    create index(:shop_shipping_methods, [:shop_id])
  end
end
