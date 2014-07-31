module ApplicationHelper
  def format_usd(amount)
    number_to_currency(amount.to_f / 100.0)
  end
end
