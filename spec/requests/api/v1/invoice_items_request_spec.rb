require 'rails_helper'

describe "InvoiceItems API" do
  it "sends a list of invoice_items" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    item = create(:item, merchant: merchant)
    invoice_item = create_list(:invoice_item, 3, invoice: invoice, item: item)

    get "/api/v1/invoice_items"
    expect(response).to be_successful
    result = JSON.parse(response.body)["data"]
    expect(result.count).to eq 3
  end

  it "can show an invoice_item" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    item = create(:item, merchant: merchant)
    invoice_item = create(:invoice_item, invoice: invoice, item: item)

    get "/api/v1/invoice_items/#{invoice_item.id}"
    expect(response).to be_successful
    result = JSON.parse(response.body)["data"]
    expect(result["attributes"]["id"]).to eq invoice_item.id
  end
end