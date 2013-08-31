require 'sinatra'
require 'json'
require 'net/http'
require 'httparty'

get '/' do
    erb :map
end
get '/cabs/:latitude/:longitude' do
    time = Time.now
    result = HTTParty.post("https://97.64.114.226/", 
                            :body => { :_LOCALE_ => 'en_GB', 
                            :app => 'client',
                            :device => 'android',
                            :version => '2.7.6',
                            :language => 'en_GB',
                            :timestamp => time.strftime("%Y-%m-%d %H:%M:%S"),
                            :epoch => time.to_i*1000,
                            :latitude => params[:latitude].to_f,
                            :longitude => params[:longitude].to_f,
                            :deviceModel => 'Nexus 4',
                            :deviceOS => '4.2.2',
                            :deviceId => ENV['uberdevid'],
                            :vehicleViewId => 1,
                            :messageType => 'PingClient',
                            :token => ENV['ubertoken']
                                     }.to_json)
    results = result["nearbyVehicles"]
    cablist = results.map do |ctype|
        if ctype[1]["sorryMsg"].nil?
            ctype[1]["vehiclePaths"].map do |c|
                cab = c[1][0]
                { :latitude => cab["latitude"], :longitude => cab["longitude"] }
            end
        end
    end
    cablist = cablist.reject{|k,v| v.nil?}
    if cablist.empty? 
        status 404
        @latslongs = { :error_msg => "No cabs found" }.to_json
    else
        @latslongs = cablist.to_json
    end
end