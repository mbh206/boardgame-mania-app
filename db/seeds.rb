require "open-uri"
require "nokogiri"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts("Seeding process start!")


puts("Deleting all offers...")
Offer.destroy_all

puts("Deleting all users...")
User.destroy_all


puts("Deleting all users...")
Boardgame.destroy_all

puts("Creating Boardgames...")

begin
  bgg_top_serialized = URI.open("https://boardgamegeek.com/xmlapi2/hot?type=boardgame").read
  bgg_top_xml = Nokogiri::XML(bgg_top_serialized)

  bgg_top_xml.root.xpath("item").each do |item|
    item_value = item.attribute_nodes[0].value
    bgg_detail_serialized = URI.open("https://boardgamegeek.com/xmlapi2/thing?id=#{item_value}").read
    #<name type="primary" sortindex="1" value="Dune: Imperium – Bloodlines"/>
    bgg_detail_xml = Nokogiri::XML(bgg_detail_serialized)
    #p bgg_detail_xml
    name = bgg_detail_xml.root.children.xpath("name")[0].attribute_nodes[2].value

    unless Boardgame.find_by(name: name)
      puts  "Seeding https://boardgamegeek.com/xmlapi2/thing?id=#{item_value} ..."

      #description
      description = bgg_detail_xml.root.children.xpath("description").text
      #maxplayers
      maxplayers = bgg_detail_xml.root.children.xpath("maxplayers")[0].attribute_nodes[0].value
      #image
      image = bgg_detail_xml.root.children.xpath("image").text
      #thumbnail
      thumbnail = bgg_detail_xml.root.children.xpath("thumbnail").text
      #<link type="boardgamecategory" id="1050" value="Ancient"/>
      category = bgg_detail_xml.root.children.xpath('link[@type="boardgamecategory"]')[0].attribute_nodes[2].value

      Boardgame.create!(name: name,
      description: description,
      player_count: maxplayers,
      poster: image,
      thumbnail: thumbnail,
      category: category)
    end
    sleep 1
  end
rescue OpenURI::HTTPError
  puts "BGG API responded with a 'Too many request', #{Boardgame.all.count} seeded ... Continue"
end

puts("Creating users...")
owner = User.new(name: "Mark", password: "123123", email: "mark@me.com");
owner.save!

second_owner = User.new(name: "Christian", password: "123123", email: "christian@me.com");
second_owner.save!

first_user = User.new(name: "Shaf", password: "123123", email: "shaf@me.com");
first_user.save!

second_user = User.new(name: "Steven", password: "123123", email: "steven@me.com");
second_user.save!

# create_table "offers", force: :cascade do |t|
#   t.bigint "boardgame_id", null: false
#   t.bigint "user_id", null: false
#   t.float "price"
#   t.text "description"
#   t.string "title"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "photos"
#   t.index ["boardgame_id"], name: "index_offers_on_boardgame_id"
#   t.index ["user_id"], name: "index_offers_on_user_id"
# end



rental_offers = [
  [
    "good",
    [
      "The game is in good condition, just a few scratches on the box.",
      "All pieces are included, but the box has some wear and tear.",
      "Some cards have slight discoloration, but overall it's well-maintained.",
      "The board has minor scuffs, but gameplay is unaffected.",
      "The box corners are slightly frayed, but the contents are complete.",
      "A couple of tokens are a little worn, but everything works fine.",
      "Some fading on the rulebook cover, but all pages are legible.",
      "The card edges show some wear, but they’re all usable.",
      "The box artwork has a small tear, but components are intact.",
      "Game has been played several times but is still in good shape.",
      "The spinner is slightly loose but still functional.",
      "The dice have slight discoloration, but numbers are readable.",
      "Minor scratches on the game board but nothing serious.",
      "The instruction booklet is a bit crinkled but fully readable.",
      "The storage insert inside the box is missing, but pieces are sorted.",
      "One corner of the box is dented, but it closes properly.",
      "Some tiles are lightly scratched but still recognizable.",
      "The game board folds show some signs of wear.",
      "Some pawns are slightly chipped but fully functional.",
      "The plastic bag holding the pieces is torn but everything is accounted for."
    ]
  ],
  [
    "excellent",
    [
      "Looks brand new, only used once!",
      "Pristine condition with all components intact.",
      "Perfect condition, the box is like new!",
      "Still in shrink wrap, never opened!",
      "Absolutely flawless, no signs of use.",
      "Components are sorted neatly, looks unused.",
      "Even the box smells new!",
      "Everything included and perfectly preserved.",
      "No visible wear or scratches at all.",
      "Cards are sharp and unmarked.",
      "Game tokens and pawns look freshly printed.",
      "The dice have never been rolled.",
      "Perfectly smooth board, no signs of folding wear.",
      "The instruction manual is in pristine condition.",
      "All components still have their original packaging.",
      "The box closes tightly with no signs of wear.",
      "Absolutely no creases or scratches on the box or components.",
      "The game pieces shine like they're just off the production line.",
      "No fading or discoloration on any part of the game.",
      "Even the inner packing materials are intact."
    ]
  ],
  [
    "used",
    [
      "Missing one token, but still playable.",
      "The rulebook is slightly torn, and some cards are creased.",
      "Replaced some pawns with similar pieces from another game.",
      "Some cards are marked, but gameplay is not affected.",
      "The box is heavily worn but holds everything securely.",
      "The game board has visible creases from folding.",
      "A couple of cards are taped together but still readable.",
      "One dice is missing, replaced with a generic substitute.",
      "The plastic insert in the box is cracked but usable.",
      "One pawn is missing and replaced with a marker.",
      "The original rulebook is missing, printed a copy instead.",
      "The spinner doesn’t work, replaced it with a dice mechanic.",
      "Some cards are sticky, but most are fine.",
      "Several pieces have been hand-painted to replace lost ones.",
      "The edges of the game board are peeling slightly.",
      "The dice have been heavily used and are slightly rounded.",
      "Box has been taped to fix broken corners.",
      "Some tokens have been replaced with coins as substitutes.",
      "Cards have been laminated to prevent further damage.",
      "Game works but looks heavily loved by its previous owners."
    ]
  ]
]

boardgame_reviews = [
  { rating: 5, description: "A fantastic game that's perfect for family and friends." },
  { rating: 4, description: "Great mechanics and fun gameplay, but a bit complex for beginners." },
  { rating: 3, description: "Decent game, but can feel repetitive after a few sessions." },
  { rating: 5, description: "An absolute classic! Easy to learn and endlessly replayable." },
  { rating: 2, description: "The components are nice, but the gameplay feels unbalanced." },
  { rating: 4, description: "Engaging and strategic, with just the right amount of challenge." },
  { rating: 1, description: "Not enjoyable—overly complicated and too long." },
  { rating: 5, description: "An immersive experience with beautiful artwork and deep strategy." },
  { rating: 3, description: "It’s okay, but there are better options in the same genre." },
  { rating: 4, description: "Fun for casual players and seasoned gamers alike." },
  { rating: 5, description: "A must-have for any board game enthusiast." },
  { rating: 2, description: "The rules are confusing, and the gameplay is slow." },
  { rating: 4, description: "Great for parties! Simple to play and very entertaining." },
  { rating: 5, description: "A game with a perfect blend of strategy and luck." },
  { rating: 3, description: "It’s fun but lacks variety in the long run." },
  { rating: 1, description: "The theme is interesting, but the game design is poor." },
  { rating: 5, description: "Incredible! Every playthrough feels fresh and exciting." },
  { rating: 4, description: "A solid choice for game night, especially for strategy lovers." },
  { rating: 2, description: "Looks great, but it’s not as engaging as I hoped." },
  { rating: 3, description: "Average game—neither great nor terrible." }
]


puts("Generating offers...")
file = URI.parse("https://cf.geekdo-images.com/JpP6IyLwAnvCZX8kuiGPEg__imagepage/img/dITvv1dckVXuWiz-hWY-If-y2dU=/fit-in/900x600/filters:no_upscale():strip_icc()/pic3771122.jpg").open
nb = 100
nb.times.each do |i|

  print("Offer creation progress #{i}/#{nb}...")

  rental_offer = rental_offers.sample

  offer = Offer.new(title: rental_offer[0], description: rental_offer[1].sample, price: rand(5..30))
  offer.photos.attach(io: file, filename: "photosample", content_type: "image/png" )
  offer.boardgame = Boardgame.all.sample
  offer.user = User.all.sample
  rand(10).times do 
    review = Review.new(boardgame_reviews.sample)
    review.user = User.all.sample
    review.save
    offer.reviews.push(review)
  end
  offer.save
  print("\r")
end
print("Seeding process finished!")
