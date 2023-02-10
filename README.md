# PROJECT 
# # SAMPLE IMAGE
![project-3](https://user-images.githubusercontent.com/111736742/216734763-43986602-d07a-4b55-82d3-6f4ab9d08f64.jpg)

## Configure Insecure-registries 
```bash
  cd /etc/docker
  vi daemon.json
  ----------------------
  #place this
  {
  "insecure-registries" : ["3.109.60.48:8083"]
    #"insecure-registries" : ["Public-Ipaddress:8083"]---------->Publicip of nexus
  }
  ---------------------------------------
  systemctl restart docker
  docker login -u admin --password 12345 3.109.60.48:8083
```
