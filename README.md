# dragonbox-ja2
Jagged Alliance 2 - stracciatella release repository for Pandora and Pyra Handhelds

[Upstream URL](https://ja2-stracciatella.github.io/)

[Repo link](https://pyra-handheld.com/repo/apps/334)

## Datafiles

[Data howto](https://ja2-stracciatella.github.io/how-to-run/)

$ innoextract ~/setup_ja2_gog.exe
mv Data data

NOTE: Please ensure the "data" directory is with lower case d

**** TESTING ****

## local build

run `local_build.dbp.sh`

## docker build

TODO

## pipeline docker build

To trigger new deploy

```
git tag 0.22.1-r1
git push origin 0.22.1-r1
```

# Pandora build

TODO
