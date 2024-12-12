BoardGame Mania
1. Project Name:
BoardGame Mania

2. What the Project Does:
BoardGame Mania is a marketplace web application that allows board game enthusiasts to rent out their personal game collections to others. This platform connects game owners with those looking to try new board games without making a full purchase, fostering a community of shared fun and discovery.

3. Target Users:
Renters (Game Owners): Individuals who own board games and wish to earn extra income by renting them out.
Rentees (Players): Users who want to try out board games before buying, or simply enjoy playing different games without building their own collection.

4. How It Works:
Landing Page: New visitors can quickly understand what the app is about—renting and discovering new board games—through a brief introduction and appealing visuals.
Main Page (Game Listings): A dynamically updated list of recent rental listings. Users can browse through newly added games, search for specific titles, or filter the displayed games to find something that piques their interest.
Game Detail Page: After selecting a game, users see multiple rental offers from various owners. Each offer displays unique conditions, pricing, and availability. Users can select their preferred offer, choose rental dates, and see the total calculated price.
User Dashboards:
Renter Dashboard: Displays active and past rentals, including pending requests that require approval.
Rentee Dashboard: Shows current and past rentals, as well as upcoming return dates and any pending requests awaiting confirmation.

5. Technologies Used & Why:
Ruby on Rails: Used for its robust ecosystem, rapid development capabilities, and MVC framework that enables easy maintenance and scalability.
HTML & CSS: For crafting the front-end structure and styling. These foundational web technologies ensure semantic markup and responsive design.
JavaScript: Enables interactive features like searching, date selection, price calculation, and dynamic updates on the frontend without full page reloads.

Installation & Running the Project

Prerequisites
Ruby: Ensure you have Ruby (at least version 2.7 or above) installed.
Rails: Make sure Rails (6.0 or above) is installed.
Bundler: Typically installed with Ruby, used to manage project gems.
Database: A running instance of PostgreSQL or your chosen supported database.

Steps to Install
Clone the Repository:

git clone https://github.com/your-username/boardgame-mania.git
cd boardgame-mania
Install Dependencies:

bundle install
yarn install
Set up the Database:
Update the config/database.yml file with your database credentials. Then run:

rails db:create
rails db:migrate
rails db:seed
Run the Server:

rails server
The application should now be accessible at http://localhost:3000.

Additional Notes
Environment Variables:
If applicable, configure necessary API keys, secrets, or credentials in .env or your environment configuration files.
Testing:
You can run the test suite (if included) with:

rails test
Deployment:
For production deployment, ensure you have a production-ready database, have run rails assets:precompile, and followed best practices for server and environment configuration.
