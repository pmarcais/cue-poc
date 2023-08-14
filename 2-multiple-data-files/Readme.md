## Step 1: Generate a CUE data model from a YAMl data model

Let's say the network data model is broken in multiple YAML files, maybe per region.

```console
➜  cue-poc touch host-region-amer.cue
➜  cue-poc touch host-region-apac.cue
➜  cue import *.yml -f
```

**cue import** has automaticly imported data from host-region-amer.yml in host-region-amer.cue and has done the same with apac. 

## Step 2: Validate the data model 

```console
cue vet *.yml
cue vet 
``````

The first command validates all the YAML files in the directory.
The second command validates the CUE data in the same package, so package needs to be specified.