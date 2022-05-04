# To install cli53, simply head over to their GitHub release page and download the latest release based on your operating system and architecture. We’ll use the Linux version.
```
wget https://github.com/barnybug/cli53/releases/download/0.8.16/cli53-linux-amd64
```

# The file you download is the binary itself, no zip or anything. Simply rename the file for ease of use:
```
mv cli53-linux-amd64 cli53
```

# Next, make the cli53 binary available globally, meaning you won’t have to add the full path to the file whenever you want to use it.
```
mv cli53 /usr/local/bin/cli53
```

# Finally, make the cli53 binary executable
```
chmod +x /usr/local/bin/cli53
```
