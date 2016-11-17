# fastcodeml_docker
fastcodeml inside a docker container

# installation

you can download the docker container for 1.3.0 or 1.1.0:

1.3.0 version:

`sudo docker run -i -t --entrypoint /bin/bash philippmuench/fastcodeml`

1.1.0 version:

`sudo docker run -i -t --entrypoint /bin/bash philippmuench/fastcodeml:1.1.0`

you can mount your data to the docker container e.g. by using

`sudo docker run -v my_data_folder:/data  -i -t --entrypoint /bin/bash philippmuench/fastcodeml`

then you can access your data inside the docker container in the `/data` folder

# usuage

input codon alignment data must be in phylip format (e.g. pal2nal output)
input tree must be in newick format

for v.1.3.0: `fast -m 22 -bl -nt 1 -hy 0 data/tree.nwk data/msa.phy`

for v.1.1.0: `fast -m 22 -bf -hy 0 data/tree.nwk data/msa.phy`
