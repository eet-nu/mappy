require 'rubygems'
require 'bundler/setup'
require 'smappy'
require 'sinatra'

class Mappy < Sinatra::Base
  
  def self.generate_map zoomlevel, latitude, longitude, width, height
    map = Smappy::StaticMap.new(
      zoomlevel: zoomlevel,
      center:    [latitude, longitude],
      width:     width,
      height:    height,
      tile_url_template: 'http://a.tiles.mapbox.com/v3/mapbox.mapbox-streets/%{zoomlevel}/%{x}/%{y}.png'
    )
  end
  
  get '/:zoomlevel/:location/:size.png' do
    zoomlevel     = params[:zoomlevel].to_i
    lat,   lng    = params[:location].split(',').map(&:to_f)
    width, height = params[:size].split('x').map(&:to_i)
    
    map = Mappy.generate_map zoomlevel, lat, lng, width, height
    img = map.to_image
    
    content_type 'image/png'
    img.to_blob
  end
end
