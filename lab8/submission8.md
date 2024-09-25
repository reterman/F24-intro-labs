
# Submission 8: Docker Container Management

## Task 1: Container Management

### List Containers
Command:
```bash
sudo docker ps -a
```
**Output:**
```
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
This lists all containers. Currently, none are running.

### Pull Latest Ubuntu Image
Command:
```bash
sudo docker pull ubuntu:latest
```
**Output:**
```
Status: Downloaded newer image for ubuntu:latest
```
This downloads the latest Ubuntu image from Docker Hub.

### Run Container
Command:
```bash
sudo docker run -it --name ubuntu_container ubuntu:latest
```
**Output:**
```
root@a8b72277896d:/# exit
```
Starts an interactive Ubuntu container, which I exited.

### Verify Running Containers
Command:
```bash
sudo docker ps -a
```
**Output:**
```
a8b72277896d   ubuntu:latest   "/bin/bash"   Exited (130) 6 seconds ago   ubuntu_container
```
The container has exited after running.

### Remove Container
Stop and remove the container:
```bash
sudo docker stop ubuntu_container
sudo docker rm ubuntu_container
```
**Output:**
```
ubuntu_container
```
Both commands confirm the container is stopped and removed.

### Final Removal of Image
Command:
```bash
sudo docker rmi ubuntu:latest
```
**Output:**
```
Untagged: ubuntu:latest
```
Removes the Ubuntu image from local storage.

### Create Image Archive
To save the Ubuntu image:
```bash
sudo docker save ubuntu:latest > ./ubuntu_image.tar
```
This creates a `.tar` archive of the Ubuntu image.

#### Verification of File Creation
To confirm that the file was created successfully, I checked the contents of the directory:
```bash
ls -l
```
The output showed that `ubuntu_image.tar` was created with a size of approximately 77MB:
```
-rw-rw-r--  1 reterman reterman 80628224 77M сен 25 20:52 ubuntu_image.tar
```
This indicates that the image was saved correctly and is ready for use.

### Verify Docker Images
Check available images:
```bash
sudo docker images
```
**Output:**
```
REPOSITORY   TAG       IMAGE ID       SIZE
ubuntu       latest    b1e9cef3f297   78.1MB
```
Validates that the image is present in the local repository.

### Compare Image and Archive Sizes
- **Original Image Size:** 78.1 MB
- **Archive File Size:** 77 MB

*The archive file is slightly smaller than the original image. This difference can be attributed to the `.tar` format's compression, which may not fully encapsulate all image layers and metadata present in the Docker image itself.*




### Run Nginx Container
I then pulled the latest Nginx image and started a new container using the command:
```bash
sudo docker run -d -p 80:80 --name nginx_container nginx
```
The output showed that the Nginx image was downloaded successfully:
```
Status: Downloaded newer image for nginx:latest
```
This command runs the Nginx container in detached mode (`-d`), mapping port 80 on the host to port 80 on the container. It is essential for serving web content.

#### Verification of Running Container
To verify that the Nginx container was running, I used:
```bash
sudo docker ps
```
The output confirmed the running container:
```
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                               NAMES
bf41d44ade2   nginx     "/docker-entrypoint.…"   7 seconds ago   Up 5 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   nginx_container
```
This shows that the container is active and ready to serve requests.

### Create HTML File
I created a simple HTML file with the following content:
```html
<html>
<head>
<title>The best</title>
</head>
<body>
<h1>website</h1>
</body>
</html>
```
The content is basic, intended to confirm that the Nginx server is serving files correctly.

#### Copy HTML File into Container
Next, I copied the HTML file into the Nginx container:
```bash
sudo docker cp index.html nginx_container:/usr/share/nginx/html/index.html
```
The output confirmed successful copying:
```
Successfully copied 2.05kB to nginx_container:/usr/share/nginx/html/index.html
```
This step is vital for testing the server's functionality by placing an index file in the appropriate directory.

### Create Custom Image
I then committed the changes in the Nginx container to create a custom image:
```bash
sudo docker commit nginx_container my_website:latest
```
The output included the image ID:
```
sha256:8f94b644b55191a80ded34076358356a2665b7cd4a5d386dd48c82ebec91176a
```
Creating a custom image allows for the reuse of the container's state, including any modifications made.

### Remove Original Container
After committing the changes, I removed the original Nginx container to free up resources:
```bash
sudo docker rm -f nginx_container
```
This command is necessary for maintaining a clean environment and ensuring no unused containers are running.

### Run New Container with Custom Image
I then created a new container using the custom image:
```bash
sudo docker run -d -p 80:80 --name my_website_container my_website:latest
```
This command runs the custom image as a new container, making the website accessible at port 80.

### Test Web Server
To test the web server, I used:
```bash
curl http://127.0.0.1:80
```
The output confirmed that the web server was serving the HTML content:
```html
<html>
<head>
<title>The best</title>
</head>
<body>
<h1>website</h1>
</body>
</html>
```
This step is crucial for ensuring that the container is properly serving the expected content.

### Analyze Image Changes
Finally, I analyzed the changes made to the new image with:
```bash
sudo docker diff my_website_container
```
The output indicated the changes:
```
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf
C /run
C /run/nginx.pid
```
This command lists any changes made to the filesystem within the container, showing which files or directories were created or modified. Understanding these changes helps in maintaining and troubleshooting the Docker environment.
