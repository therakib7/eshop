defmodule Eshop.Repo.Migrations.CreateShippingAddresses do
  use Ecto.Migration

  def change do
    create table(:shipping_addresses) do
      add :lat, :float, null: true, size: 50
      add :long, :float, null: true, size: 50
      add :address, :string, null: true, size: 255
      add :invoice_id, references(:invoices, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing), null: true

      timestamps()
    end

    create index(:shipping_addresses, [:invoice_id])
    create index(:shipping_addresses, [:location_id])
  end
end
