defmodule Payments.TransactionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Payments.Transactions` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        payload: "some payload",
        uuid: "some uuid"
      })
      |> Payments.Transactions.create_order()

    order
  end
end
