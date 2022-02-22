require 'negative_amount_error'

describe NegativeAmountError do
  it 'can raise a NegativeAmountError' do
    expect { raise NegativeAmountError }.to raise_error(NegativeAmountError)
  end

  it 'raises a custom message' do
    expect { raise NegativeAmountError }.to raise_error(
      'Amount must be a greater than £0.00'
    )
  end
end
