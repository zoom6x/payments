defmodule Payments.Transactions.Order do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orders" do
    field :payload, :map
    field :uuid, :string

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> Payments.Transactions.insert_uuid()
    |> cast(attrs, [:uuid, :payload])
    |> validate_required([:uuid, :payload])
  end
end
