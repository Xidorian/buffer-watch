# buffer-watch

Windows launcher that makes mpv buffer a whole streamed video before playing it,
for slow connections. The buffer is a temp disk cache, deleted when mpv closes.

Works for any site yt-dlp supports that isn't DRM-protected.

## Setup (once, in PowerShell, not as admin)

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
scoop install git
scoop bucket add extras
scoop install mpv yt-dlp
git clone https://github.com/Xidorian/buffer-watch.git $HOME\buffer-watch
```

Then make a desktop shortcut to `%USERPROFILE%\buffer-watch\buffer-watch.bat`.

## Use

1. Run `buffer-watch.bat`, paste the video page URL, press Enter.
2. mpv opens paused and fills the buffer (shown on the seek bar).
3. Space to play. Close mpv when done; the cache is deleted.

## Update

```powershell
cd $HOME\buffer-watch; git pull
```

## Tweaks (in `buffer-watch.bat`)

- `height<=1080` — quality cap; lower to `720` if buffering is too slow.
- `cookies-from-browser=firefox` — reuses Firefox logins for sites that need
  sign-in. Remove the line if Firefox isn't installed. Chrome's cookies can't
  be read on Windows.
- `yt-dlp` breaks when sites change; `scoop update yt-dlp` usually fixes it.
