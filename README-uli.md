Ulis Notizen zu "files.md"
==========================

Bauen
-----

```
go build -o files-server ./cmd/server
```

Module aktualisieren
--------------------

"files.md" nutzt lokale Kopien aller
Go-Module. Sie liegen unterhalb von "vendor".

- Go-Version manuell anpassen:
  ```diff
  diff --git a/go.mod b/go.mod
  index 4f95b908..b15d5da4 100644
  --- a/go.mod
  +++ b/go.mod
  @@ -1,26 +1,25 @@
   module github.com/zakirullin/files.md
   
  -go 1.24
  +go 1.27.4
   
  ```
- Module aktualisieren: `go get -u ./...`
- Module aufräumen: `go mod tidy`
- "vendor"-O=rdner aktualisieren:
  - `rm -rf vendor`
  - `go mod vendor`
  - `git add vendor`
