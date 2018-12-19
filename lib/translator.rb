require "yaml"
require "pry"

path = "./lib/emoticons.yml"

def load_library(path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  lib = YAML.load_file(path)
  lib.each do |k, a|
    hash["get_meaning"].merge!({ a[1] => k })
    hash["get_emoticon"].merge!({ a[0] => a[1] })
  end
  hash
end

def get_japanese_emoticon(path, en_emote)
  file = load_library(path)
  lib = YAML.load_file(path)
  jap_emote = file["get_emoticon"][en_emote]
  jap_emote ? jap_emote : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, jap_emote)
  file = load_library(path)
  binding.pry
  #lib = YAML.load_file(path)
  #en_meaning = nil
  #lib.each {|k, a| en_meaning = k if jap_emote == a[1]}
  en_meaning = file["get_meaning"][jap_emote]

  en_meaning ? en_meaning : "Sorry, that emoticon was not found"
end

puts get_english_meaning(path, "(Ｔ▽Ｔ)")
