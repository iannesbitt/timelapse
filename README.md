# timelapse
Shell script to create timelapse from sequential images. Requires ffmpeg and imagemagick

## Installation of requirements
### Ubuntu
```
sudo apt-get update
sudo apt-get install ffmpeg imagemagick
```

### Arch
```
sudo aurman -Syu ffmpeg imagemagick
```

### Mac
- install [Homebrew](https://brew.sh/)
```
brew install ffmpeg
brew install imagemagick
```

### All OSs: make sure timelapse.sh is in your $PATH


## Usage
- download this script
```
cd ~
git clone https://github.com/iannesbitt/timelapse.git
cd timelapse
```
- make sure this script is executable and in your $PATH
```
chmod +x timelapse.sh
PATH=${PATH}:$(pwd)
```
(or set your search path permanently by adding `export PATH=${PATH}:$(pwd)` to your `.bashrc` file)
- change directory `cd` to the folder containing your images
```
cd ~/Pictures/folder/here
```
- run the script
```
timelapse
```

The script will make two subfolders (`tmp/` and `0video/` by default). Resized images will be in `tmp/`, numbered sequentially. Video location will be `0video/vid.mp4` by default.
