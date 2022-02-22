class NegativeAmountError < StandardError
  def initialize(msg = 'Amount must be a greater than £0.00')
    super
  end
end