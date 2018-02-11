import requests
from bs4 import BeautifulSoup


url = "https://bittigermusicplayerdata.s3-us-west-2.amazonaws.com/"

r = requests.get(url)

content = r.content

soup = BeautifulSoup(content, "lxml")

# Extract all key tags with a zip file link
keys = soup.find_all("key")

# Save all zip file links to a list
file_links = [url + key.text for key in keys]

# Save file_links as a text file
file_save = open('/Users/benchan/Downloads/capstone/links.txt', 'w')

for link in file_links:
    file_save.write("%s\n" % link)
