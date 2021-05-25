FactoryBot.define do
  factory :purchase_addressee do
    post_code {'123-4567'}
    prefecture_id {6}
    municipality { '横浜市' }
    address {'金沢1-3'}
    building_name {'コーポ横浜'}
    tel_number {'09019682258'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end