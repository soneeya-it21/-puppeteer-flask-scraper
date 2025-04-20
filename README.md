🧠 Puppeteer-Flask Scraper (Multi-Stage Docker Build)

A compact, containerized web scraping solution built using **Node.js with Puppeteer** for dynamic content extraction and **Python Flask** for lightweight hosting of scraped data. Designed as a multi-stage Docker application to demonstrate practical DevOps skills.

🔧 What It Does

- Uses **Puppeteer + Chromium** to headlessly browse and scrape a user-defined webpage.
- Extracts meaningful data such as the **page title** and **first heading**.
- Outputs the data into a JSON file.
- Uses a **Python Flask** web server to host the JSON as an API endpoint.
- Packaged into a **slim Docker container** using a multi-stage build to keep the final image lightweight.

🚀 Deployment Highlights

✅ Entire project was deployed and executed on an **AWS EC2 Ubuntu instance**  
✅ Instance was accessed using **MobaXterm SSH client**  
✅ Manual setup, code development, testing, Dockerization, and Git operations were all done remotely  
✅ Final app scrapes **[TechCrunch – Startup News](https://techcrunch.com/startups/)** and serves the result at `http://<your-ec2-public-ip>:5000/`


📁 Project Structure

puppeteer-flask-scraper/ 
├── scraper/ 
│ ├── scrape.js # Puppeteer scraping logic 
│ ├── package.json # Node.js dependencies 
├── server.py # Flask web server 
├── requirements.txt # Python dependencies 
├── Dockerfile # Multi-stage build 
└── README.md # Project documentation


🐳 Docker Multi-Stage Build

The `Dockerfile` consists of two stages:

1️⃣ **Scraper Stage** (Node.js)
- Uses `node:18-slim`
- Installs Chromium & Puppeteer
- Runs `scrape.js` to fetch data and write to `scraped_data.json`

2️⃣ **Hosting Stage** (Python)
- Uses `python:3.10-slim`
- Copies the scraped JSON
- Runs a Flask server to serve it over HTTP


📝 How to Use

🔨 Build the Docker Image
docker build --build-arg SCRAPE_URL=https://techcrunch.com/startups/ -t puppeteer-flask-app .

▶️ Run the Container
docker run -p 5000:5000 puppeteer-flask-app

🌐 Access the Scraped Data
Visit: http://<your-ec2-public-ip>:5000/

🔄 Dynamic URL Support
You can scrape any site by passing a different SCRAPE_URL as a build argument : docker build --build-arg SCRAPE_URL=https://example.com -t puppeteer-flask-app .


📦 Requirements
Node.js
puppeteer
Python
flask

Install using:
# Node
cd scraper/
npm install

# Python
pip install -r requirements.txt

📸 Output
{
  "title": "Startup News – TechCrunch",
  "heading": "Startups"
}

![Instance](https://github.com/user-attachments/assets/6e71f54e-710e-402e-aa7f-04acb0191372)
![Assignment](https://github.com/user-attachments/assets/03c9bd2a-a22c-4ecf-b225-abce3a43908b)

From-->http://54.161.227.172:5000/

🤝 Credits
This project was developed as part of a DevOps assignment, showcasing:
Real-world deployment on AWS EC2
Cross-language integration using Node.js + Python
Efficient and minimal Docker multi-stage builds

🧠 Author
Soneeya
Connect on GitHub

