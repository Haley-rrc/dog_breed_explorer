require "net/http"
require "json"
require "faker"

puts "Deleting old data"

DogImage.destroy_all
SubBreed.destroy_all
Breed.destroy_all

puts "Downloading data from Dog CEO API"

breed_list_url = URI("https://dog.ceo/api/breeds/list/all")
breed_response = Net::HTTP.get_response(breed_list_url)

unless breed_response.is_a?(Net::HTTPSuccess)
  puts "Could not download data."
  exit
end

breed_data = JSON.parse(breed_response.body)

unless breed_data["status"] == "success"
  puts "The Dog CEO API returned an error."
  exit
end

breed_data["message"].each do |breed_name, sub_breed_names|
  breed = Breed.create!(
    name: breed_name.titleize,
    description: Faker::Lorem.sentence(word_count: 10),
    featured: [true, false].sample
  )

  sub_breed_names.each do |sub_breed_name|
    breed.sub_breeds.create!(
      name: sub_breed_name.titleize
    )
  end

  image_url = URI(
    "https://dog.ceo/api/breed/#{breed_name}/images/random/3"
  )

  image_response = Net::HTTP.get_response(image_url)

  next unless image_response.is_a?(Net::HTTPSuccess)

  image_data = JSON.parse(image_response.body)

  next unless image_data["status"] == "success"

  Array(image_data["message"]).each_with_index do |url, index|
    breed.dog_images.create!(
      image_url: url,
      caption: "#{breed.name} image #{index + 1}"
    )
  end

  puts "Created #{breed.name}"
end

puts
puts "Seed completed."
puts "Breeds: #{Breed.count}"
puts "Sub-breeds: #{SubBreed.count}"
puts "Dog images: #{DogImage.count}"
puts "Total rows: #{Breed.count + SubBreed.count + DogImage.count}"