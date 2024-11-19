# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# create_table "boardgames", force: :cascade do |t|
#   t.string "name"
#   t.string "category"
#   t.integer "player_count"
#   t.text "description"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.float "complexity"
#   
# end
#
print("Resetting all boardgames...")
Boardgame.destroy_all

print("Creating Boardgames...")
catane = Boardgame.new(name: "Catan", 
category: "strategy",
player_count: 4,
description: "In CATAN (formerly The Settlers of Catan), players try to be the dominant force on the island of Catan by building settlements, cities and roads. On each turn dice are rolled to determine which resources the island produces. Players build structures by 'spending' resources (sheep, wheat, wood, brick and ore) which are represented by the relevant resource cards; each land type, with the exception of the unproductive desert, produces a specific resource: hills produce brick, forests produce wood, mountains produce ore, fields produce wheat, and pastures produce sheep.", 
poster: "https://cf.geekdo-images.com/W3Bsga_uLP9kO91gZ7H8yw__imagepage/img/M_3Vg1j2HlNgkv7PL2xl2BJE2bw=/fit-in/900x600/filters:no_upscale():strip_icc()/pic2419375.jpg",
complexity: 2.29)
catane.save!

terraforming_mars = Boardgame.new(name: "Terraforming Mars", 
category: "Strategy",
player_count: 5,
description: "In the 2400s, mankind begins to terraform the planet Mars. Giant corporations, sponsored by the World Government on Earth, initiate huge projects to raise the temperature, the oxygen level, and the ocean coverage until the environment is habitable. In Terraforming Mars, you play one of those corporations and work together in the terraforming process, but compete for getting victory points that are awarded not only for your contribution to the terraforming, but also for advancing human infrastructure throughout the solar system, and doing other commendable things.", 
poster: "https://cf.geekdo-images.com/wg9oOLcsKvDesSUdZQ4rxw__imagepage/img/FS1RE8Ue6nk1pNbPI3l-OSapQGc=/fit-in/900x600/filters:no_upscale():strip_icc()/pic3536616.jpg",
complexity: 3.26)
terraforming_mars.save!


dead_cell = Boardgame.new(name: "Dead Cells: The Rogue-Lite Board Game", 
category: "Strategy",
player_count: 4,
description: "Dead Cells: The Rogue-Lite Board Game is a dungeon-crawler that offers a cooperative rogue-lite experience inspired by the Metroidvania genre, playable with 1-4 players, and with a gameplay of around 45 minutes. Explore the ever-changing island of Dead Cells in this ruthless dungeon crawler. Explore. Kill. Die. Mutate. Repeat.", 
poster: "https://cf.geekdo-images.com/N_5Dz0GeI5dGBzSrBMEqrg__imagepage/img/CIgc9B3SH9T1YoLLemmZF11fupQ=/fit-in/900x600/filters:no_upscale():strip_icc()/pic7336034.jpg",
complexity: 2.33)
dead_cell.save!


arkham = Boardgame.new(name: "Arkham Horror: The Card Game ", 
category: "Card",
player_count: 2,
description: "Something evil stirs in Arkham, and only you can stop it. Blurring the traditional lines between role-playing and card game experiences, Arkham Horror: The Card Game is a Living Card Game of Lovecraftian mystery, monsters, and madness!", 
poster: "https://cf.geekdo-images.com/B5F5ulz0UivNgrI9Ky0euA__imagepage/img/tgpLRvv6AIsClnegErNpAoieeMo=/fit-in/900x600/filters:no_upscale():strip_icc()/pic3122349.jpg",
complexity: 3.55)
arkham.save!
 
wondrous = Boardgame.new(name: "Wondrous Creatures", 
category: "Strategy",
player_count: 4,
description: "Welcome to the world full of fantastic creatures! You are an admirer, a creature enthusiast who will join the journey of forming the world’s leading creature reserve.", 
poster: "https://cf.geekdo-images.com/3ue_3La0WYopTSDER3shUA__imagepage/img/e1uGml9kk6uozJlKGs6LkAOB_wU=/fit-in/900x600/filters:no_upscale():strip_icc()/pic8389014.jpg",
complexity: 3.00)
wondrous.save!

#6
arcs = Boardgame.new(name: "Arcs", 
category: "Strategy",
player_count: 4,
description: "Arcs is a sharp sci-fi strategy game for 2–4 players, set in a dark yet silly universe. Players represent officials from a distant, decaying and neglectful Empire who are now free to vie for dominance whether through battle, gathering scarce resources or diplomatic intrigue. Ready yourself for dramatic twists and turns as you launch into this galactic struggle.", 
poster: "https://cf.geekdo-images.com/XWImAu_3RK61wbzcKboVdA__imagepage/img/OrRrbyeK2D2O8aD_1yoJgcIjkUs=/fit-in/900x600/filters:no_upscale():strip_icc()/pic8145530.png",
complexity: 3.37)
arcs.save!

#7
lords = Boardgame.new(name: "The Lord of the Rings: Duel for Middle-earth ", 
category: "Strategy",
player_count: 2,
description: "A dark rumour rises from Mordor. The Eye turns to Middle-earth. The hour has come. The Fellowship is reunited. The Heroes prepare for battle. Will you play as the Fellowship of the Ring to defend the free races and destroy the One Ring? Or will you play as Sauron and pursue Frodo and Sam while deploying your hordes to the gates of the enemy cities? The destiny of Middle-earth is in your hands!", 
poster: "https://cf.geekdo-images.com/EybxJlUc9rz7F7HVFLqsdw__imagepage/img/MwWN78LRcNAmP9wFrEsbuufPrRE=/fit-in/900x600/filters:no_upscale():strip_icc()/pic8378939.jpg",
complexity: 2.04)
lords.save!

#8
worldorder = Boardgame.new(name: "World Order", 
category: "Strategy",
player_count: 4,
description: "The year is 2010, and the world is drastically changing. While the once-unrivaled influence of the United States is beginning to wane, other major powers are eagerly stepping onto the stage, ready to claim their piece of the geopolitical pie. In the East, Beijing is rising to become a global powerhouse. Simultaneously, Moscow is entangled in an intricate chess game with Washington, ready to counter its every move. And amidst these tumultuous waters, the European Union is trying to carve out its identity and role in the international stage.", 
poster: "https://cf.geekdo-images.com/VXhn4fqu0Dm5WFZ0Pp3tfQ__imagepage/img/_VJMgfvMfZgzQEr1E2kwXzZzpos=/fit-in/900x600/filters:no_upscale():strip_icc()/pic7947832.jpg",
complexity: 3.44)
worldorder.save!

#9
andromeda = Boardgame.new(name: "Andromeda's Edge", 
category: "Strategy",
player_count: 4,
description: "Behold, Andromeda's Edge: A dazzling, uncharted region of space on the edge of the Andromeda Galaxy. Littered with the modular debris of the precursor civilization, patrolled by malicious extragalactic raiders, and bordered by dense nebulae, The Edge is a last resort for the brave and foolhardy who seek a new life beyond the oppressive reach of the Lords of Unity.", 
poster: "https://cf.geekdo-images.com/n3gYugbvd_LHVynDhfoVbw__imagepage/img/oXSEvUzI_l_lZmIJnGo7ikuX-CY=/fit-in/900x600/filters:no_upscale():strip_icc()/pic7334483.jpg",
complexity: 3.60)
andromeda.save!

#10
caledonia = Boardgame.new(name: "Clans of Caledonia ", 
category: "Strategy",
player_count: 4,
description: "Clans of Caledonia is a mid-to-heavy economic game set in 19th-century Scotland. At this time, Scotland made the transition from an agricultural to an industrialized country that heavily relied on trade and export. In the following years, food production increased significantly to feed the population growth. Linen was increasingly substituted by the cheaper cotton and raising sheep was given high importance. More and more distilleries were founded and whisky became the premium alcoholic beverage in Europe.", 
poster: "https://cf.geekdo-images.com/SPuwc6RJ6y4PnTH36Pegsg__imagepage/img/ivHc67HBVg5spOFT4f7CwUbNLT4=/fit-in/900x600/filters:no_upscale():strip_icc()/pic3511783.png",
complexity: 3.46)
caledonia.save!

####USERS######

# create_table "users", force: :cascade do |t|
#   t.string "email", default: "", null: false
#   t.string "encrypted_password", default: "", null: false
#   t.string "reset_password_token"
#   t.datetime "reset_password_sent_at"
#   t.datetime "remember_created_at"
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["email"], name: "index_users_on_email", unique: true
#   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
# end


print("Resetting all users...")
User.destroy_all

print("Creating users...")
owner = User.new(name: "Mark Owner", password: "ABC123", email: "mark@boardmail.com");
owner.save!

second_owner = User.new(name: "Christian OwnerTwo", password: "ABC123", email: "christian@boardmail.com");
second_owner.save!

first_user = User.new(name: "Shaf Buyer", password: "ABC123", email: "shaf@boardmail.com");
first_user.save!

second_user = User.new(name: "Steven BuyerTwo", password: "ABC123", email: "steven@boardmail.com");
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
print("Resetting all Offers...")
Offer.destroy_all

test_offer = Offer.new
test_offer.boardgame = caledonia
test_offer.user = second_user
test_offer.description = "No description"
test_offer.title = "Good offer on Caledonia"
test_offer.price = 15.0