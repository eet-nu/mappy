require 'spec_helper'
require 'base64'

describe Mappy do
  let(:app) { Mappy }
  
  describe 'actions' do
    context "GET /:zoomlevel/:location/:size" do
      let(:mock_data) do
        # Smallest possible PNG image encoded as base64:
        data = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAA" +
               "ACklEQVR4nGMAAQAABQABDQottAAAAABJRU5ErkJggg=="
        
        Base64.decode64(data)
      end
      
      let(:mock_image) { mock(to_blob:  mock_data)  }
      let(:mock_map)   { mock(to_image: mock_image) }
      
      before do
        Mappy.stub(:generate_map).and_return(mock_map)
      end
      
      it 'generates a map from the given params' do
        Mappy.should_receive(:generate_map)
             .with(14, 40.702147, -74.015794, 270, 168)
             .and_return(mock_map)
        
        get '/14/40.702147,-74.015794/270x168.png'
      end
      
      it 'sets the Content-Type to "image/png"' do
        get '/14/40.702147,-74.015794/270x168.png'
        response.headers['Content-Type'].should == 'image/png'
      end
      
      it "renders the map's image" do
        get '/14/40.702147,-74.015794/270x168.png'
        response.body.should == mock_data
      end
    end
  end
  
  alias :response :last_response
  alias :request  :last_request
end
