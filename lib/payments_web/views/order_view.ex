defmodule PaymentsWeb.OrderView do
  use PaymentsWeb, :view
  alias PaymentsWeb.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{
      id: order.id,
      uuid: order.uuid,
      payload: order.payload
    }
  end
end
