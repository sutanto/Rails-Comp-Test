require "spec_helper"

describe "Charges" do
  it "shows charges in correct places" do
    create_list(:failed_charge, 1)
    create_list(:disputed_charge, 2)
    create_list(:charge, 3) # successful

    visit root_path

    expect(page).to have_selector('.failed.charges li', count: 1)
    expect(page).to have_selector('.disputed.charges li', count: 2)
    expect(page).to have_selector('.successful.charges li', count: 3)
  end
end
