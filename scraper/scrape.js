const puppeteer = require('puppeteer');

(async () => {
  const url = process.env.SCRAPE_URL || 'https://example.com';
  const browser = await puppeteer.launch({
    executablePath: process.env.PUPPETEER_EXECUTABLE_PATH || '/usr/bin/chromium',
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
  });

  const page = await browser.newPage();

  try {
    await page.goto(url, {
      waitUntil: 'domcontentloaded',
      timeout: 60000, // 60 seconds timeout
    });

    const title = await page.title();
    const heading = await page.$eval('h1', el => el.innerText);

    const data = {
      title,
      heading
    };

    const fs = require('fs');
    fs.writeFileSync('scraped_data.json', JSON.stringify(data, null, 2));

    console.log('Scraping completed:', data);
  } catch (error) {
    console.error('Error during scraping:', error);
    process.exit(1);
  } finally {
    await browser.close();
  }
})();

