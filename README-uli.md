Ulis Notizen zu "files.md"
==========================

Bauen
-----

```
go build -o "files-md-server-$(git describe --tags)" ./cmd/server
# Erzeugt "files-md-server-0.1" (= sauberes Bauen von einem Tag)
# oder "files-md-server-0.1-2-g3c0d4d0b" (= unsauberes Bauen einer Zwischenversion)
```

Version veröffentlichen
-----------------------

- Versionsnummer festlegen: 0.2
- Versionshistorie in README-uli.md erweitern
- Neuen Stand von README-uli.md in Git speichern: `git commit -m 0.2 README-uli.md"
- Git-Tag erzeugen: `git tag 0.2`
- Git-Tag an Github übertragen: `git push --tags`
- Bauen: `go build -o "files-md-server" ./cmd/server`
- Verpacken: `tar -cf - ./files-md-server ./web|xz -c9 >"files-md-$(git describe --tags).tar.xz"`
- Virencheck
- Signieren
- Release auf Github erzeugen
- Hochladen: files-md-0.2.tar.xz, files-md-0.2.tar.xz.virustotal.json, files-md-0.2.tar.xz.ssh-sig

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

Versionen und Änderungen
------------------------

### 0.2 - Zweite Testversion

- Änderungen an der Handhabungsbeschreibung
- Neues Skript: uli-package.sh

### 0.1 - Erste Testversion

Dies ist eine erste Testversion!
