class InsufficientFundsError < StandardError
  def initialize(msg = 'Sorry you do not have enough funds to withdraw at this time')
    super
  end
end
