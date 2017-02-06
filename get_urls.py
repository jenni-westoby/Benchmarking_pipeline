#!/usr/bin/python
from bs4 import BeautifulSoup
import urllib2

#this is a python script that extracts all the fasta urls on array express page

url = "https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-2600/samples/?s_page=1&s_pagesize=500"

content = urllib2.urlopen(url).read()
soup = BeautifulSoup(content)

#open text file to store urls in
f=open('weblinks.txt', 'a')

#extract links from array express page
for link in soup.find_all('a'):
    #if the link contains 'fastq.gz', add it to document
    if '.fastq.gz' in link.get('href'):
        f.write((link.get('href')))
        f.write('\n')

f.close()
