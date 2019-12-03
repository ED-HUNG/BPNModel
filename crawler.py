import requests
from bs4 import BeautifulSoup
res = requests.get('https://www.ptt.cc/bbs/joke/M.1575307568.A.F6F.html', verify=False)
soup = BeautifulSoup(res.text)
#for entry in soup.select('.r-ent'):
 #   print(entry.select('.title')[0].text,entry.select('.date')[0].text,entry.select('.author')[0].text)
articles = soup.select('.article-metaline')
#print(articles)
for each_item in articles:
    print(each_item.select('span.article-meta-value'))
    print(each_item.select('div.#text'))

#for article in articles:
    #messages = article.find('span', 'text')
   # print(messages)

