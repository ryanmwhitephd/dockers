FROM alpine-r:latest

ENV RPKGS RecordLinkage

RUN Rscript -e 'install.packages(commandArgs(TRUE))' ${RPKGS}
            
            
