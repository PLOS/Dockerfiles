---
title:  "Ambra Demo"
terms: 2
---

[//]: # (Note: render this with pwder.io or Play With Docker classroom)

[![Make document interactive using pwder.io](https://img.shields.io/badge/make%20doc%20interactive-with%20pwder.io-orange.svg)](http://pwder.io/?doc=https://github.com/PLOS/Dockerfiles/blob/develop/AmbraPWD.md)

## How to use this demo

Please, validate the Google capcha to activate the shell on the right. Then, you can either copy the commands yourself, or simply click on the grey boxes to automatically copy commands into the terminal.

Note: "Play With Docker" is a little buggey and seems to work better in Chrome then Firefox unfortunately.

```.term1
echo 'hello world'
```

## Fetch the sample themes and set up the stack
```.term1
git clone https://github.com/PLOS/Dockerfiles.git
cd Dockerfiles
themes/fetch.sh minimal
```

## Bring it up
```.term1
./nv stack ambra_minimal
```

## See the services running
```.term2
ssh -o StrictHostKeyChecking=no node1
cd Dockerfiles
```

```.term2
./nv stack ambra_minimal ps
```

Ping the content repo to see if its up
```.term2
curl -I node1:8085/docs/
```

Wait a minute until you see the logs ending with messages from wombat_1.
Ping the wombat to see if its up.
```.term2
curl node1:8015 | grep Wombat
```

## Visit a running service

- [Wombat](/){:data-term=".term1"}{:data-port="8015"} running on port 8015
- [Content Repo](/docs/){:data-term=".term1"}{:data-port="8085"} running on port 8085


## Ingest an article in rhino
```.term2
curl -X POST --form "archive=@tests/test_data/demo/pone.0153419.zip" localhost:8006/articles
curl -X POST localhost:8006/articles/10.1371++journal.pone.0153419/revisions?ingestion=1
curl -I localhost:8015/article?id=10.1371/journal.pone.0153419
```

See the article rendered in wombat
- [Article 0153419](/article?id=10.1371/journal.pone.0153419){:data-term=".term1"}{:data-port="8015"}
