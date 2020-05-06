defmodule Eshop.Repo.Migrations.CreateShippingAddresses do
  use Ecto.Migration

  def change do
    create table(:shipping_addresses) do
      add :lat, :float
      add :long, :float
      add :address, :string
      add :invoice_id, references(:invoices, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:shipping_addresses, [:invoice_id])
    create index(:shipping_addresses, [:location_id])
  end
end
