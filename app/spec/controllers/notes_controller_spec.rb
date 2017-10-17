describe "notes#index action" do
  	it "should successfully respond" do
    	get :index
    	expect(response).to have_http_status(:success)
  	end

	it "should return all Notes in ascending order" do
	  2.times do
	    FactoryGirl.create(:note)
	  end
	  get :index
	  json = JSON.parse(response.body)
	  expect(json[0]['id'] < json[1]['id']).to be true
	end
end