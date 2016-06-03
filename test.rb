require 'yaml'
require 'open-uri'
require 'json'

t=Thread.new{
  problem = YAML.load(File.open('yaml.yml'))

  problem.each do |k,v|

    html_response = nil
    open(v) do |http|
      html_response = http.read
    end

    File.new("/home/benny/RubymineProjects/untitled/config/a.json","w").syswrite(html_response)

    data = JSON.parse(File.read("/home/benny/RubymineProjects/untitled/config/a.json"))

    data.each do |k,v|
      if v.to_s["type"]
        puts "key: #{k}  ||  value: #{v}"
      end
    end
  end
}
  t.join
