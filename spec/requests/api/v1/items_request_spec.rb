require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    merchant = create(:merchant)
    create_list(:item, 3, merchant: merchant)

    get '/api/v1/items'

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items["data"].count).to eq 3
  end

  it "can show an item" do 
    merchant = create(:merchant)
    db_item = create(:item, merchant: merchant)

    get "/api/v1/items/#{db_item.id}"

    expect(response).to be_successful
    item = JSON.parse(response.body)
    expect(item["data"]["attributes"]["name"]).to eq db_item.name
  end

  it "A new item can be created" do
    merchant = create(:merchant)
    create_list(:item, 2, merchant: merchant)
    item_params = { name: 'item', description: "goofoff", unit_price: "16", merchant_id: merchant.id }
    post "/api/v1/items", params: { item: item_params }

    expect(response).to be_successful
    my_item = Item.last 
    expect(my_item.name).to eq(item_params[:name])
  end

    it "can update an existing item" do
    merchant = create(:merchant)
    id = create(:item, merchant: merchant).id
    previous_name = Item.last.name
    item_params = { name: "Sledge" }

    put "/api/v1/items/#{id}", params: {item: item_params}
    item = Item.find_by(id: id)

    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Sledge")
  end

  it "can destroy an item" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    expect{ delete "/api/v1/items/#{item.id}" }.to change(Item, :count).by(-1)

    expect(response).to be_success
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end