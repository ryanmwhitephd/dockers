FROM ryanmwhitephd/alpine-r:73bdef0

ENV RPKGS RecordLinkage

RUN Rscript -e 'install.packages(commandArgs(TRUE))' ${RPKGS}
            
            
