shared_examples 'acts examples' do |resource_client|
  context "when get list #{resource_client} successfully" do
    it "with existing #{resource_client.to_s.downcase.pluralize}" do
      get "/v1/#{resource_client.to_s.downcase.pluralize}"

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['data'].size).to eq(data.size)
    end
  end

  context "when get #{resource_client} successfully" do
    it "with existing #{resource_client.to_s.downcase}" do
      get "/v1/#{resource_client.to_s.downcase.pluralize}/#{data.first.id}"

      body = JSON.parse(response.body)
      first_data = data.first
      expect(response).to have_http_status(:success)
      resource_class = "#{resource_client}Resource".classify.constantize

      resource_class::ATTRIBUTES.each do |attribute|
        next if resource_class::EXCEPT_TEST_ATTRIBUTES.include?(attribute)

        expect(body['data']['attributes'][attribute.to_s]).to eq(first_data.send(attribute))
      end
    end
  end

  context "when create #{resource_client}" do
    it "will create #{resource_client} successfully" do
      post "/v1/#{resource_client.to_s.downcase.pluralize}", params: create_params

      expect(response).to have_http_status(:success)
    end
  end

  context "when get #{resource_client} ordered" do
    it 'by id asc' do
      get "/v1/#{resource_client.to_s.downcase.pluralize}?sort=id"

      expect(response).to have_http_status(:success)
      body = JSON.parse(response.body)
      ids = body['data'].map { |r| r['id'] }

      expect(ids.sort).to eq(ids)
    end

    it 'by id desc' do
      get "/v1/#{resource_client.to_s.downcase.pluralize}?sort=-id"

      expect(response).to have_http_status(:success)
      body = JSON.parse(response.body)
      ids = body['data'].map { |r| r['id'] }

      expect(ids.sort.reverse).to eq(ids)
    end
  end

  context "when get #{resource_client} with pagination " do
    it 'successfully' do
      get "/v1/#{resource_client.to_s.downcase.pluralize}?page[number]=2&page[size]=2"

      expect(response).to have_http_status(:success)
      body = JSON.parse(response.body)

      expect(body['data'].size).to eq(2)
    end
  end

  context "when destroy #{resource_client}" do
    it 'successfully' do
      delete "/v1/#{resource_client.to_s.downcase.pluralize}/#{data.first.id}"

      expect(response).to have_http_status(:success)
      body = JSON.parse(response.body)
      new_first_data = data.first

      expect(body['data']['id']).not_to eq(new_first_data.id)
    end
  end
end
