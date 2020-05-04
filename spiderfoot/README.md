#### 1. About

- URL: `https://github.com/smicallef/spiderfoot`
- Automates OSINT collection so that you can focus on analysis.


#### 2. Build & run
```
# docker build -t spiderfoot https://github.com/smicallef/spiderfoot.git
# docker run -p 8080:5001 -d spiderfoot
```
Port `8080` is the exposed port in your system while `5001` is the one listening in the container.

#### 3. Usage
Go to ``http://$YOURIP:8080``