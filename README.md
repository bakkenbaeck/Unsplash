# Unsplash

Project owner: [@marijnschilling](https://github.com/marijnschilling)

PR buddie: [@elland](https://github.com/elland)

A minimal https://unsplash.com client

## Updating generated models

- Install [mogenerator](http://rentzsch.github.io/mogenerator/)
- Run the following command in Terminal.app

```
mogenerator \
--swift \
--model Library/Models/DataModel.xcdatamodeld/DataModel.xcdatamodel \
--output-dir Library/Models \
--v2
```
