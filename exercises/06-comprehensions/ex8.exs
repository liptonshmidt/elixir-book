defmodule Taxes do
  # «Write a function that takes both lists and returns a copy of the orders,
  # but with an extra field, total_amount, which is the net plus sales tax.
  # If a shipment is not to NC or TX, there’s no tax applied.»

  def process do
    orders = [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 130, ship_to: :NC, net_amount:  50.00 ]
    ]

    for [id: id, ship_to: ship_to, net_amount: net_amount] <- orders, do: [id: id, ship_to: ship_to, net_amount: net_amount, total_amount: calc_total_amount(ship_to, net_amount)]
  end

  defp calc_tax_amount(ship_to, net_amount) do
    tax_rates = [ NC: 0.075, TX: 0.08 ]
    tax_rate = tax_rates[ship_to] || 0
    net_amount * tax_rate
  end

  defp calc_total_amount(ship_to, net_amount) do
    net_amount + calc_tax_amount(ship_to, net_amount)
  end
end

IO.inspect Taxes.process
