# 10-second arrstack

 This simple script sets up an arr stack using Docker and the following containers:
 
```
 plex - media servier
 sabnzbd - nzb transfer manager
 radarr - movie indexer and organization client
 sonarr - tv indexer and organization client
 overseer - request management server and imdb scraper
 tautulli - metrics and usage monitoring
```

##  What you'll need

- Docker
- Docker-Compose
- A directory for your media files (below code uses /mnt/media, but change to whatever you want.)

##  How to set it up

Clone this repo:
```bash
   git clone https://github.com/gabylonfive/arrstack.git
```

Make the script executable:
```
chmod +x arr_stack_build.sh
```

Run the script:
Run the script and let it do its thing. It’ll set up the directories, create a .env file with your user info, and bring up the stack:
```
./arr_stack_build.sh
```

Access your services:
Once everything’s up and running, you can access the services via the following URLs (replace <your-ip> with the IP address or hostname of your Docker host):

```
Radarr: http://<your-ip>:7878

Sonarr: http://<your-ip>:8989

SABnzbd: http://<your-ip>:8080

Plex: http://<your-ip>:32400/web

Overseerr: http://<your-ip>:5055

Tautulli: http://<your-ip>:8181
```

**Folder Structure**
The script will create a basic folder structure under /mnt/media/:

```
/mnt/media/
├── config/
│ ├── radarr/
│ ├── sonarr/
│ └── ...
├── downloads/
├── incomplete-downloads/
├── movies/
└── tv/

```

You can add your media to the movies and tv directories, and completed downloads go into downloads.

**Ports**

| Service     | Port   |
|-------------|--------|
| **Radarr**  | 7878   |
| **Sonarr**  | 8989   |
| **SABnzbd** | 8080   |
| **Plex**    | 32400  |
| **Overseerr** | 5055 |
| **Tautulli** | 8181 |




