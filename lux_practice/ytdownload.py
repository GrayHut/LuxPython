
# This program is not picking the path I want to store the downloaded file...

import yt_dlp
import os

url=input("Enter the youtube url: ")
save_as=input("Enter location: ").strip()

if not save_as:
    save_as=os.getcwd()

else:
     save_as=os.path.expanduser(save_as)
     save_as=os.path.abspath(save_as)
     #os.makedirs(save_as, exist_ok=True)


try:
    if not os.path.exists(save_as):
        os.makedirs(save_as, exist_ok=True)
    if not os.access(save_as, os.W_OK):
        raise PermissionError(f"No write permission for directory {save_as}")
except PermissionError as e:
    print(f"Error: {e}")
    print("Select a location where you have write permissions")
    exit(1)
except Exception as e:
    print(f"Error while creating directory {save_as}: {str(e)}")
    exit(1)


output_temp=os.path.join(save_as, '%(title)s.%(ext)s')

ydl_opts={
    'format': 'bestaudio/best',
    'postprocessors': [{
        'key': 'FFmpegExtractAudio',
        'preferredcodec': 'mp3',
        'preferredquality': 192,
    }],
    'outtmpl': '%(title)s.%(ext)s',
}


try:
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([url])
    print(f"Downloaded successfully & converted to mp3. File saved in {save_as}")
except Exception as e:
    print(f"An ERROR occurred during dowload/conversion: {str(e)}")
    print("Check verbose above for details")