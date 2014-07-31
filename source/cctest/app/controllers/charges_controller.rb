class ChargesController < ApplicationController
  def index
    @failed = Charge.failed
    @disputed = Charge.disputed
    @successful = Charge.successful
  end
end
