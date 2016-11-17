# fastcodeml_docker
fastcodeml inside a docker container

# installation

1.3. version:

`sudo docker run -i -t --entrypoint /bin/bash philippmuench/fastcodeml`

to use the 1.1.0 version:

`sudo docker run -i -t --entrypoint /bin/bash philippmuench/fastcodeml:1.1.0`

you can mount your data to the docker container e.g. by using

`sudo docker run -v my_data_folder:/data  -i -t --entrypoint /bin/bash philippmuench/fastcodeml`

then you can access your data inside the docker container in the `/data folder`

# usuage

input nucleotide msa data must be in phylip format
input tree must be in newick format (e.g. by using clearcut)

for 1.3: `fast -m 22 -bl -nt 1 -hy 0 data/tree.nwk data/msa.phy`

for 1.1.0: `fast -m 22 -bf -hy 0 data/tree.nwk data/msa.phy`
