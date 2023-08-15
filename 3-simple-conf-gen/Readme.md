## Step 1: Generate router configuration base on template

We the data file and the template file. CUE has some limited some scripting capabilities that we can use to generate the configuration. 

```console
➜  cue vet
➜  cue cmd -t "name=Host1" gen
➜  cue cmd -t "name=Host2" gen
```

The first command **cue vet** validates the data, but actually the configure generation implicitly validate the data and woudl fail if the data were incorrect based on the schema. 
